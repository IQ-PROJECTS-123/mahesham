using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class TDashboard : System.Web.UI.Page
    {
        int tenantID = 0;
        int facilityID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["userInfo"] == null)
                Response.Redirect("~/authlogin.aspx");
            else
            {
                tenantID = Convert.ToInt32(Request.Cookies["userInfo"]["Tenant"]);
                facilityID = Convert.ToInt32(Request.Cookies["userInfo"]["Facility"]);
            }

            if (!IsPostBack)
            {
                LoadTenantDetails();
                _DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                BindRentData();
            }
        }

        // ⭐ Load Tenant Name + Only His Room
        private void LoadTenantDetails()
        {
            DataTable dt = Utility._GetDataTable($@"SELECT ID, Name, Facility FROM Tenant WHERE ID = {tenantID}");
            if (dt.Rows.Count > 0)
            {
                _TextName.Text = dt.Rows[0]["Name"].ToString();
                facilityID = Convert.ToInt32(dt.Rows[0]["Facility"]);

                string roomQuery = $@"
                    SELECT ID,
                    Building + ' ' + Title + ' ' + Location AS Title
                    FROM Facility 
                    WHERE ID = {facilityID} AND Active = 1";

                _DropDownListFacility.Items.Clear();
                Utility._BindDropdown(_DropDownListFacility, roomQuery, "ID", "Title", false);

                _DropDownListFacility.SelectedValue = facilityID.ToString();
                _DropDownListFacility.Enabled = false;
            }
        }

        // ⭐ Bind Rent Data
        private void BindRentData()
        {
            int year = Convert.ToInt32(_DropDownListYear.SelectedValue);
            int room = Convert.ToInt32(_DropDownListFacility.SelectedValue);
            string query = $@"SELECT r.ID,FORMAT(r.PeriodStart, 'dd/MM/yyyy') AS StartDate,FORMAT(r.PeriodEnd, 'dd/MM/yyyy') AS EndDate,r.Amount,r.PaidAmount,r.TotalAmount,((r.MeterEnd - r.MeterStart) * 7) AS Bill FROM Rent r WHERE r.Tenant = {tenantID} AND r.Facility = {room} AND r.rYear = {year} ORDER BY r.rMonthNo";
            Utility._BindGridView(_GridViewRent, query);
        }

        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRentData();
        }

        protected void _DropDownListYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRentData();
        }

        // ⭐ Pay Button Click
        protected void _GridViewRent_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Pay")
            {
                string rentId = e.CommandArgument.ToString();
                Response.Redirect("TPayment.aspx?RentID=" + rentId);
            }
        }

        // ⭐ Hide Pay Button if Paid
        protected void _GridViewRent_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
               
                object paidObj = DataBinder.Eval(e.Row.DataItem, "PaidAmount");
                decimal paid = paidObj == DBNull.Value ? 0 : Convert.ToDecimal(paidObj);
                object totalObj = DataBinder.Eval(e.Row.DataItem, "TotalAmount");
                decimal total = totalObj == DBNull.Value ? 0 : Convert.ToDecimal(totalObj);
                Button payBtn = (Button)e.Row.FindControl("btnPay");
                if (paid >= total)
                {
                    payBtn.Visible = false;
                }
            }
        }

    }
}
