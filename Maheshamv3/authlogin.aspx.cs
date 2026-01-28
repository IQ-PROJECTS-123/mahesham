using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace Maheshamv3
{
    public partial class authlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear old cookie
                if (Request.Cookies["userInfo"] != null)
                    Response.Cookies["userInfo"].Expires = DateTime.Now.AddDays(-1);
            }
        }

        protected void ButtonSign_Click(object sender, EventArgs e)
        {
            Boolean IsAdmin = true;

            // ----- ADMIN LOGIN CHECK ------
            DataTable dt = Utility._GetDataTable($@"SELECT ID, Name, Email FROM Management WHERE (Phone='{_TextBoxUser.Text.Trim()}' OR Email='{_TextBoxUser.Text.Trim()}') AND PWD='{_TextBoxPWD.Text.Trim()}'");

            // ----- TENANT LOGIN CHECK -----
            if (dt.Rows.Count == 0)
            {
                dt = Utility._GetDataTable($@"SELECT ID, Name, Email, Facility, Active FROM Tenant WHERE (Mobile1='{_TextBoxUser.Text.Trim()}' OR Email='{_TextBoxUser.Text.Trim()}') AND PWD='{_TextBoxPWD.Text.Trim()}'");

                IsAdmin = false;
            }

            try
            {
                if (dt.Rows.Count > 0)
                {
                    HttpCookie userInfo = new HttpCookie("userInfo");
                    userInfo["auth"] = Session.SessionID;
                    userInfo["uID"] = dt.Rows[0]["ID"].ToString();
                    userInfo["uName"] = dt.Rows[0]["Name"].ToString();
                    userInfo.Expires = DateTime.Now.AddHours(2);

                    // ------ ADMIN LOGIN SUCCESS ---------
                    if (IsAdmin)
                    {
                        userInfo["IsAdmin"] = "A";
                        userInfo["LoginType"] = "Admin";

                        Response.Cookies.Add(userInfo);
                        Response.Redirect("~/Dashboard.aspx", false);
                        return;
                    }

                    // -------- TENANT LOGIN SUCCESS ---------
                    userInfo["IsAdmin"] = "T";
                    userInfo["Tenant"] = dt.Rows[0]["ID"].ToString();
                    userInfo["Facility"] = dt.Rows[0]["Facility"].ToString();
                    userInfo["LoginType"] = "Tenant";

                    Response.Cookies.Add(userInfo);

                    bool isActive = Convert.ToBoolean(dt.Rows[0]["Active"]);

                    // inactive
                    if (!isActive)
                    {
                        Utility._SendEmail("shrikantkumar.info@gmail.com", "", dt.Rows[0]["Name"] + " Login Attempt", $"Tenant {dt.Rows[0]["Name"]} tried to login on {DateTime.Now}"
                        );

                        Response.Redirect("~/ledger.aspx", false);
                        return;
                    }

                    // ACTIVE TENANT 
                    Response.Redirect("~/TDashboard.aspx", false);
                }
                else
                {
                    // Optionally show invalid login
                }
            }
            catch (Exception ex)
            {
                // Log error if needed
            }
        }
    }
}
