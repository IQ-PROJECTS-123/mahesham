using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class MBuilding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Utility._BindGridView(gvBuilding, "SELECT ID, Title, Content_Person, Mobile, City,Email,Description, Active FROM Building");
            }

        }

        protected void _ImageButtonEdit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton _imgBtn = (ImageButton)sender;
            Response.Redirect("~/Building.aspx?ID=" + _imgBtn.CommandArgument);
        }

        protected void _ImageButtonDelete_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton _ImageButton = (ImageButton)sender;
            Utility.ExecuteQuery("Update Building Set Active=0 WHERE ID=@ID", false, new SqlParameter("@ID", _ImageButton.CommandArgument));
        }
    }
}