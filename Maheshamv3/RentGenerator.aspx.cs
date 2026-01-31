using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class RentGenerator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Utility._BindDropdown(_DropDownListFacility, "select f.ID,f.Building+' '+ f.Title+' '+f.Location as Title from facility f where f.Active=1","ID", "Title", false);
                _DropDownListFacility.Items.Insert(0, new ListItem("ALL", "0"));
                _DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                _DropDownListMonth.SelectedValue = DateTime.Now.ToString("MMM").ToUpper();
            }
        }

        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            string facilityFilter = _DropDownListFacility.SelectedValue == "0" ? "": "and Facility=" + _DropDownListFacility.SelectedValue;
            DataTable dt = Utility._GetDataTable($@"select ID,facility,RentStart,MonthlyRent,MeterReadingStart from Tenant where TenantType='Main Tenant' and Active=1 {facilityFilter}");
            foreach (DataRow dr in dt.Rows)
            {
                DataTable dtrent = Utility._GetDataTable($@"Select * from Rent where Tenant={dr["ID"]} and Facility={dr["Facility"]} and rYear={_DropDownListYear.SelectedValue} and rMonth='{_DropDownListMonth.SelectedValue}' and (AmountType IS NULL OR AmountType='Rental')order by ID Desc");
                DateTime indianTime = new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue),_DropDownListMonth.SelectedIndex + 1,1).AddMonths(-1);
                DataTable _MeterEnddt = Utility._GetDataTable($@"select Reading from MeterReading where Facility={dr["Facility"]} and Year={indianTime.Year} and MonthNo={indianTime.AddMonths(-1).Month} order by ID desc");
                DataTable _MeterStartdt = Utility._GetDataTable($@"select Reading from MeterReading where Facility={dr["Facility"]} and Year={indianTime.Year} and MonthNo={indianTime.Month} order by ID desc");
                int _MeterStart = _MeterStartdt.Rows.Count > 0 ? Convert.ToInt32(_MeterStartdt.Rows[0][0]) : Convert.ToInt32(dr["MeterReadingStart"]);
                int _MeterEnd = _MeterEnddt.Rows.Count > 0 ? Convert.ToInt32(_MeterEnddt.Rows[0][0]) : _MeterStart;
                if (_MeterEnd < _MeterStart)_MeterEnd = _MeterStart;
                DateTime _RentStart = Convert.ToDateTime(dr["RentStart"]);
                DateTime _PeriodStart = new DateTime(Convert.ToInt32(_DropDownListYear.SelectedValue),_DropDownListMonth.SelectedIndex + 1, _RentStart.Day);
                DateTime _PeriodEnd = _PeriodStart.AddMonths(1).AddDays(-1);
                int _MonthlyRent = Convert.ToInt32(dr["MonthlyRent"]);
                int Total = _MonthlyRent + Math.Max(0, (_MeterEnd - _MeterStart) * 7);
                if (dtrent.Rows.Count > 0)
                {
                    Utility.ExecuteQuery(@"update Rent set MeterStart=@MeterStart, MeterEnd=@MeterEnd,TotalAmount=@TotalAmount, Amount=@Amount where ID=@ID",
                    false,
                    new SqlParameter("@ID", dtrent.Rows[0]["ID"]),
                    new SqlParameter("@MeterStart", _MeterStart),
                    new SqlParameter("@MeterEnd", _MeterEnd),
                    new SqlParameter("@TotalAmount", Total),
                    new SqlParameter("@Amount", _MonthlyRent));
                }
                else
                {
                    Utility.ExecuteQuery(@"insert into Rent(Facility,Tenant,Amount,PeriodStart,PeriodEnd,MeterEnd,MeterStart,rMonth,rYear,rMonthNo,TotalAmount,Active,AmountType)values (@Facility,@Tenant,@Amount,@PeriodStart,@PeriodEnd,@MeterEnd,@MeterStart,@rMonth,@rYear,@rMonthNo,@TotalAmount,1,'Rental')",
                    false,
                    new SqlParameter("@Facility", dr["Facility"]),
                    new SqlParameter("@Tenant", dr["ID"]),
                    new SqlParameter("@Amount", _MonthlyRent),
                    new SqlParameter("@PeriodStart", _PeriodStart),
                    new SqlParameter("@PeriodEnd", _PeriodEnd),
                    new SqlParameter("@MeterStart", _MeterStart),
                    new SqlParameter("@MeterEnd", _MeterEnd),
                    new SqlParameter("@rMonth", _DropDownListMonth.SelectedValue),
                    new SqlParameter("@rYear", _DropDownListYear.SelectedValue),
                    new SqlParameter("@rMonthNo", _DropDownListMonth.SelectedIndex + 1),
                    new SqlParameter("@TotalAmount", Total));
                }
            }

            _LiteralMSG.Text = "<div class='p-3 mb-2 bg-success text-white'>Rent Generated / Updated Successfully!</div>";
            _ButtonNewReading.Visible = true;
            _ButtonSubmit.Visible = false;
        }

        protected void _ButtonNewReading_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/RentGenerator.aspx");
        }
    }
}
