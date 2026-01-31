using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class KYCDoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFacilities();
                string tenantIdStr = Request.QueryString["TenantID"] ?? Request.QueryString["ID"];
                if (!string.IsNullOrEmpty(tenantIdStr))
                {
                    int tenantID = Convert.ToInt32(tenantIdStr);
                    LoadTenantData(tenantID);
                }
            }
        }
        private void BindFacilities()
        {
            string query = "SELECT ID, Building + ' ' + Location + ' - ' + Title AS Title FROM Facility WHERE Active=1 ORDER BY ID";
            Utility._BindDropdown(_DropDownListFacility, query, "ID", "Title", true);
        }
        private void BindTenants(int facilityId)
        {
            string query = $"SELECT ID, Name FROM Tenant WHERE Active=1 AND Facility={facilityId} ORDER BY Name";
            Utility._BindDropdown(_dropdownTenant, query, "ID", "Name", true);
        }
        private void BindKYCGrid(int tenantID)
        {
            string query = $@"SELECT Id, DocType, DocNumber, FilePath, Active FROM TenantKyc WHERE Tenant = {tenantID} ORDER BY Active DESC, Creaded DESC";
            gvTenantDocs.DataSource = Utility._GetDataTable(query);
            gvTenantDocs.DataBind();
        }
        private void LoadTenantData(int tenantID)
        {
            string query = $@"SELECT t.ID, t.Name, f.ID AS FacilityID, f.Building + ' ' + f.Location + ' - ' + f.Title AS RoomName FROM Tenant t INNER JOIN Facility f ON t.Facility = f.ID WHERE t.ID = {tenantID}";
            DataTable dtTenant = Utility._GetDataTable(query);
            if (dtTenant.Rows.Count > 0)
            {
                _DropDownListFacility.SelectedValue = dtTenant.Rows[0]["FacilityID"].ToString();
                BindTenants(Convert.ToInt32(dtTenant.Rows[0]["FacilityID"]));
                _dropdownTenant.SelectedValue = dtTenant.Rows[0]["ID"].ToString();
                BindKYCGrid(tenantID);
            }
        }
        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(_DropDownListFacility.SelectedValue))
            {
                int facilityId = Convert.ToInt32(_DropDownListFacility.SelectedValue);
                BindTenants(facilityId);
            }
        }
        protected void gvTenantDocs_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Button btn = (Button)e.Row.FindControl("btnActive");
                Label lblStatus = (Label)e.Row.FindControl("lblStatus");

                bool isActive = Convert.ToBoolean(DataBinder.Eval(e.Row.DataItem, "Active"));

                if (isActive)
                {
                    lblStatus.Text = "Active";
                    lblStatus.CssClass = "text-success fw-bold";
                    btn.Text = "Deactivated";
                    btn.CssClass = "btn btn-sm btn-danger";
                    btn.Visible = true;
                }
                else
                {
                    lblStatus.Text = "Deactivated";
                    lblStatus.CssClass = "text-danger fw-bold";
                    btn.Visible = false;
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string docType = _dropdownDoc.SelectedValue;
            int tenantID = Convert.ToInt32(_dropdownTenant.SelectedValue);
            if (!_fleupload.HasFile)
            {
                _lblMessage.Text = "<div class='alert alert-danger'>Please select a file to upload.</div>";
                return;
            }
            if (docType != "Photo" && string.IsNullOrWhiteSpace(_txtDocNumber.Text))
            {
                _lblMessage.Text = "<div class='alert alert-danger'>Please enter Document Number.</div>";
                return;
            }
            string extension = Path.GetExtension(_fleupload.FileName);
            string timestamp = DateTime.Now.ToString("yyyy-MM-dd-HHmmss");
            string fileName = $"{tenantID}_{docType}_{timestamp}{(extension == "" ? ".jpg" : extension)}";
            string savePath = Server.MapPath("~/content/pic/") + fileName;
            _fleupload.SaveAs(savePath);
            Utility.ExecuteQuery("UPDATE TenantKyc SET Active=0 WHERE Tenant=@Tenant AND DocType=@DocType AND Active=1",
                false,
                new SqlParameter("@Tenant", tenantID),
                new SqlParameter("@DocType", docType)
            );
            Utility.ExecuteQuery(
                "INSERT INTO TenantKyc (Tenant, DocType, DocNumber, FilePath, Creaded, CreatedBy, Active) VALUES (@Tenant, @DocType, @DocNumber, @FilePath, @Creaded, @CreatedBy, 1)",
                false,
                new SqlParameter("@Tenant", tenantID),
                new SqlParameter("@DocType", docType),
                new SqlParameter("@DocNumber", _txtDocNumber.Text),
                new SqlParameter("@FilePath", fileName),
                new SqlParameter("@Creaded", DateTime.Now),
                new SqlParameter("@CreatedBy", "Admin")
            );
            _lblMessage.Text = $"<div class='alert alert-success'>{docType} has been uploaded successfully!</div>";
            BindKYCGrid(tenantID);
            _dropdownDoc.SelectedIndex = 0;
            _txtDocNumber.Text = "";
            _fleupload.Dispose();
        }
        protected void btnActive_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int docID = Convert.ToInt32(btn.CommandArgument);

            DataTable dt = Utility._GetDataTable($"SELECT Active, Tenant FROM TenantKyc WHERE Id={docID}");
            if (dt.Rows.Count == 0) return;

            bool isActive = dt.Rows[0]["Active"] != DBNull.Value && Convert.ToBoolean(dt.Rows[0]["Active"]);
            int tenantId = dt.Rows[0]["Tenant"] != DBNull.Value ? Convert.ToInt32(dt.Rows[0]["Tenant"]) : 0;
            if (isActive)
            {
                Utility.ExecuteQuery("UPDATE TenantKyc SET Active=0 WHERE Id=@Id", false, new SqlParameter("@Id", docID));
            }
            if (tenantId != 0)
                BindKYCGrid(tenantId);
        }
    }
}
