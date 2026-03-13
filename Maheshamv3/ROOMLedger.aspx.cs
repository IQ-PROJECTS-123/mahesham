using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class ROOMLedger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ListItem currentYearItem = _DropDownListYear.Items.FindByValue(DateTime.Now.Year.ToString());
                if (currentYearItem != null)
                {
                    _DropDownListYear.ClearSelection();
                    currentYearItem.Selected = true;
                }

                Utility._BindDropdown(_DropDownListFacility, "SELECT f.ID, f.Building + ' ' + f.Title + ' ' + f.Location AS Title FROM Facility f WHERE f.Active=1 ORDER BY f.ID", "ID", "Title", false);
                _Bind();
            }
        }

        protected void _Bind()
        {
            if (string.IsNullOrEmpty(_DropDownListFacility.SelectedValue))return;
            string query = string.Format(@"SELECT f.Building + ' ' + f.Title + ' ' + f.Location AS Facility,t.Name,t.Mobile1,FORMAT(r.PeriodStart,'dd/MM/yyyy') AS PeriodStart,FORMAT(r.PeriodEnd,'dd/MM/yyyy') AS PeriodEnd,r.Amount,r.MeterStart,r.MeterEnd,r.eUnitCost,(r.MeterEnd - r.MeterStart) AS Unit,(r.MeterEnd - r.MeterStart) * r.eUnitCost AS Bill,r.TotalAmount,r.Maintenance,ISNULL(r.PaidAmount,0) AS PaidAmount,ISNULL(r.Due,0) AS Due,CASE WHEN ISNULL(r.Due,0)=0 THEN 'PAID' ELSE 'PENDING' END AS Status,r.PaymentType,FORMAT(r.PaidOn,'dd-MMM-yy') AS PaidOn,r.ID,r.rMonth,r.AmountType FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE t.Active = 1 AND r.Active = 1 AND t.TenantType = 'Main Tenant'AND r.rYear = {0}AND r.Facility = {1}ORDER BY r.rMonthNo", _DropDownListYear.SelectedValue, _DropDownListFacility.SelectedValue);
            Utility._BindGridView(GridView2, query);
        }

        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            _Bind();
        }

        protected void _ImageButtonView_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton _Img = (ImageButton)sender;
            Response.Redirect("~/Payment.aspx?ID=" + _Img.CommandArgument);
        }
    }
}