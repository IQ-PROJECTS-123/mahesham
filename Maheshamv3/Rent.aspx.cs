using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class Rent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _DropDownListYear.SelectedValue = DateTime.Now.Year.ToString();
                _DropDownListMonth.SelectedValue = DateTime.Now.ToString("MMM").ToUpper();
                _dropdownloadRent.SelectedValue = "All";
                BindGrid();
            }
        }

        protected void BindGrid()
        {
            bool showAll = _dropdownloadRent.SelectedValue == "All";
            PanelPending.Visible = showAll || _dropdownloadRent.SelectedValue == "Pending";
            PanelAdvance.Visible = showAll || _dropdownloadRent.SelectedValue == "Advance";
            PanelRent.Visible = showAll || _dropdownloadRent.SelectedValue == "Rental";
            PanelVacent.Visible = showAll || _dropdownloadRent.SelectedValue == "Vacent";


            int rYear = int.Parse(_DropDownListYear.SelectedValue);
            int rMonth = _DropDownListMonth.SelectedIndex + 1;
            //----Pending ----
            string queryPending = $@"SELECT f.Building + ' ' + f.Title + ' ' + f.Location AS facility,t.Name,t.Mobile1,FORMAT(r.PeriodStart,'dd/MM/yyyy') AS PeriodStart,FORMAT(r.PeriodEnd,'dd/MM/yyyy') AS PeriodEnd,r.Amount,r.MeterStart,r.MeterEnd,r.MeterEnd - r.MeterStart AS Unit,(r.MeterEnd - r.MeterStart) * ISNULL(r.eUnitCost, 0) AS Bill,r.AmountType,r.TotalAmount,r.ID,ISNULL(r.PaidAmount,0) AS PaidAmount FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE t.Active = 1 AND t.TenantType='Main Tenant'AND r.rYear = {rYear} AND r.rMonthNo = {rMonth}AND ISNULL(r.PaidAmount,0)=0 ORDER BY t.Name"; DataTable dtPending = Utility._GetDataTable(queryPending);
            _LiteralrPeding.Text = dtPending.Rows.Count.ToString();
            ListViewPending.DataSource = dtPending;
            ListViewPending.DataBind();

            //------- TOTAL ADVANCE --------
            string queryTotalAdvance = $@"SELECT ISNULL(SUM(PaidAmount),0) TotalAdvance FROM Rent WHERE rYear={rYear} AND rMonthNo={rMonth} AND Active = 1 AND AmountType='Advance'";
            DataTable dtAdv = Utility._GetDataTable(queryTotalAdvance);
            decimal totalAdv = Convert.ToDecimal(dtAdv.Rows[0]["TotalAdvance"]);
            lblTotalAdvance.Text = $"₹ {totalAdv:N2}";

            //------- ADVANCE --------------
            string queryAdvance = $@"SELECT f.Building + ' ' + f.Title + ' ' + f.Location AS facility,t.Name,t.Mobile1,FORMAT(r.PeriodStart,'dd/MM/yyyy') AS PeriodStart,FORMAT(r.PeriodEnd,'dd/MM/yyyy') AS PeriodEnd, r.Amount,r.MeterStart,r.MeterEnd, r.MeterEnd - r.MeterStart AS Unit,(r.MeterEnd - r.MeterStart) * ISNULL(r.eUnitCost, 0) AS Bill,r.AmountType,r.TotalAmount,r.ID,r.PaidAmount FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE t.Active = 1 AND t.TenantType='Main Tenant' AND r.rYear = {rYear} AND r.rMonthNo = {rMonth} AND r.AmountType='Advance' ORDER BY r.PaidAmount, t.Name";
            DataTable _dtAvnace = Utility._GetDataTable(queryAdvance);
            _LiteralrAdvace.Text = _dtAvnace.Rows.Count.ToString();
            ListViewAdvance.DataSource = _dtAvnace;
            ListViewAdvance.DataBind();

            //--------- TOTAL PAID RENT ----------
            string queryTotalRent = $@"SELECT ISNULL(SUM(PaidAmount),0) AS TotalPaid FROM Rent WHERE Active = 1 AND rYear = {rYear} AND rMonthNo = {rMonth}AND AmountType = 'Rental'";
            decimal totalRent = Convert.ToDecimal(Utility._GetDataTable(queryTotalRent).Rows[0]["TotalPaid"]);
            lblTotalPaid.Text = $"₹{totalRent:N2}";

            //--------- TOTAL CASH ----------
            string queryTotalCash = $@"SELECT ISNULL(SUM(PaidAmount),0) AS TotalCash FROM Rent WHERE Active = 1 AND rYear = {rYear} AND rMonthNo = {rMonth} AND AmountType = 'Rental'AND PaymentType = 'cash'";
            decimal totalCash = Convert.ToDecimal(Utility._GetDataTable(queryTotalCash).Rows[0]["TotalCash"]);
            lblTotalcash.Text = $"₹{totalCash:N2}";

            //--------- TOTAL SCAN ----------
            string queryTotalScan = $@"SELECT ISNULL(SUM(PaidAmount),0) AS TotalScan FROM Rent WHERE Active = 1 AND rYear = {rYear} AND rMonthNo = {rMonth} AND AmountType = 'Rental'AND PaymentType IN ('scan','upi','bank','cash+upi')";
            decimal totalScan = Convert.ToDecimal(Utility._GetDataTable(queryTotalScan).Rows[0]["TotalScan"]); 
            lblTotalscan.Text = $"₹{totalScan:N2}";

            //--------- TOTAL EXPECTED RENT ----------
            string queryTotalExpected = $@"SELECT ISNULL(SUM(TotalAmount),0) AS TotalExpected FROM Rent WHERE Active=1 AND rYear={rYear} AND rMonthNo={rMonth}AND AmountType='Rental'";
            decimal totalExpected = Convert.ToDecimal(Utility._GetDataTable(queryTotalExpected).Rows[0]["TotalExpected"]);
            lblTotalExpected.Text = $"₹{totalExpected:N2}";

            ////-------- TOTAL PAYMENT SCAN + UPI -------
            //string queryscanandcash = $@"SELECT ISNULL(SUM(PaidAmount),0) TotalPaid FROM Rent WHERE rYear = {rYear} AND rMonthNo = {rMonth} AND Active = 1 AND AmountType='Rental' AND PaymentType='cash+upi'";
            //DataTable dtPaidscanandcash = Utility._GetDataTable(queryscanandcash);
            //decimal totalPaidcashandscan = Convert.ToDecimal(dtPaidscanandcash.Rows[0]["TotalPaid"]);
            //lblTotalscanandcash.Text = $"₹{totalPaidcashandscan:N2}";

            //------ RENT ------
            string queryRent = $@"SELECT f.Building + ' ' + f.Title + ' ' + f.Location AS Facility,t.Name,t.Mobile1,FORMAT(r.PeriodStart,'dd/MM/yyyy') AS PeriodStart, FORMAT(r.PeriodEnd,'dd/MM/yyyy') AS PeriodEnd, r.Amount, r.MeterStart, r.MeterEnd, (r.MeterEnd - r.MeterStart) AS Unit,(r.MeterEnd - r.MeterStart) * 7 AS Bill,r.AmountType,r.TotalAmount, r.ID,r.PaidAmount FROM Rent r INNER JOIN Tenant t ON r.Tenant = t.ID INNER JOIN Facility f ON r.Facility = f.ID WHERE t.Active = 1 AND t.TenantType = 'Main Tenant' AND r.Active = 1 AND r.rYear = {rYear} AND r.rMonthNo = {rMonth} AND r.AmountType = 'Rental'AND ISNULL(r.PaidAmount,0) > 0ORDER BY t.Name";
            DataTable _dtRent = Utility._GetDataTable(queryRent);

            //---count---
            _LiteralrCount.Text = _dtRent.Rows.Count.ToString();
            ListViewRent.DataSource = _dtRent;
            ListViewRent.DataBind();

            decimal pendingTotal = 0;
            foreach (DataRow row in dtPending.Rows) pendingTotal += Convert.ToDecimal(row["TotalAmount"]);
            lblTotalPending.Text = $"₹ {pendingTotal:N2}";

            //----- VACANT ------
            string queryVacant = @"SELECT NULL AS Name,f.Building + ' ' + f.Title + ' ' + f.Location AS facility, NULL AS Mobile1,NULL AS PeriodStart,NULL AS PeriodEnd,NULL AS Amount,NULL AS MeterStart,NULL AS MeterEnd,NULL AS Unit,NULL AS Bill,NULL AS AmountType,NULL AS TotalAmount,NULL AS ID,NULL AS PaidAmount FROM Facility f WHERE f.Active = 1 AND f.ID NOT IN (SELECT DISTINCT Facility FROM Tenant WHERE Active=1) ORDER BY f.Building,f.Title";
            DataTable _dtvacant = Utility._GetDataTable(queryVacant);
            _LiteralrVacent.Text = _dtvacant.Rows.Count.ToString();
            ListViewVacent.DataSource = _dtvacant;
            ListViewVacent.DataBind();
        }
        // EVENT HANDLERS
        protected void _DropDownListMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void _DropDownListYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }

        protected void _dropdownloadRent_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid();
        }
        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = btn.CommandArgument;
            Response.Redirect("~/Payment.aspx?ID=" + id);
        }

        protected void btnTile_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Rent.aspx");
        }


        protected void btnGrid_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Rental.aspx");
        }
    }
}
