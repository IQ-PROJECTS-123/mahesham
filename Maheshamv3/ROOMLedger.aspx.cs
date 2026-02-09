using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class ROOMLedger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                _DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                Utility._BindDropdown(_DropDownListFacility, String.Format("select f.ID,f.Building+' '+ f.Title+' '+f.Location as Title from facility f where  f.Active=1 Order by ID"), "ID", "Title", false);
                _Bind();
            }
        }
        protected void _Bind()
        {
            Utility._BindGridView(GridView2, String.Format("select f.Building+' '+ f.Title+' '+f.Location as facility,t.Name,t.Mobile1, FORMAT(r.PeriodStart, 'dd/MM/yyyy') as PeriodStart,FORMAT(r.PeriodEnd, 'dd/MM/yyyy') as PeriodEnd, r.Amount,r.MeterStart,r.MeterEnd,r.eUnitCost, r.MeterEnd-r.MeterStart as Unit,(r.MeterEnd-r.MeterStart) * r.eUnitCost as Bill ,r.TotalAmount,r.Maintenance,r.PaidAmount,r.PaymentType, FORMAT(r.PaidOn, 'dd-MMM-yy') as PaidOn, r.due,r.ID,r.rMonth,r.AmountType from Rent r,Tenant t,facility f where r.Facility =f.ID and r.Tenant=t.ID and t.Active=1 and t. TenantType='Main Tenant' and r.rYear={0} and r.Facility={1}", _DropDownListYear.SelectedValue,_DropDownListFacility.SelectedValue));

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