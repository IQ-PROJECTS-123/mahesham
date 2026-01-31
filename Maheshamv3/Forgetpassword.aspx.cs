using System;
using System.Data;
using System.Web.UI;

namespace Maheshamv3
{
    public partial class Forgetpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void _ButtonSendOTP_Click(object sender, EventArgs e)
        {
            string userInput = _TextBoxEmail.Text.Trim();
            if (string.IsNullOrEmpty(userInput))
            {
                _LabelMessage.CssClass = "text-danger text-center d-block mt-3";
                _LabelMessage.Text = "Please enter your Email or Phone.";
                return;
            }
            DataTable dt = Utility._GetDataTable("SELECT ID FROM Users WHERE Email='" + userInput + "' OR Phone='" + userInput + "'");
            if (dt.Rows.Count > 0)
            {
                string otp = new Random().Next(100000, 999999).ToString();
                Session["OTP"] = otp;
                Session["UserInput"] = userInput;
                _LabelMessage.CssClass = "text-success text-center d-block mt-3";
                _LabelMessage.Text = "OTP sent successfully! (Demo OTP: " + otp + ")";
                PanelOTP.Visible = true;
            }
            else
            {
                _LabelMessage.CssClass = "text-danger text-center d-block mt-3";
                _LabelMessage.Text = "No user found with this Email or Phone.";
            }
        }

        protected void _ButtonReset_Click(object sender, EventArgs e)
        {
            string otp = _TextBoxOTP.Text.Trim();
            string newPass = _TextBoxNewPass.Text.Trim();
            string confirmPass = _TextConfirmPass.Text.Trim();

            if (Session["OTP"] == null)
            {
                _LabelMessage.CssClass = "text-danger text-center d-block mt-3";
                _LabelMessage.Text = "OTP expired or not sent. Please try again.";
                return;
            }

            if (otp != Session["OTP"].ToString())
            {
                _LabelMessage.CssClass = "text-danger text-center d-block mt-3";
                _LabelMessage.Text = "Invalid OTP. Please try again.";
                return;
            }

            if (newPass != confirmPass)
            {
                _LabelMessage.CssClass = "text-danger text-center d-block mt-3";
                _LabelMessage.Text = "Password and Confirm Password do not match.";
                return;
            }
            string userInput = Session["UserInput"].ToString();
            string query = "UPDATE Users SET Password='" + newPass + "' WHERE Email='" + userInput + "' OR Phone='" + userInput + "'";
            Utility.ExecuteQuery(query);
            _LabelMessage.CssClass = "text-success text-center d-block mt-3";
            _LabelMessage.Text = "Password reset successfully!";
            PanelOTP.Visible = false;
            Session.Remove("OTP");
            Session.Remove("UserInput");
        }
    }
}
