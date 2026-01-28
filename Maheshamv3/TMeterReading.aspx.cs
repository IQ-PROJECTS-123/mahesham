using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Maheshamv3
{
    public partial class TMeterReading : System.Web.UI.Page
    {
        TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
        int tenantId = 0;
        int facilityId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["userInfo"] == null || Request.Cookies["userInfo"]["Tenant"] == null)
            {
                Response.Redirect("~/authlogin.aspx");
                return;
            }
            tenantId = Convert.ToInt32(Request.Cookies["userInfo"]["Tenant"]);
            DataTable dt = Utility._GetDataTable("SELECT Facility, Name, RentStart, MonthlyRent, Maintenance, MeterReadingStart FROM Tenant WHERE ID=" + tenantId);
            if (dt.Rows.Count == 0)
            {
                _LiteralMSG.Text = "<div class='alert alert-danger'>Invalid Tenant!</div>";
                return;
            }
            facilityId = Convert.ToInt32(dt.Rows[0]["Facility"]);
            _LabelTenantName.Text = dt.Rows[0]["Name"].ToString();
            DataTable fdt = Utility._GetDataTable("SELECT Building + ' ' + Title + ' ' + Location AS Title FROM Facility WHERE ID=" + facilityId);
            _LabelFacilityName.Text = fdt.Rows[0]["Title"].ToString();

            if (!IsPostBack)
            {
                DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow.AddMonths(-1), INDIAN_ZONE);
                _DropDownListMonth.SelectedValue = indianTime.ToString("MMM").ToUpper();
                _DropDownListYear.SelectedValue = indianTime.Year.ToString();
                LoadOldReading();
            }
        }
        private void LoadOldReading()
        {
            string query = $@"SELECT TOP 1 Reading, ReadingFile FROM MeterReading WHERE Facility={facilityId} AND Year={_DropDownListYear.SelectedValue} AND MonthNo={_DropDownListMonth.SelectedIndex + 1} ORDER BY ID DESC";
            DataTable dt = Utility._GetDataTable(query);
            if (dt.Rows.Count > 0)
            {
                _TextBoxReading.Text = dt.Rows[0]["Reading"].ToString();
                if (!string.IsNullOrEmpty(dt.Rows[0]["ReadingFile"].ToString()))
                {
                    _LiteralOldFile.Text = $"<a href='/MeterReading/{dt.Rows[0]["ReadingFile"]}' target='_blank'>View Old Capture</a>";
                }
            }
            else
            {
                _TextBoxReading.Text = "";
                _LiteralOldFile.Text = "";
            }
        }

        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);
            string fileName = "";
            if (_FileUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(_FileUpload.FileName);
                fileName = $"{facilityId}_{_DropDownListMonth.SelectedValue}{indianTime.Year}{ext}";
                _FileUpload.SaveAs(Server.MapPath("~/MeterReading/" + fileName));
            }
            Utility.ExecuteQuery(@"IF EXISTS (SELECT 1 FROM MeterReading WHERE Facility=@Facility AND Year=@Year AND MonthNo=@MonthNo)
                    UPDATE MeterReading SET Reading=@Reading, ReadingFile=@ReadingFile, ReadingOn=@ReadingOn, ReadingBy=@ReadingBy WHERE Facility=@Facility AND Year=@Year AND MonthNo=@MonthNo
                    ELSE
                    INSERT INTO MeterReading(Facility, Reading, ReadingFile, ReadingOn, ReadingBy, Year, MonthNo, Active) VALUES(@Facility, @Reading, @ReadingFile, @ReadingOn, @ReadingBy, @Year, @MonthNo, 1)",
                false,
                new SqlParameter("@Facility", facilityId),
                new SqlParameter("@Reading", _TextBoxReading.Text),
                new SqlParameter("@ReadingFile", fileName),
                new SqlParameter("@ReadingOn", indianTime),
                new SqlParameter("@ReadingBy", tenantId),
                new SqlParameter("@Year", _DropDownListYear.SelectedValue),
                new SqlParameter("@MonthNo", _DropDownListMonth.SelectedIndex + 1)
            );

            // 2️⃣ Fetch tenant 
            DataTable dtTenant = Utility._GetDataTable($@"SELECT ID, Facility, RentStart, MonthlyRent, Maintenance, MeterReadingStart FROM Tenant WHERE ID={tenantId} AND Facility={facilityId}");
            DataRow dr = dtTenant.Rows[0];
            int monthlyRent = Convert.ToInt32(dr["MonthlyRent"]);
            int maintenance = Convert.ToInt32(dr["Maintenance"]);
            DateTime rentStart = Convert.ToDateTime(dr["RentStart"]);
            // Previous month meter reading
            DateTime prevMonth = new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue), _DropDownListMonth.SelectedIndex + 1, 1).AddMonths(-1);
            DataTable prevMeterDt = Utility._GetDataTable($@"SELECT TOP 1 Reading FROM MeterReading WHERE Facility={facilityId} AND Year={prevMonth.Year} AND MonthNo={prevMonth.Month} ORDER BY ID DESC");
            int meterStart = prevMeterDt.Rows.Count > 0 ? Convert.ToInt32(prevMeterDt.Rows[0]["Reading"]) : Convert.ToInt32(dr["MeterReadingStart"]);
            int meterEnd = Convert.ToInt32(_TextBoxReading.Text);
            if (meterEnd < meterStart) meterEnd = meterStart;
            int units = meterEnd - meterStart;
            int billAmount = units > 0 ? units * 7 : 0;
            // Rent + Maintenance merge
            int rentWithMaintenance = monthlyRent + maintenance;
            // Previous Month Due
            DataTable prevDueDT = Utility._GetDataTable($@"SELECT due FROM Rent WHERE Tenant={tenantId} AND Facility={facilityId} AND rYear={prevMonth.Year} AND rMonth='{prevMonth.ToString("MMM").ToUpper()}' AND AmountType='Rental'");
            int prevDue = prevDueDT.Rows.Count > 0 ? Convert.ToInt32(prevDueDT.Rows[0]["due"]) : 0;
            // Final Total = Rent + Maintenance + Bill + Previous Due
            int totalAmount = rentWithMaintenance + billAmount + prevDue;
            DateTime periodStart = new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue),_DropDownListMonth.SelectedIndex + 1, rentStart.Day);
            DateTime periodEnd = periodStart.AddMonths(1).AddDays(-1);
            // Insert/Update Rent 
            DataTable rentDT = Utility._GetDataTable($@"SELECT * FROM Rent WHERE Tenant={tenantId} AND Facility={facilityId} AND rYear={_DropDownListYear.SelectedValue} AND rMonth='{_DropDownListMonth.SelectedValue}' AND AmountType='Rental'");
            if (rentDT.Rows.Count > 0)
            {
                // Update Rent
                Utility.ExecuteQuery(@"UPDATE Rent SET MeterStart=@MeterStart, MeterEnd=@MeterEnd, Maintenance=@Maintenance,Amount=@Amount, TotalAmount=@TotalAmount, Due=@TotalAmount WHERE ID=@ID",
                    false,
                    new SqlParameter("@ID", rentDT.Rows[0]["ID"]),
                    new SqlParameter("@MeterStart", meterStart),
                    new SqlParameter("@MeterEnd", meterEnd),
                    new SqlParameter("@Maintenance", maintenance),
                    new SqlParameter("@Amount", rentWithMaintenance),
                    new SqlParameter("@TotalAmount", totalAmount)
                );
            }
            else
            {
                // Insert Rent
                Utility.ExecuteQuery(@"INSERT INTO Rent(Facility, Tenant, Amount, PeriodStart, PeriodEnd, MeterStart, MeterEnd, rMonth, rYear, rMonthNo, Maintenance, TotalAmount, Active, Due, AmountType)VALUES(@Facility, @Tenant, @Amount, @PeriodStart, @PeriodEnd, @MeterStart, @MeterEnd,@rMonth, @rYear, @rMonthNo, @Maintenance, @TotalAmount, 1, @TotalAmount, 'Rental')",
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
                    new SqlParameter("@Maintenance", maintenance),
                    new SqlParameter("@TotalAmount", totalAmount)
                );
            }
            _LiteralMSG.Text ="<div class='alert alert-success'>Meter Reading & Rent Submitted Successfully!</div>";
            _ButtonSubmit.Visible = false;
            _ButtonNewReading.Visible = true;
        }

        protected void _ButtonNewReading_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/TMeterReading.aspx");
        }

        protected void _DropDownListYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadOldReading();
        }

        protected void _DropDownListMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadOldReading();
        }
    }
}
