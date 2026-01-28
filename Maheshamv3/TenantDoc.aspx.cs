using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class TenantDoc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRooms();
                string tenantId = Request.QueryString["TenantID"];
                if (!string.IsNullOrEmpty(tenantId))
                    LoadTenantData(tenantId);
            }
        }

        private void LoadTenantData(string tenantId)
        {
            // Load tenant name and selected room
            string query = $"SELECT Name, Facility FROM Tenant WHERE ID={tenantId}";
            DataTable dt = Utility._GetDataTable(query);
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                _TextName.Text = row["Name"].ToString();
                _DropDownListFacility.SelectedValue = row["Facility"].ToString();
            }
        }

        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (_DropDownListFacility.SelectedIndex == 0)
            {
                ShowMessage("Please select a room.", false);
                return;
            }

            string tenantId = Request.QueryString["TenantID"];
            if (string.IsNullOrEmpty(tenantId))
            {
                ShowMessage("Tenant ID is missing. Please save tenant info first.", false);
                return;
            }

            // Save uploaded files
            string aadharPath = SaveFile(fileAadhar, tenantId, "Aadhar");
            string panPath = SaveFile(filePan, tenantId, "PAN");
            string photoPath = SaveFile(filePhoto, tenantId, "Photo");
            string licencePath = SaveFile(fileLicence, tenantId, "Licence");
            string voterPath = SaveFile(fileVoter, tenantId, "Voter");
            string query = @"UPDATE Tenant SET AadharDoc=@AadharDoc,PANDoc=@PANDoc,Photo=@Photo,LicenceDoc=@LicenceDoc,VoterDoc=@VoterDoc WHERE ID=@TenantID";
            Utility.ExecuteQuery(query, false,
                new SqlParameter("@AadharDoc", aadharPath),
                new SqlParameter("@PANDoc", panPath),
                new SqlParameter("@Photo", photoPath),
                new SqlParameter("@LicenceDoc", licencePath),
                new SqlParameter("@VoterDoc", voterPath),
                new SqlParameter("@TenantID", tenantId)
            );
            ShowMessage("Documents submitted successfully!", true);

        }

        private string SaveFile(FileUpload fileUpload, string tenantId, string docType)
        {
            if (fileUpload.HasFile)
            {
                string folder = Server.MapPath("~/TenantDocs/");
                if (!Directory.Exists(folder))
                    Directory.CreateDirectory(folder);

                string fileName = $"{docType}_{tenantId}_{Path.GetFileName(fileUpload.FileName)}";
                string filePath = Path.Combine(folder, fileName);
                fileUpload.SaveAs(filePath);
                return "~/TenantDocs/" + fileName;
            }
            return null;
        }

        protected void BindRooms()
        {
            string query = @"SELECT ID, Building+' '+Location+' - '+Title AS Title FROM Facility ORDER BY ID";
            Utility._BindDropdown(_DropDownListFacility, query, "ID", "Title", true);
        }

        private void ShowMessage(string msg, bool success)
        {
            string css = success ? "bg-success" : "bg-danger";
            _LiteralMSG.Text = $"<div class='p-3 mb-2 {css} text-white'>{msg}</div>";
        }
    }
}
