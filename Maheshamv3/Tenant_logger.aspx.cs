using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class Tenant_logger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];
                if (reqCookies == null)
                    Response.Redirect("~/authlogin.aspx");

                string tenantId = reqCookies["UserID"]; 
                Utility._BindDropdown(_DropDownListFacility,
                    "SELECT f.ID, f.Building + ' ' + f.Title + ' ' + f.Location AS Title FROM Facility f WHERE f.Active = 1 ORDER BY ID",
                    "ID", "Title", false);
                _Bind(tenantId);
            }
        }

        protected void _Bind(string tenantId)
        {
            string query = string.Format(@"
                SELECT 
                    f.Building + ' ' + f.Title + ' ' + f.Location AS Facility,
                    t.Name,
                    t.Mobile1,
                    FORMAT(r.PeriodStart, 'dd/MM/yyyy') AS PeriodStart,
                    FORMAT(r.PeriodEnd, 'dd/MM/yyyy') AS PeriodEnd,
                    r.rMonth,
                    r.Amount,
                    r.MeterStart,
                    r.MeterEnd,
                    r.MeterEnd - r.MeterStart AS Unit,
                    (r.MeterEnd - r.MeterStart) * 7 AS Bill,
                    r.TotalAmount,
                    r.PaidAmount,
                    FORMAT(r.PaidOn, 'dd-MMM-yy') AS PaidOn,
                    r.Due,
                    r.ID
                FROM Rent r
                INNER JOIN Tenant t ON r.Tenant = t.ID
                INNER JOIN Facility f ON r.Facility = f.ID
                WHERE t.Active = 1 AND t.ID = {0} AND t.TenantType='Main Tenent'
                ORDER BY r.PeriodStart DESC", tenantId);

            Utility._BindGridView(GridView2, query);
        }

        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            HttpCookie reqCookies = Request.Cookies["userInfo"];
            string tenantId = reqCookies["UserID"];
            _Bind(tenantId);
        }

        // Update Payment button click
        protected void _ImageButtonView_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            Response.Redirect("~/Payment.aspx?ID=" + btn.CommandArgument);
        }
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal due = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Due"));
                PlaceHolder ph = (PlaceHolder)e.Row.FindControl("phAction");

                if (due > 0)
                {
                    ImageButton btn = new ImageButton();
                    btn.ID = "_ImageButtonView";
                    btn.CommandArgument = DataBinder.Eval(e.Row.DataItem, "ID").ToString();
                    btn.ImageUrl = "~/img/edit.png";
                    btn.Width = 30;
                    btn.ToolTip = "Update Payment";
                    btn.Click += _ImageButtonView_Click;
                    ph.Controls.Add(btn);
                }
                else
                {
                    Label lbl = new Label();
                    lbl.Text = "<span class='badge bg-success'>Done</span>";
                    ph.Controls.Add(lbl);
                }
            }
        }
    }
}