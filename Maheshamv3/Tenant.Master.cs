using System;
using System.Web;

namespace Maheshamv3
{
    public partial class Tenant : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie reqCookies = Request.Cookies["userInfo"];

            if (reqCookies == null)
            {
                // No redirect — just default Login button
                ButtonLoginLogout.Text = "Login";
            }
            else
            {
                if (reqCookies["Tenant"] != "T")
                {
                    // Not tenant, still no redirect
                    ButtonLoginLogout.Text = "Login";
                }
                else
                {
                    // User is Tenant
                    ButtonLoginLogout.Text = "Logout";
                }
            }
        }

        protected void ButtonLoginLogout_Click(object sender, EventArgs e)
        {
            if (ButtonLoginLogout.Text == "Logout")
            {
                Response.Cookies["userInfo"].Expires = DateTime.Now.AddDays(-1);
                Response.Redirect("~/authlogin.aspx");
            }
            else
            {
                Response.Redirect("~/authlogin.aspx");
            }
        }
    }
}
