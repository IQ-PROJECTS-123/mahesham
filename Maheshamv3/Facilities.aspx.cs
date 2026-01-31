using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class Fascility : System.Web.UI.Page
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Utility._BindGridView(gvFacility, "SELECT ID, Title, Building, Location, Active FROM Facility");
            }
        }
        protected void _ImageButtonDelete_Click(object sender, EventArgs e)
        {
            ImageButton _ImageButton=(ImageButton)sender;
            Utility.ExecuteQuery("Update Facility Set Active=0 WHERE ID=@ID",false, new SqlParameter("@ID", _ImageButton.CommandArgument));           
          
        }
        protected void btnEdit_Click(object sender, System.Web.UI.ImageClickEventArgs e)
        {
            ImageButton _imgBtn = (ImageButton)sender;
            Response.Redirect("~/Facility.aspx?ID=" + _imgBtn.CommandArgument);
        }
    }
}
