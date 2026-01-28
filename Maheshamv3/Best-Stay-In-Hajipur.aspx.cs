using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class testpage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDouble_Click(object sender, EventArgs e)
        {

        }

        protected void btnSingle_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConnectWithUs1.aspx");
        }
    }
}