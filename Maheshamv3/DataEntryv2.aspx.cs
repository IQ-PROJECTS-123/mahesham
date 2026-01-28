using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class DataEntryv2 : System.Web.UI.Page
    {
        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            //Loop through GridView Rows

            string reading = _TextFacility.Text;
            if (!string.IsNullOrEmpty(reading)) Utility.ExecuteQuery(@"IF EXISTS (SELECT 1 FROM MeterReading WHERE YEAR = @YEAR and MonthNo=@MonthNo and Facility=@Facility)
                                        UPDATE MeterReading
                                        SET Reading = @Reading,	                                    
	                                    Readingon=@Readingon,
	                                    Readingby=@Readingby
                                        WHERE YEAR = @YEAR and MonthNO=@MonthNo and Facility=@Facility;
                                    ELSE
                                        INSERT INTO MeterReading (Facility,Reading,Readingon,Readingby,Year,MonthNO,Active)
                                        VALUES (@Facility,@Reading,@Readingon,@Readingby,@Year,@MonthNo,1);", false,
                new SqlParameter("@Facility", _DropDownListFacility.SelectedValue),
                new SqlParameter("@Reading", _TextFacility.Text),
                new SqlParameter("@Readingon", DateTime.Today.ToString("yyyy-MM-dd")),
                new SqlParameter("@YEAR", _DropDownListYear.SelectedValue),
                new SqlParameter("@MonthNo", _DropDownListMonth.SelectedValue),
                new SqlParameter("@Readingby", "Shrikant")
                );


            //Tenant Fetch
            DataTable dtTenant = Utility._GetDataTable($@"SELECT ID, Facility, MeterReadingStart, MonthlyRent, RentStart FROM Tenant WHERE Facility={_DropDownListFacility.SelectedValue} AND TenantType='Main Tenent' AND Active=1");

            //DataTable dtTenant = Utility._GetDataTable($"SELECT ID, MeterReadingStart, MonthlyRent FROM Tenant WHERE Facility={_DropDownListFacility.SelectedValue} AND TenantType='Main Tenent' AND Active=1");
            //Get Previous Month Due
            foreach (DataRow dr in dtTenant.Rows)
            {

                DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc((new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue), Convert.ToInt32(_DropDownListMonth.SelectedValue), 1)).AddMonths(-1), TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
                DataTable dtrentDue = Utility._GetDataTable(String.Format("Select Due from Rent where Tenant={0} and rYear={1} and rMonthNo='{2}' and Facility={3} order by ID Desc", Convert.ToString(dr["ID"]), indianTime.Year, indianTime.Month, _DropDownListFacility.SelectedValue));
                Decimal _PrevDue = dtrentDue.Rows.Count > 0 ? String.IsNullOrEmpty(Convert.ToString(dtrentDue.Rows[0][0])) ? 0 : Convert.ToDecimal(dtrentDue.Rows[0][0]) : 0;
                DataTable dtrent = Utility._GetDataTable(String.Format("Select * from Rent where Tenant={0} and rYear={1} and rMonthNo='{2}' and Facility={3} order by ID Desc", Convert.ToString(dr["ID"]), _DropDownListYear.SelectedValue, _DropDownListMonth.SelectedValue, _DropDownListFacility.SelectedValue));

                //Meter Start &End
                DataTable _MeterEnddt = Utility._GetDataTable(string.Format("select Reading from MeterReading where Facility={0} and Year={1} and MonthNo={2} order by ID desc", _DropDownListFacility.SelectedValue, _DropDownListYear.SelectedValue, _DropDownListMonth.SelectedValue));
                DataTable _MeterStartdt = Utility._GetDataTable(String.Format("select Reading from MeterReading where Facility={0} and Year={1} and MonthNo={2} order by ID desc", _DropDownListFacility.SelectedValue, indianTime.Year, indianTime.Month));
                Int32 _MeterStart = _MeterStartdt.Rows.Count > 0 ? Convert.ToInt32(_MeterStartdt.Rows[0][0]) : Convert.ToInt32(dr["MeterReadingStart"]);
                Int32 _MeterEnd = _MeterEnddt.Rows.Count > 0 ? Convert.ToInt32(_MeterEnddt.Rows[0][0]) : 0;
                _MeterEnd = _MeterStart >= _MeterEnd ? _MeterStart : _MeterEnd;

                //Rent Period Calculation
                DateTime _RentStart = Convert.ToDateTime(dr["RentStart"]);
                DateTime _PeriodStart = new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue), (Convert.ToInt32(_DropDownListMonth.SelectedValue)), _RentStart.Day);
                DateTime _PeriodEnd = (_PeriodStart.AddMonths(1)).AddDays(-1);
                Int32 _MonthlyRent = Convert.ToInt32(dr["MonthlyRent"]);
                Decimal _paid = String.IsNullOrEmpty(_TextBoxPaid.Text) ? 0 : Convert.ToDecimal(_TextBoxPaid.Text);

                //Rent, Electricity & Due
                int tenantId = Convert.ToInt32(dr["ID"]);
                int meterStart = Convert.ToInt32(dr["MeterReadingStart"]);
                int meterEnd = Convert.ToInt32(_TextFacility.Text);
                int ebill = (meterEnd - meterStart) > 0 ? (meterEnd - meterStart) * 7 : 0;
                int monthlyRent = Convert.ToInt32(dr["MonthlyRent"]);
                decimal paid = string.IsNullOrEmpty(_TextBoxPaid.Text) ? 0 : Convert.ToDecimal(_TextBoxPaid.Text);
                decimal totalAmount = monthlyRent + ebill;
                decimal due = totalAmount - paid;

                //Insert or Update Rent
                DataTable dtRent = Utility._GetDataTable($"SELECT * FROM Rent WHERE Tenant={tenantId} AND Facility={_DropDownListFacility.SelectedValue} AND rYear={_DropDownListYear.SelectedValue} AND rMonthNo={_DropDownListMonth.SelectedValue}");
                if (dtrent.Rows.Count > 0)
                {

                    Utility.ExecuteQuery("update Rent Set MeterStart=@MeterStart, MeterEnd=@MeterEnd, TotalAmount=@TotalAmount,PaidAmount=@PaidAmount,Due=@Due where ID=@ID",
                    false,
                    new SqlParameter("@ID", Convert.ToString(dtrent.Rows[0]["ID"])),
                    new SqlParameter("@MeterStart", _MeterStart),
                    new SqlParameter("@MeterEnd", _MeterEnd),
                    new SqlParameter("@TotalAmount", _PrevDue + _MonthlyRent + (_MeterEnd - _MeterStart > 0 ? (_MeterEnd - _MeterStart) * 7 : 0)),
                    new SqlParameter("@PaidAmount", _TextBoxPaid.Text),
                    new SqlParameter("@Due", _PrevDue + (_MonthlyRent + (_MeterEnd - _MeterStart > 0 ? (_MeterEnd - _MeterStart) * 7 : 0)) - _paid)
                    );
                }
                else
                {
                    Utility.ExecuteQuery("insert into Rent(Facility,Tenant,Amount,PeriodStart,PeriodEnd,MeterEnd,MeterStart,rMonth,rYear,rMonthNo,TotalAmount,Active,PaidAmount,Due,Status) values (@Facility,@Tenant,@Amount,@PeriodStart,@PeriodEnd,@MeterEnd,@MeterStart,@rMonth,@rYear,@rMonthNo,@TotalAmount,1,@PaidAmount,@Due,@Status)",
                             false,
                             new SqlParameter("@Facility", Convert.ToString(dr["Facility"])),
                             new SqlParameter("@Tenant", Convert.ToString(dr["ID"])),
                             new SqlParameter("@Amount", _MonthlyRent),
                             new SqlParameter("@PeriodStart", String.Format("{0}-{1}-{2}", _PeriodStart.Year, _PeriodStart.Month, _PeriodStart.Day)),
                             new SqlParameter("@PeriodEnd", String.Format("{0}-{1}-{2}", _PeriodEnd.Year, _PeriodEnd.Month, _PeriodEnd.Day)),
                             new SqlParameter("@MeterStart", _MeterStart),
                             new SqlParameter("@MeterEnd", _MeterEnd),
                             new SqlParameter("@rMonth", _DropDownListMonth.SelectedItem.Text),
                             new SqlParameter("@rYear", _DropDownListYear.SelectedValue),
                             new SqlParameter("@rMonthNo", _DropDownListMonth.SelectedValue),
                             new SqlParameter("@TotalAmount", _PrevDue + _MonthlyRent + (_MeterEnd - _MeterStart > 0 ? (_MeterEnd - _MeterStart) * 7 : 0)),
                             new SqlParameter("@PaidAmount", _TextBoxPaid.Text),
                             new SqlParameter("@Status", _paid > 0 ? "Completed" : "Pending"),
                             new SqlParameter("@Due", _PrevDue + (_MonthlyRent + (_MeterEnd - _MeterStart > 0 ? (_MeterEnd - _MeterStart) * 7 : 0)) - _paid));


                }
            }
            //Show Success Message
            _LiteralMSG.Text = "<div class='p-3 mb-2 bg-success text-white'>Record Added Successfully!</div>";
            BindGrid();
        }
        //BindGrid()
        private void BindGrid()
        {
            //error
            DataTable da = Utility._GetDataTable(String.Format(@"SELECT ID,rYear, rMonth, meterstart, meterend, (meterend - meterstart) AS Reading, (meterend - meterstart) * 7 AS Ebill, Amount, Amount + ((meterend - meterstart) * 7) AS TotalAmount FROM Rent WHERE facility = {0} ORDER BY rMonthNo", _DropDownListFacility.SelectedIndex > 0 ? _DropDownListFacility.SelectedValue : "0"));
            gvDataEnrty.DataSource = da;
            gvDataEnrty.DataBind();
        }
        protected void _ImageButtonView_Click(object sender, ImageClickEventArgs e)
        {
            //Edit buttton
        }
        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
    }
}