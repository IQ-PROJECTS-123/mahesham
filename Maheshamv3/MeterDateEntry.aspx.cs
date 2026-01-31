using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class MeterDateEntry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Utility._BindDropdown(_DropDownListFacility, String.Format("select f.ID,f.Building+' '+ f.Title+' '+f.Location as Title from facility f where  f.Active=1 Order by ID"), "ID", "Title", false);
                _Bind();
            }
        }
        protected void _Bind()
        {
            DataTable _dt = Utility._GetDataTable(String.Format("select * from MeterReading where  Facility={0} and year={1}", _DropDownListFacility.SelectedValue, _DropDownListYear.SelectedValue));
            DataTable dummy = new DataTable();
            dummy.Columns.Add("ID", typeof(int));
            dummy.Columns.Add("MonthNo");            
            dummy.Columns.Add("Reading");
            dummy.Columns.Add("Month");
            for (int i = 1; i < 13; i++) {
               DataRow[] _Rows= _dt.Select("MonthNo=" + i.ToString());
               DataRow _row=dummy.NewRow();
               _row[0] = _Rows.Length > 0 ? _Rows[0]["ID"]:0;
                _row[1] = i;
                _row[2]= _Rows.Length > 0 ? _Rows[0]["Reading"] : "";
                _row[3] = new DateTime(2025, i, 1).ToString("MMM").ToUpper();
                dummy.Rows.Add(_row);
            }
            GridView2.DataSource = dummy;
            GridView2.DataBind();
        }
        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow _Row in GridView2.Rows)
            {
                TextBox _TextBox = (TextBox)_Row.FindControl("_TextBox");
                if (!String.IsNullOrEmpty(_TextBox.Text))
                    Utility.ExecuteQuery(@"IF EXISTS (SELECT 1 FROM MeterReading WHERE YEAR = @YEAR and MonthNo=@MonthNo and Facility=@Facility)
                                        UPDATE MeterReading
                                        SET Reading = @Reading,	                                    
	                                    Readingon=@Readingon,
	                                    Readingby=@Readingby
                                        WHERE YEAR = @YEAR and MonthNO=@MonthNo and Facility=@Facility;
                                    ELSE
                                        INSERT INTO MeterReading (Facility,Reading,Readingon,Readingby,Year,MonthNO,Active)
                                        VALUES (@Facility,@Reading,@Readingon,@Readingby,@Year,@MonthNo,1);", false,
                    new SqlParameter("@Facility", _DropDownListFacility.SelectedValue),
                    new SqlParameter("@Reading", _TextBox.Text),
                    new SqlParameter("@Readingon", DateTime.Today.ToString("yyyy-MM-dd")),
                    new SqlParameter("@YEAR", _DropDownListYear.SelectedValue),
                    new SqlParameter("@MonthNo", _Row.RowIndex + 1),
                    new SqlParameter("@Readingby", "Shrikant")
                    );
            }
            foreach (GridViewRow _Row in GridView2.Rows)
            {
                if (_DropDownListFacility.SelectedIndex > 0)
                {
                    TextBox _TextBox = (TextBox)_Row.FindControl("_TextBox");
                    TextBox _TextBoxPaid = (TextBox)_Row.FindControl("_TextBoxPaid");
                    if (!String.IsNullOrEmpty(_TextBox.Text) || !String.IsNullOrEmpty(_TextBoxPaid.Text))
                    {
                        DataTable dt = Utility._GetDataTable(String.Format("select ID,facility,RentStart,MonthlyRent,MeterReadingStart from Tenant where TenantType='Main Tenent' and Active=1 {0}", _DropDownListFacility.SelectedIndex == 0 ? "" : "and Facility=" + _DropDownListFacility.SelectedValue));
                        foreach (DataRow dr in dt.Rows)
                        {
                            DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc((new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue), _Row.RowIndex + 1, 1)).AddMonths(-1), TimeZoneInfo.FindSystemTimeZoneById("India Standard Time"));
                            DataTable dtrentDue = Utility._GetDataTable(String.Format("Select Due from Rent where Tenant={0} and rYear={1} and rMonthNo='{2}' and Facility={3} order by ID Desc", Convert.ToString(dr["ID"]), indianTime.Year, indianTime.Month, _DropDownListFacility.SelectedValue));
                            Decimal _PrevDue = dtrentDue.Rows.Count > 0 ?String.IsNullOrEmpty(Convert.ToString(dtrentDue.Rows[0][0]))?0: Convert.ToDecimal(dtrentDue.Rows[0][0]) : 0;
                            DataTable dtrent = Utility._GetDataTable(String.Format("Select * from Rent where Tenant={0} and rYear={1} and rMonthNo='{2}' and Facility={3} order by ID Desc", Convert.ToString(dr["ID"]), _DropDownListYear.SelectedValue, _Row.RowIndex + 1, _DropDownListFacility.SelectedValue));                            
                            DataTable _MeterEnddt = Utility._GetDataTable(String.Format("select Reading from MeterReading where Facility={0} and Year={1} and MonthNo={2} order by ID desc", Convert.ToString(dr["Facility"]), indianTime.Year, indianTime.Month ));
                            DataTable _MeterStartdt = Utility._GetDataTable(String.Format("select Reading from MeterReading where Facility={0} and Year={1} and MonthNo={2} order by ID desc", Convert.ToString(dr["Facility"]), indianTime.Year, indianTime.AddMonths(-1).Month));
                            Int32 _MeterStart = _MeterStartdt.Rows.Count > 0 ? Convert.ToInt32(_MeterStartdt.Rows[0][0]) : Convert.ToInt32(dr["MeterReadingStart"]);
                            Int32 _MeterEnd = _MeterEnddt.Rows.Count > 0 ? Convert.ToInt32(_MeterEnddt.Rows[0][0]) : 0;
                            _MeterEnd = _MeterStart >= _MeterEnd ? _MeterStart : _MeterEnd;
                            DateTime _RentStart = Convert.ToDateTime(dr["RentStart"]);
                            DateTime _PeriodStart = new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue), _Row.RowIndex + 1, _RentStart.Day);
                            DateTime _PeriodEnd = (_PeriodStart.AddMonths(1)).AddDays(-1);
                            Int32 _MonthlyRent = Convert.ToInt32(dr["MonthlyRent"]);
                            Decimal _paid = String.IsNullOrEmpty(_TextBoxPaid.Text) ? 0 : Convert.ToDecimal(_TextBoxPaid.Text);
                            if (dtrent.Rows.Count > 0)
                            {
                                
                                Utility.ExecuteQuery("update Rent Set MeterStart=@MeterStart, MeterEnd=@MeterEnd, TotalAmount=@TotalAmount,PaidAmount=@PaidAmount,Due=@Due where ID=@ID",
                                false,
                                new SqlParameter("@ID", Convert.ToString(dtrent.Rows[0]["ID"])),
                                new SqlParameter("@MeterStart", _MeterStart),
                                new SqlParameter("@MeterEnd", _MeterEnd),
                                new SqlParameter("@TotalAmount", _PrevDue+ _MonthlyRent + (_MeterEnd - _MeterStart > 0 ? (_MeterEnd - _MeterStart) * 7 : 0)),
                                new SqlParameter("@PaidAmount", _TextBoxPaid.Text),
                                new SqlParameter("@Due", _PrevDue + (_MonthlyRent + (_MeterEnd - _MeterStart > 0 ? (_MeterEnd - _MeterStart) * 7 : 0))-_paid)
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
                                new SqlParameter("@rMonth", TimeZoneInfo.ConvertTimeFromUtc((new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue), _Row.RowIndex + 1, 1)), TimeZoneInfo.FindSystemTimeZoneById("India Standard Time")).ToString("MMM").ToUpper()),
                                new SqlParameter("@rYear", _DropDownListYear.SelectedValue),
                                new SqlParameter("@rMonthNo", _Row.RowIndex + 1),
                                new SqlParameter("@TotalAmount", _PrevDue + _MonthlyRent + (_MeterEnd - _MeterStart > 0 ? (_MeterEnd - _MeterStart) * 7 : 0)),
                                new SqlParameter("@PaidAmount", _TextBoxPaid.Text),
                                new SqlParameter("@Status", _paid>0?"Completed":"Pending"),
                                new SqlParameter("@Due", _PrevDue + (_MonthlyRent + (_MeterEnd - _MeterStart > 0 ? (_MeterEnd - _MeterStart) * 7 : 0)) - _paid)
                             );
                            }

                        }
                        _LiteralMSG.Text = "<div class='p-3 mb-2 bg-success text-white'>Meter Reading has been Submitted Successfully!</div>";
                    }
                }
                else
                    _LiteralMSG.Text = "<div class='p-3 mb-2 bg-success text-white'>Select Fasility!</div>";

            }
           
        }
        
        

        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {

            _Bind();



        }
    }
}