using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class Rental : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                _DropDownListMonth.SelectedValue = DateTime.Now.ToString("MMM").ToUpper();
                _dropdownloadRent.SelectedValue = "All";
                BindGrid();
            }
        }
        protected void BindGrid()
        {

            bool showAll = _dropdownloadRent.SelectedValue == "All";
            _GridViewRent.Visible = showAll || _dropdownloadRent.SelectedValue == "Rental";
            _GridViewAdvance.Visible = showAll || _dropdownloadRent.SelectedValue == "Advance";
            //_GridViewEmpty.Visible = showAll || _dropdownloadRent.SelectedValue == "Empty";
            _GridViewVacent.Visible = showAll || _dropdownloadRent.SelectedValue == "Vacant";
            // Bind GridViews
            int rYear = int.Parse(_DropDownListYear.SelectedValue);
            int rMonth = _DropDownListMonth.SelectedIndex + 1;
            Utility._BindGridView(_GridViewAdvance, string.Format($@"SELECT f.Building + ' ' + f.Title + ' ' + f.Location AS facility,t.Name,t.Mobile1,FORMAT(r.PeriodStart, 'dd/MM/yyyy') AS PeriodStart, FORMAT(r.PeriodEnd, 'dd/MM/yyyy') AS PeriodEnd,r.Amount,r.MeterStart,r.MeterEnd,(r.MeterEnd - r.MeterStart) AS Unit, (r.MeterEnd - r.MeterStart) * 7 AS Bill,r.AmountType, r.TotalAmount, r.ID, r.PaidAmount FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE t.Active = 1 AND t.TenantType = 'Main Tenant' AND r.rYear = {_DropDownListYear.SelectedValue}AND r.rMonthNo = {_DropDownListMonth.SelectedIndex + 1}  AND r.AmountType = 'Advance' ORDER BY r.PaidAmount, t.Name"));
            Utility._BindGridView(_GridViewRent, string.Format($@"SELECT f.Building + ' ' + f.Title + ' ' + f.Location AS facility,t.Name,t.Mobile1,FORMAT(r.PeriodStart, 'dd/MM/yyyy') AS PeriodStart, FORMAT(r.PeriodEnd, 'dd/MM/yyyy') AS PeriodEnd,r.Amount,r.MeterStart,r.MeterEnd,(r.MeterEnd - r.MeterStart) AS Unit, (r.MeterEnd - r.MeterStart) * 7 AS Bill,r.AmountType, r.TotalAmount, r.ID, r.PaidAmount FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE t.Active = 1 AND t.TenantType = 'Main Tenant' AND r.rYear = {_DropDownListYear.SelectedValue}AND r.rMonthNo = {_DropDownListMonth.SelectedIndex + 1}  AND r.AmountType = 'Rental' ORDER BY r.PaidAmount, t.Name"));
            //Utility._BindGridView(_GridViewEmpty, string.Format($@"SELECT f.Building + ' ' + f.Title + ' ' + f.Location AS facility,t.Name,t.Mobile1,FORMAT(t.RentStart, 'dd/MM/yyyy') AS RentStart,NULL AS PeriodStart,NULL AS PeriodEnd,NULL AS Amount, NULL AS MeterStart,NULL AS MeterEnd, NULL AS Unit, NULL AS Bill,NULL AS AmountType,NULL AS TotalAmount,NULL AS ID,NULL AS PaidAmount FROM Tenant t INNER JOIN Facility f ON t.Facility = f.ID WHERE t.Active = 1 AND t.TenantType = 'Main Tenant' AND NOT EXISTS (SELECT 1 FROM Rent r WHERE r.Tenant = t.ID AND r.rYear = {_DropDownListYear.SelectedValue} AND r.rMonthNo = {_DropDownListMonth.SelectedIndex + 1})ORDER BY t.Name"));
            Utility._BindGridView(_GridViewVacent, $@"SELECT NULL AS Name,f.Building + ' ' + f.Title + ' ' + f.Location AS facility,NULL AS Mobile1,NULL AS PeriodStart,NULL AS PeriodEnd,NULL AS Amount,NULL AS MeterStart,NULL AS MeterEnd, NULL AS Unit,NULL AS Bill,NULL AS AmountType, NULL AS TotalAmount,NULL AS ID,NULL AS PaidAmount FROM Facility f WHERE f.Active = 1 AND f.ID NOT IN (SELECT DISTINCT t.Facility FROM Tenant t WHERE t.Active = 1)ORDER BY f.Building, f.Title");
            // Total Paid Amount
            string queryTotal = $@"SELECT ISNULL(SUM(PaidAmount),0) TotalPaid FROM Rent WHERE rYear={rYear} AND rMonthNo={rMonth} And Active = 1 AND AmountType='Rental'";
            DataTable dt = Utility._GetDataTable(queryTotal);
            decimal totalPaid = 0;
            if (dt.Rows.Count > 0)
            decimal.TryParse(dt.Rows[0]["TotalPaid"].ToString(), out totalPaid);
            lblTotalPaid.Text = $"Total Paid Amount Of {_DropDownListMonth.SelectedValue}-{rYear}: ₹ {totalPaid:N2}";
            // Total Advance Amount
            string queryTotalAdvance = $@"SELECT ISNULL(SUM(PaidAmount),0) TotalAdvance FROM Rent WHERE rYear={rYear} AND rMonthNo={rMonth} AND Active = 1 AND AmountType='Advance'";
            DataTable dtAdvance = Utility._GetDataTable(queryTotalAdvance);
            decimal totalAdvance = 0;
            if (dtAdvance.Rows.Count > 0) decimal.TryParse(dtAdvance.Rows[0]["TotalAdvance"].ToString(), out totalAdvance);
            lblTotalAdvance.Text = $"Total Advance Amount Of {_DropDownListMonth.SelectedValue}-{rYear}: ₹ {totalAdvance:N2}";

        }
        protected void _DropDownListMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void _DropDownListYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void _dropdownloadRent_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void _ImageButtonView_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            Response.Redirect("~/Payment.aspx?ID=" + imgBtn.CommandArgument);
        }

        protected void _ImageButtonView_Click1(object sender, ImageClickEventArgs e)
        {
            ImageButton imgBtn = (ImageButton)sender;
            string facilityId = imgBtn.CommandArgument;
            Response.Redirect("~/mTenent.aspx?FacilityID=" + facilityId);
        }

        protected void btnGrid_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Rental.aspx");
        }

        protected void btnTile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Rent.aspx");
        }
    }
}