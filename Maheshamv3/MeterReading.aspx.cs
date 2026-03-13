using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class MeterReading : System.Web.UI.Page
    {
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow.AddMonths(-1), INDIAN_ZONE);
                _DropDownListMonth.SelectedValue = indianTime.ToString("MMM").ToUpper();
                _DropDownListYear.SelectedValue = indianTime.Year.ToString();
                BindFacilityDropdown();
            }
        }

        protected void BindFacilityDropdown()
        {
            _LiteralMSG.Text = "";

            bool showAll = _DropDownListFacility.SelectedValue == "1000";

            string query = $@"SELECT f.ID, f.Building + ' ' + f.Title + ' ' + f.Location AS Title FROM Facility f WHERE f.Active = 1 {(showAll ? "" : $"AND f.ID NOT IN (SELECT Facility FROM MeterReading WHERE Year={_DropDownListYear.SelectedValue} AND MonthNo={_DropDownListMonth.SelectedIndex + 1})")} ORDER BY f.ID";

            Utility._BindDropdown(_DropDownListFacility, query, "ID", "Title", true);
            if (!showAll) _DropDownListFacility.Items.Add(new ListItem("Show ALL", "1000"));
        }

        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (_DropDownListFacility.SelectedIndex == 0)
            {
                _LiteralMSG.Text = "<div class='p-3 mb-2 bg-danger text-white'>Please select a facility.</div>";
                return;
            }

            DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
            string fileName = "";

            if (_FileUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(_FileUpload.FileName);
                fileName = $"{_DropDownListFacility.SelectedValue}_{_DropDownListMonth.SelectedValue}{indianTime.Year}{ext}";
                _FileUpload.SaveAs(Server.MapPath("~/MeterReading/" + fileName));
            }

            // INSERT / UPDATE MeterReading
            Utility.ExecuteQuery(@"IF EXISTS (SELECT 1 FROM MeterReading WHERE Facility=@Facility AND Year=@Year AND MonthNo=@MonthNo)
                    UPDATE MeterReading SET Reading=@Reading, ReadingFile=@ReadingFile, ReadingOn=@ReadingOn, ReadingBy=@ReadingBy WHERE Facility=@Facility AND Year=@Year AND MonthNo=@MonthNo
                ELSE
                    INSERT INTO MeterReading(Facility, Reading, ReadingFile, ReadingOn, ReadingBy, Year, MonthNo, Active) VALUES(@Facility, @Reading, @ReadingFile, @ReadingOn, @ReadingBy, @Year, @MonthNo, 1)",
                false,
                new SqlParameter("@Facility", _DropDownListFacility.SelectedValue),
                new SqlParameter("@Reading", _TextBoxReading.Text),
                new SqlParameter("@ReadingFile", fileName),
                new SqlParameter("@ReadingOn", indianTime),
                new SqlParameter("@ReadingBy", "Shrikant"),
                new SqlParameter("@Year", _DropDownListYear.SelectedValue),
                new SqlParameter("@MonthNo", _DropDownListMonth.SelectedIndex + 1)
            );

            // Fetch Main Tenants (Resolved: Including eUnitCost)
            string tenantQuery = $@"SELECT ID, Facility, RentStart, MonthlyRent, Maintenance, MeterReadingStart, eUnitCost FROM Tenant WHERE TenantType='Main Tenant' AND Active=1
                {(_DropDownListFacility.SelectedValue == "1000" ? "" : $"AND Facility={_DropDownListFacility.SelectedValue}")}";

            DataTable tenants = Utility._GetDataTable(tenantQuery);
            foreach (DataRow dr in tenants.Rows)
            {
                int tenantId = Convert.ToInt32(dr["ID"]);
                int facilityId = Convert.ToInt32(dr["Facility"]);
                int monthlyRent = Convert.ToInt32(dr["MonthlyRent"]);
                int maintenance = dr["Maintenance"] != DBNull.Value ? Convert.ToInt32(dr["Maintenance"]) : 0;

                // Resolved: Use dynamic Unit Cost from DB
                int unitCost = dr["eUnitCost"] != DBNull.Value ? Convert.ToInt32(dr["eUnitCost"]) : 0;

                DateTime rentStart = Convert.ToDateTime(dr["RentStart"]);

                // Previous Month Meter
                DateTime prevMonth = new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue), _DropDownListMonth.SelectedIndex + 1, 1).AddMonths(-1);
                DataTable prevMeterDT = Utility._GetDataTable($@"SELECT TOP 1 Reading FROM MeterReading WHERE Facility={facilityId} AND Year={prevMonth.Year} AND MonthNo={prevMonth.Month} ORDER BY ID DESC");
                int meterStart = prevMeterDT.Rows.Count > 0 ? Convert.ToInt32(prevMeterDT.Rows[0][0]) : Convert.ToInt32(dr["MeterReadingStart"]);
                int meterEnd = Convert.ToInt32(_TextBoxReading.Text);

                if (meterEnd < meterStart) meterEnd = meterStart;
                int units = meterEnd - meterStart;

                // ELECTRIC BILL (Calculated using unitCost)
                int billAmount = units > 0 ? units * unitCost : 0;

                int rentWithMaintenance = monthlyRent + maintenance;

                // Previous Due
                DataTable prevDueDT = Utility._GetDataTable($@"SELECT Due FROM Rent WHERE Tenant={tenantId} AND Facility={facilityId} AND AmountType='Rental' AND rYear={prevMonth.Year} AND rMonth='{prevMonth.ToString("MMM").ToUpper()}'");
                int prevDue = prevDueDT.Rows.Count > 0 ? Convert.ToInt32(prevDueDT.Rows[0][0]) : 0;

                int totalAmount = rentWithMaintenance + billAmount + prevDue;

                DateTime periodStart = new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue), _DropDownListMonth.SelectedIndex + 1, rentStart.Day);
                DateTime periodEnd = periodStart.AddMonths(1).AddDays(-1);

                // Insert / Update Rent
                DataTable rentDT = Utility._GetDataTable($@"SELECT * FROM Rent WHERE Tenant={tenantId} AND Facility={facilityId} AND rYear={_DropDownListYear.SelectedValue} AND rMonth='{_DropDownListMonth.SelectedValue}' AND AmountType='Rental'");

                if (rentDT.Rows.Count > 0)
                {
                    Utility.ExecuteQuery(@"UPDATE Rent SET MeterStart=@MeterStart, MeterEnd=@MeterEnd, eUnitCost=@eUnitCost, Maintenance=@Maintenance, Amount=@Amount, TotalAmount=@TotalAmount, Due=@TotalAmount WHERE ID=@ID",
                        false,
                        new SqlParameter("@ID", rentDT.Rows[0]["ID"]),
                        new SqlParameter("@MeterStart", meterStart),
                        new SqlParameter("@MeterEnd", meterEnd),
                        new SqlParameter("@Maintenance", maintenance),
                        new SqlParameter("@Amount", rentWithMaintenance),
                        new SqlParameter("@TotalAmount", totalAmount),
                        new SqlParameter("@eUnitCost", unitCost) 
                    );
                }
                else
                {
                    Utility.ExecuteQuery(@"INSERT INTO Rent(Facility, Tenant, eUnitCost, Amount, PeriodStart, PeriodEnd, MeterStart, MeterEnd, rMonth, rYear, rMonthNo, Maintenance, TotalAmount, Active, Due, AmountType)
                        VALUES(@Facility, @Tenant, @eUnitCost, @Amount, @PeriodStart, @PeriodEnd, @MeterStart, @MeterEnd, @rMonth, @rYear, @rMonthNo, @Maintenance, @TotalAmount, 1, @TotalAmount, 'Rental')",
                        false,
                        new SqlParameter("@Facility", facilityId),
                        new SqlParameter("@Tenant", tenantId),
                        new SqlParameter("@Amount", rentWithMaintenance),
                        new SqlParameter("@PeriodStart", periodStart),
                        new SqlParameter("@PeriodEnd", periodEnd),
                        new SqlParameter("@MeterStart", meterStart),
                        new SqlParameter("@MeterEnd", meterEnd),
                        new SqlParameter("@rMonth", _DropDownListMonth.SelectedValue),
                        new SqlParameter("@rYear", _DropDownListYear.SelectedValue),
                        new SqlParameter("@rMonthNo", _DropDownListMonth.SelectedIndex + 1),
                        new SqlParameter("@eUnitCost", unitCost), 
                        new SqlParameter("@Maintenance", maintenance),
                        new SqlParameter("@TotalAmount", totalAmount)
                    );
                }
            }
            _LiteralMSG.Text = "<div class='p-3 mb-2 bg-success text-white'>Meter Reading & Rent Generated Successfully!</div>";
            _ButtonNewReading.Visible = true;
            _ButtonSubmit.Visible = false;
        }

        protected void _ButtonNewReading_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/MeterReading.aspx");
        }

        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (_DropDownListFacility.SelectedValue == "1000")
                BindFacilityDropdown();
        }

        protected void _DropDownListType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindFacilityDropdown();
        }
    }
}