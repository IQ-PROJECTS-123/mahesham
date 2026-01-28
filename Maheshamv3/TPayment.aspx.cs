using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;

namespace Maheshamv3
{
    public partial class TPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HttpCookie cookie = Request.Cookies["userInfo"];
                if (cookie == null || cookie["Tenant"] == null)
                {
                    Response.Redirect("~/authlogin.aspx");
                    return;
                }
                if (Request.QueryString["RentID"] != null)
                {
                    string rentId = Request.QueryString["RentID"];
                    LoadPaymentByRentID(rentId);
                }
                else
                {
                    _LiteralMSG.Text = "<div class='alert alert-danger'>Invalid Payment Request! RentID Missing.</div>";
                    _ButtonSubmit.Visible = false;
                }
            }
        }

        private void LoadPaymentByRentID(string rentId)
        {
            string query = @"SELECT r.ID,t.Name,t.Email,f.Building + ' ' + f.Title + ' ' + f.Location AS Facility,FORMAT(r.PaidOn,'yyyy-MM-dd') AS PaymentDate,r.rMonth, r.rYear, r.TotalAmount, r.Due, r.Status FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE r.ID = " + rentId;
            DataTable dt = Utility._GetDataTable(query);
            if (dt.Rows.Count == 0)
            {
                _LiteralMSG.Text = "<div class='alert alert-warning'>Payment Record Not Found!</div>";
                _ButtonSubmit.Visible = false;
                return;
            }
            DataRow row = dt.Rows[0];
            ViewState["RentID"] = row["ID"].ToString();
            ViewState["TenantEmail"] = row["Email"].ToString();
            ViewState["PrevDue"] = row["Due"].ToString();
            _LabelName.Text = row["Name"].ToString();
            _LabelRoom.Text = row["Facility"].ToString();
            _LabelMonth.Text = row["rMonth"] + " " + row["rYear"];
            _LabelTotal.Text = row["TotalAmount"].ToString();
            _TextBoxAmount.Text = row["TotalAmount"].ToString();
            //_LabelStatus.Text = row["Status"].ToString();
            _TextBoxStartDate.Text = string.IsNullOrEmpty(row["PaymentDate"].ToString()) ? DateTime.Now.ToString("yyyy-MM-dd") : row["PaymentDate"].ToString();
            if (row["Status"].ToString() == "PendingApproval")
            {
                _LiteralMSG.Text = "<div class='alert alert-info'>Your payment is waiting for admin approval.</div>";
                _ButtonSubmit.Visible = false;
            }
            else
            {
                _ButtonSubmit.Visible = true;
            }
        }
        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (ViewState["RentID"] == null)
            {
                _LiteralMSG.Text = "<div class='alert alert-danger'>Invalid Payment!</div>";
                return;
            }

            string rentId = ViewState["RentID"].ToString();
            string tenantEmail = ViewState["TenantEmail"].ToString();
            string paymentDate = _TextBoxStartDate.Text;
            string fileName = "";

            if (_FileUpload.HasFile)
            {
                string extension = System.IO.Path.GetExtension(_FileUpload.FileName);
                fileName = rentId + (string.IsNullOrEmpty(extension) ? ".jpg" : extension);
                _FileUpload.SaveAs(Server.MapPath("~/Payment/" + fileName));
            }

            decimal paid = Convert.ToDecimal(_TextBoxAmount.Text);
            decimal total = Convert.ToDecimal(_LabelTotal.Text);
            decimal due = total - paid;

            // UPDATE PAYMENT IN DATABASE
            Utility.ExecuteQuery(@"UPDATE Rent SET PaidAmount=@PaidAmount,PaymentFile=@PaymentFile,Due=@Due,PaidOn=@PaidOn,Status='PendingApproval',PaymentType=@PaymentType,Remarks=@Remarks WHERE ID=@ID",
                false,
                new SqlParameter("@PaidAmount", paid),
                new SqlParameter("@PaymentFile", fileName),
                new SqlParameter("@Due", due),
                new SqlParameter("@PaidOn", paymentDate),
                new SqlParameter("@PaymentType", _DropDownListType.SelectedValue),
                new SqlParameter("@Remarks", _TextBoxNote.Text),
                new SqlParameter("@ID", rentId)
            );

            _LiteralMSG.Text = "<div class='alert alert-success'>Payment Submitted! Waiting for admin approval.</div>";
            _ButtonSubmit.Visible = false;

            // SEND EMAIL TO ADMIN
            string approvalLink = "https://yourdomain.com/admin/approve.aspx?ID=" + rentId;

            string emailBody = $@"
                <h3>New Tenant Payment – Approval Required</h3>
                <p>A tenant submitted a payment. Please approve or reject.</p>
                <table border='1' cellpadding='6' style='width:70%;font-family:Arial;'>
                    <tr><td><b>Tenant</b></td><td>{_LabelName.Text}</td></tr>
                    <tr><td><b>Room</b></td><td>{_LabelRoom.Text}</td></tr>
                    <tr><td><b>Month</b></td><td>{_LabelMonth.Text}</td></tr>
                    <tr><td><b>Payment Date</b></td><td>{paymentDate}</td></tr>
                    <tr><td><b>Total</b></td><td>{_LabelTotal.Text}</td></tr>
                    <tr><td><b>Paid</b></td><td>{paid}</td></tr>
                    <tr><td><b>Previous Due</b></td><td>{ViewState["PrevDue"]}</td></tr>
                    <tr><td><b>Current Due</b></td><td>{due}</td></tr>
                </table>
                <br/><br/>
                <a href='" + approvalLink + @"' style='padding:10px 15px;background:#28a745;color:white;text-decoration:none;'>APPROVE PAYMENT</a>
            ";

            Utility._SendEmail("Shrikantkumar.info@gmail.com", "", "Tenant Payment Approval Needed", emailBody);
        }

        protected void _DropDownListType_SelectedIndexChanged(object sender, EventArgs e)
        {
            CashDiv.Visible = _DropDownListType.SelectedValue == "Cash+UPI";
            UPIDiv.Visible = _DropDownListType.SelectedValue == "Cash+UPI";
        }
    }
}
