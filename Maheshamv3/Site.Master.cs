using System;
using System.Web;
using System.Web.UI;

namespace Maheshamv3
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];

                if (reqCookies == null)
                {
                    ButtonLoginLogout.Text = "Login";
                    ButtonLoginLogout.CssClass = "btn btn-primary rounded-pill py-2 px-4 ms-2";
                }
                else
                {
                    ButtonLoginLogout.Text = "Logout";
                    ButtonLoginLogout.CssClass = "btn btn-danger rounded-pill py-2 px-4 ms-2";
                }
            }
        }

        protected void ButtonLoginLogout_Click(object sender, EventArgs e)
        {
            if (ButtonLoginLogout.Text == "Login")
            {
                Response.Redirect("~/authlogin.aspx");
            }
            else
            {
                HttpCookie reqCookies = Request.Cookies["userInfo"];
                if (reqCookies != null)
                {
                    reqCookies.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(reqCookies);
                }

                Response.Redirect("~/authlogin.aspx");
            }
        }
    }
}
