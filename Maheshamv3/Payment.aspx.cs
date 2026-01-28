using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Maheshamv3
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && !String.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                LoadPaymentData(Request.QueryString["ID"]);
            }
        }

        private void LoadPaymentData(string rentId)
        {
            string query = @"SELECT f.Building + ' ' + f.Title + ' ' + f.Location AS facility,t.Name, t.Mobile1,FORMAT(r.PeriodStart,'dd/MM/yyyy') AS PeriodStart,FORMAT(r.PeriodEnd,'dd/MM/yyyy') AS PeriodEnd,FORMAT(r.PaidOn,'yyyy-MM-dd') AS PaymentDate,r.rMonth, r.rYear, r.Amount, r.MeterStart, r.MeterEnd,r.MeterEnd - r.MeterStart AS Unit,(r.MeterEnd - r.MeterStart) * 7 AS Bill,r.TotalAmount,r.Due FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE r.ID=" + rentId;
            DataTable dt = Utility._GetDataTable(query);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                _LabelMonth.Text = row["rMonth"] + " " + row["rYear"];
                _LabelName.Text = row["Name"].ToString();
                _LabelRoom.Text = row["facility"].ToString();
                _TextBoxAmount.Text = _LabelTotal.Text = row["TotalAmount"].ToString();
                // Set loaded Payment Date or default today's date
                _TextBoxStartDate.Text = !string.IsNullOrEmpty(row["PaymentDate"].ToString()) ? row["PaymentDate"].ToString() : DateTime.Now.ToString("yyyy-MM-dd");
                ViewState["PeriodStart"] = row["PeriodStart"].ToString();
                ViewState["PeriodEnd"] = row["PeriodEnd"].ToString();
                ViewState["MeterStart"] = row["MeterStart"].ToString();
                ViewState["MeterEnd"] = row["MeterEnd"].ToString();
                ViewState["Unit"] = row["Unit"].ToString();
                ViewState["Bill"] = row["Bill"].ToString();
                ViewState["PrevDue"] = row["Due"] != DBNull.Value ? row["Due"].ToString() : "0";
                _ButtonSubmit.Visible = true;
            }
        }

        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            string paymentDate = _TextBoxStartDate.Text;
            string fileName = "";

            if (_FileUpload.HasFile)
            {
                string ext = System.IO.Path.GetExtension(_FileUpload.FileName);
                fileName = Request.QueryString["ID"] + ext;
                _FileUpload.SaveAs(Server.MapPath("~/Payment/" + fileName));
            }

            decimal totalAmount = Convert.ToDecimal(_LabelTotal.Text);
            decimal paidAmount = Convert.ToDecimal(_TextBoxAmount.Text);
            decimal dueAmount = totalAmount - paidAmount;

            string payType = _DropDownListType.SelectedValue;

            decimal cashPart = 0;
            decimal upiPart = 0;

            // ---- CASH ----
            if (payType == "Cash")
            {
                cashPart = paidAmount;
                upiPart = 0;
                payType = "cash";
            }

            // ---- SCAN / BANK / UPI ----
            else if (payType == "Scan" || payType == "Bank" || payType == "UPI")
            {
                cashPart = 0;
                upiPart = paidAmount;
                payType = "scan";
            }

            // ---- CASH + UPI ----
            else if (payType == "Cash+UPI")
            {
                cashPart = Convert.ToDecimal(_txtCashAmount.Text);
                upiPart = Convert.ToDecimal(_txtUpiAmount.Text);
                paidAmount = cashPart + upiPart;
                payType = "cash+upi";
            }

            // ---- UPDATE RENT TABLE ----
            Utility.ExecuteQuery(@"UPDATE Rent SET PaidAmount = @PaidAmount,CashAmount = @CashAmount,UpiAmount = @UpiAmount,PaymentType = @PaymentType,PaymentFile = @PaymentFile,PaidOn = @PaidOn,Due = @Due,Status = 'Completed',Remarks = @Remarks WHERE ID = @ID",
                false,
                new SqlParameter("@PaidAmount", paidAmount),
                new SqlParameter("@CashAmount", cashPart),
                new SqlParameter("@UpiAmount", upiPart),
                new SqlParameter("@PaymentType", payType),
                new SqlParameter("@PaymentFile", fileName),
                new SqlParameter("@PaidOn", Convert.ToDateTime(paymentDate).ToString("yyyy-MM-dd")),
                new SqlParameter("@Due", dueAmount),
                new SqlParameter("@Remarks", _TextBoxNote.Text),
                new SqlParameter("@ID", Request.QueryString["ID"])
            );

            _ButtonSubmit.Visible = false;
            _ButtonNewReading.Visible = true;
            _LiteralMSG.Text = "<div class='p-3 mb-2 bg-success text-white'>Payment Submitted Successfully!</div>";

            string emailBody = $@"<h3>Payment Details</h3>
            <table border='1' cellpadding='6' cellspacing='0' style='width:70%;font-family:Arial;font-size:14px;'>
                <tr><td><b>Tenant</b></td><td>{_LabelName.Text}</td></tr>
                <tr><td><b>Room</b></td><td>{_LabelRoom.Text}</td></tr>
                <tr><td><b>Month</b></td><td>{_LabelMonth.Text}</td></tr>
                <tr><td><b>Payment Date</b></td><td>{paymentDate}</td></tr>
                <tr><td><b>Total</b></td><td>{_LabelTotal.Text}</td></tr>
                <tr><td><b>Paid Amount</b></td><td>{paidAmount}</td></tr>
                <tr><td><b>Previous Due</b></td><td>{ViewState["PrevDue"]}</td></tr>
                <tr><td><b>Current Due</b></td><td>{dueAmount}</td></tr>
                <tr><td><b>Payment Type</b></td><td>{_DropDownListType.SelectedValue}</td></tr>
                <tr><td><b>Remarks</b></td><td>{_TextBoxNote.Text}</td></tr>
            </table>";
            Utility._SendEmail("Shrikantkumar.info@gmail.com", "", "Payment Submitted", emailBody);
            //Utility._SendEmail("rajnish5454kumar@gmail.com", "", "Payment Submitted", emailBody);
        }

        protected void _DropDownListType_SelectedIndexChanged(object sender, EventArgs e)
        {
            CashDiv.Visible = _DropDownListType.SelectedValue == "Cash+UPI";
            UPIDiv.Visible = _DropDownListType.SelectedValue == "Cash+UPI";
        }
    }
}
