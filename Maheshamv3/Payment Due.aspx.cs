using System;
using System.Data;
using System.Web.UI;   
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class Payment_Due : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                _DropDownListMonth.SelectedValue = DateTime.Now.Month.ToString();
                BindPaymentDueGrid();
            }
        }
        protected void _DropDownListYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindPaymentDueGrid();
        }
        protected void _DropDownListMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindPaymentDueGrid();
        }
        private void BindPaymentDueGrid()
        {
            if (!int.TryParse(_DropDownListMonth.SelectedValue, out int month))
            {
                _GridView2.DataSource = null;
                _GridView2.DataBind();
                _LabelYearMonth.Text = "";
                return;
            }
            if (!int.TryParse(_DropDownListYear.SelectedValue, out int year))
            {
                _GridView2.DataSource = null;
                _GridView2.DataBind();
                _LabelYearMonth.Text = "";
                return;
            }
            _LabelYearMonth.Text = _DropDownListMonth.SelectedItem.Text + " " + year;
            string query = $@"SELECT t.Name AS Tenant, f.Title AS Room, DATENAME(MONTH, DATEFROMPARTS(r.rYear, r.rMonthNo, 1)) AS MonthName, r.rYear AS Year, FORMAT(r.PeriodStart, 'dd/MM/yyyy') AS PeriodStart, FORMAT(r.PeriodEnd, 'dd/MM/yyyy') AS PeriodEnd, r.MeterStart, r.MeterEnd, r.MeterEnd - r.MeterStart AS Unit,(r.MeterEnd - r.MeterStart) * 7 AS Bill, r.TotalAmount, r.PaidAmount, r.due,
            r.ID FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE t.Active = 1 AND t.TenantType = 'Main Tenant' AND r.rYear = {year} AND r.rMonthNo = {month} AND r.PaidAmount is null";  
            Utility._BindGridView(_GridView2, query);
            // 🔹 Calculate Total Due
            string queryTotal = $@"SELECT ISNULL(SUM(due), 0) AS TotalDue FROM Rent WHERE rYear = {year} AND rMonthNo = {month} AND AmountType = 'Pending' AND Active = '1'";
            DataTable dt = Utility._GetDataTable(queryTotal);
            decimal totalDue = 0;
            if (dt.Rows.Count > 0)
            decimal.TryParse(dt.Rows[0]["TotalDue"].ToString(), out totalDue);
            lblTotalDue.Text = $"Total Due Amount for {_DropDownListMonth.SelectedItem.Text} - {year}: ₹ {totalDue:N2}";
    }
        protected void _ImageButtonView_Click(object sender, ImageClickEventArgs e) 
        {
            ImageButton btn = (ImageButton)sender;
            string rentId = btn.CommandArgument;
            Response.Redirect("~/Payment.aspx?ID=" + rentId);
        }
    }
}
