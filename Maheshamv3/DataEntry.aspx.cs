using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class DataEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Utility._BindDropdown(_DropDownListFacility,
                "select f.ID,f.Building+' '+ f.Title+' '+f.Location as Title from facility f where f.Active=1",
                "ID", "Title", true);

                _DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();

                BindGrid();
            }
        }

        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            string reading = _TextFacility.Text;

            if (!string.IsNullOrEmpty(reading))
            {
                Utility.ExecuteQuery(@"IF EXISTS (SELECT 1 FROM MeterReading WHERE YEAR = @YEAR and MonthNo=@MonthNo and Facility=@Facility)
                UPDATE MeterReading SET Reading = @Reading,Readingon=@Readingon,Readingby=@Readingby WHERE YEAR = @YEAR and MonthNO=@MonthNo and Facility=@Facility
                ELSE
                INSERT INTO MeterReading (Facility,Reading,Readingon,Readingby,Year,MonthNO,Active) VALUES (@Facility,@Reading,@Readingon,@Readingby,@Year,@MonthNo,1)", false,

                new SqlParameter("@Facility", _DropDownListFacility.SelectedValue),
                new SqlParameter("@Reading", _TextFacility.Text),
                new SqlParameter("@Readingon", DateTime.Today),
                new SqlParameter("@YEAR", _DropDownListYear.SelectedValue),
                new SqlParameter("@MonthNo", _DropDownListMonth.SelectedValue),
                new SqlParameter("@Readingby", "Shrikant"));
            }

            // Get Tenants + Unit Cost
            DataTable dtTenant = Utility._GetDataTable($@"
            SELECT t.ID,t.Facility,t.MeterReadingStart,t.MonthlyRent,t.RentStart,f.eUnitCost FROM Tenant t INNER JOIN Facility f ON f.ID=t.Facility WHERE t.Facility={_DropDownListFacility.SelectedValue}AND t.TenantType='Main Tenent'AND t.Active=1");
            foreach (DataRow dr in dtTenant.Rows)
            {
                DateTime prevMonth = new DateTime(
                Convert.ToInt32(_DropDownListYear.SelectedValue),
                Convert.ToInt32(_DropDownListMonth.SelectedValue), 1).AddMonths(-1);
                DataTable dtrentDue = Utility._GetDataTable($@"SELECT Due FROM Rent WHERE Tenant={dr["ID"]} AND rYear={prevMonth.Year} AND rMonthNo={prevMonth.Month}AND Facility={_DropDownListFacility.SelectedValue} ORDER BY ID DESC");
                decimal prevDue = dtrentDue.Rows.Count > 0 ? Convert.ToDecimal(dtrentDue.Rows[0]["Due"]) : 0;
                DataTable dtrent = Utility._GetDataTable($@"
                SELECT * FROM Rent WHERE Tenant={dr["ID"]} AND rYear={_DropDownListYear.SelectedValue} AND rMonthNo={_DropDownListMonth.SelectedValue} AND Facility={_DropDownListFacility.SelectedValue}");
                // Meter Reading
                DataTable meterEndDt = Utility._GetDataTable($@"SELECT Reading FROM MeterReading WHERE Facility={_DropDownListFacility.SelectedValue}AND Year={_DropDownListYear.SelectedValue}AND MonthNo={_DropDownListMonth.SelectedValue}ORDER BY ID DESC");
                DataTable meterStartDt = Utility._GetDataTable($@"SELECT Reading FROM MeterReading WHERE Facility={_DropDownListFacility.SelectedValue} AND Year={prevMonth.Year}AND MonthNo={prevMonth.Month}ORDER BY ID DESC");
                int meterStart = meterStartDt.Rows.Count > 0 ? Convert.ToInt32(meterStartDt.Rows[0][0]): Convert.ToInt32(dr["MeterReadingStart"]);
                int meterEnd = meterEndDt.Rows.Count > 0 ? Convert.ToInt32(meterEndDt.Rows[0][0]): meterStart;
                if (meterEnd < meterStart)meterEnd = meterStart;
                int unitUsed = meterEnd - meterStart;
                int eUnitCost = Convert.ToInt32(dr["eUnitCost"]);
                int electricityBill = unitUsed > 0 ? unitUsed * eUnitCost : 0;
                int monthlyRent = Convert.ToInt32(dr["MonthlyRent"]);
                decimal paid = string.IsNullOrEmpty(_TextBoxPaid.Text) ? 0 : Convert.ToDecimal(_TextBoxPaid.Text);
                decimal total = prevDue + monthlyRent + electricityBill;
                decimal due = total - paid;
                DateTime rentStart = Convert.ToDateTime(dr["RentStart"]);
                DateTime periodStart = new DateTime(
                Convert.ToInt32(_DropDownListYear.SelectedValue),
                Convert.ToInt32(_DropDownListMonth.SelectedValue),rentStart.Day);
                DateTime periodEnd = periodStart.AddMonths(1).AddDays(-1);

                if (dtrent.Rows.Count > 0)
                {
                    Utility.ExecuteQuery(@"update Rent set MeterStart=@MeterStart,MeterEnd=@MeterEnd,TotalAmount=@TotalAmount,PaidAmount=@PaidAmount,Due=@Due where ID=@ID",
                    false,
                    new SqlParameter("@ID", dtrent.Rows[0]["ID"]),
                    new SqlParameter("@MeterStart", meterStart),
                    new SqlParameter("@MeterEnd", meterEnd),
                    new SqlParameter("@TotalAmount", total),
                    new SqlParameter("@PaidAmount", paid),
                    new SqlParameter("@Due", due));
                }
                else
                {
                    Utility.ExecuteQuery(@"insert into Rent (Facility,Tenant,Amount,PeriodStart,PeriodEnd,MeterEnd,MeterStart,rMonth,rYear,rMonthNo,TotalAmount,Active,PaidAmount,Due,Status)
                    values(@Facility,@Tenant,@Amount,@PeriodStart,@PeriodEnd,@MeterEnd,@MeterStart,@rMonth,@rYear,@rMonthNo,@TotalAmount,1,@PaidAmount,@Due,@Status)",
                    false,
                    new SqlParameter("@Facility", dr["Facility"]),
                    new SqlParameter("@Tenant", dr["ID"]),
                    new SqlParameter("@Amount", monthlyRent),
                    new SqlParameter("@PeriodStart", periodStart),
                    new SqlParameter("@PeriodEnd", periodEnd),
                    new SqlParameter("@MeterStart", meterStart),
                    new SqlParameter("@MeterEnd", meterEnd),
                    new SqlParameter("@rMonth", _DropDownListMonth.SelectedItem.Text),
                    new SqlParameter("@rYear", _DropDownListYear.SelectedValue),
                    new SqlParameter("@rMonthNo", _DropDownListMonth.SelectedValue),
                    new SqlParameter("@TotalAmount", total),
                    new SqlParameter("@PaidAmount", paid),
                    new SqlParameter("@Due", due),
                    new SqlParameter("@Status", paid > 0 ? "Completed" : "Pending"));
                }
            }

            _LiteralMSG.Text = "<div class='p-3 mb-2 bg-success text-white'>Record Added Successfully!</div>";

            BindGrid();
        }

        private void BindGrid()
        {
            string facilityId = _DropDownListFacility.SelectedIndex > 0 ? _DropDownListFacility.SelectedValue : "0";
            string query = $@"SELECT r.ID,r.rYear,r.rMonth,r.PeriodStart,r.PeriodEnd,r.MeterStart,r.MeterEnd,(r.MeterEnd - r.MeterStart) AS Unit, (r.MeterEnd - r.MeterStart) * f.eUnitCost AS Bill,r.Amount,(r.Amount + ((r.MeterEnd - r.MeterStart) * f.eUnitCost)) AS TotalAmount,r.PaidAmount,r.Paidon,r.Due FROM Rent r INNER JOIN Facility f ON f.ID=r.Facility WHERE r.Facility={facilityId} ORDER BY r.rYear,r.rMonthNo";
            DataTable da = Utility._GetDataTable(query);
            gvDataEnrty.DataSource = da;
            gvDataEnrty.DataBind();
        }

        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}