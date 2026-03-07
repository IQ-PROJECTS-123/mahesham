using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class Payment_Due : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                _DropDownListMonth.SelectedValue = DateTime.Now.Month.ToString();
                BindPaymentDueGrid();
            }
        }
        protected void _DropDownListYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindPaymentDueGrid();
        }
        protected void _DropDownListMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindPaymentDueGrid();
        }
        private void BindPaymentDueGrid()
        {
            if (!int.TryParse(_DropDownListMonth.SelectedValue, out int month))
            {
                _GridView2.DataSource = null;
                _GridView2.DataBind();
                _LabelYearMonth.Text = "";
                return;
            }
            if (!int.TryParse(_DropDownListYear.SelectedValue, out int year))
            {
                _GridView2.DataSource = null;
                _GridView2.DataBind();
                _LabelYearMonth.Text = "";
                return;
            }
            _LabelYearMonth.Text = _DropDownListMonth.SelectedItem.Text + " " + year;
            string query = $@"SELECT t.Name AS Tenant, f.Title AS Room, DATENAME(MONTH, DATEFROMPARTS(r.rYear, r.rMonthNo, 1)) AS MonthName, r.rYear AS Year, FORMAT(r.PeriodStart, 'dd/MM/yyyy') AS PeriodStart, FORMAT(r.PeriodEnd, 'dd/MM/yyyy') AS PeriodEnd, r.MeterStart, r.MeterEnd, r.MeterEnd - r.MeterStart AS Unit, (r.MeterEnd - r.MeterStart) * r.eUnitCost AS Bill, r.TotalAmount, r.PaidAmount, r.due,
            r.ID FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE t.Active = 1 AND t.TenantType = 'Main Tenant' AND r.rYear = {year} AND r.rMonthNo = {month} AND r.PaidAmount is null";
            Utility._BindGridView(_GridView2, query);
            // 🔹 Calculate Total Due
            string queryTotal = $@"SELECT ISNULL(SUM(due), 0) AS TotalDue FROM Rent WHERE rYear = {year} AND rMonthNo = {month} AND AmountType = 'Pending' AND Active = '1'";
            DataTable dt = Utility._GetDataTable(queryTotal);
            decimal totalDue = 0;
            if (dt.Rows.Count > 0)
                decimal.TryParse(dt.Rows[0]["TotalDue"].ToString(), out totalDue);
            lblTotalDue.Text = $"Total Due Amount for {_DropDownListMonth.SelectedItem.Text} - {year}: ₹ {totalDue:N2}";
        }
        protected void _ImageButtonView_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string rentId = btn.CommandArgument;
            Response.Redirect("~/Payment.aspx?ID=" + rentId);
        }

        protected void btnDownloadPDF_Click(object sender, EventArgs e)
        {
            int month = Convert.ToInt32(_DropDownListMonth.SelectedValue);
            int year = Convert.ToInt32(_DropDownListYear.SelectedValue);
            string query = $@"SELECT t.Name AS Tenant,f.Title AS Room,DATENAME(MONTH, DATEFROMPARTS(r.rYear,r.rMonthNo,1)) AS MonthName,r.rYear AS Year,r.TotalAmount,r.due FROM Rent r INNER JOIN Tenant t ON r.Tenant=t.ID INNER JOIN Facility f ON r.Facility=f.ID WHERE t.Active=1 AND t.TenantType='Main Tenant' AND r.rYear={year} AND r.rMonthNo={month}AND r.PaidAmount IS NULL"; DataTable dt = Utility._GetDataTable(query);
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=PaymentDueReport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 20f, 10f);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            Font titleFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 18);
            Font headerFont = FontFactory.GetFont(FontFactory.HELVETICA_BOLD, 12);
            Font bodyFont = FontFactory.GetFont(FontFactory.HELVETICA, 11);
            Paragraph title = new Paragraph("Payment Due Report", titleFont);
            title.Alignment = Element.ALIGN_CENTER;
            pdfDoc.Add(title);
            pdfDoc.Add(new Paragraph("Month: " + _DropDownListMonth.SelectedItem.Text + " " + year));
            pdfDoc.Add(new Paragraph(" "));
            PdfPTable table = new PdfPTable(6);
            table.WidthPercentage = 100;
            table.SetWidths(new float[] { 3, 2, 2, 2, 2, 2 });
            string[] headers = { "Tenant", "Room", "Month", "Year", "Total Amount", "Due" };
            foreach (string header in headers)
            {
                PdfPCell cell = new PdfPCell(new Phrase(header, headerFont));
                cell.BackgroundColor = BaseColor.LIGHT_GRAY;
                cell.HorizontalAlignment = Element.ALIGN_CENTER;
                table.AddCell(cell);
            }

            foreach (DataRow row in dt.Rows)
            {
                table.AddCell(new Phrase(row["Tenant"].ToString(), bodyFont));
                table.AddCell(new Phrase(row["Room"].ToString(), bodyFont));
                table.AddCell(new Phrase(row["MonthName"].ToString(), bodyFont));
                table.AddCell(new Phrase(row["Year"].ToString(), bodyFont));
                table.AddCell(new Phrase(row["TotalAmount"].ToString(), bodyFont));
                table.AddCell(new Phrase(row["due"].ToString(), bodyFont));
            }

            pdfDoc.Add(table);

            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for GridView PDF Export
        }

    }
}
