using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class KYCData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindKYCData();
            }
        }
        private void BindKYCData()
        {
            DataTable dtRaw = Utility._GetDataTable(@"SELECT t.ID TenantId, t.Name TenantName, f.Building + ' ' + f.Location + ' - ' + f.Title RoomName FROM Tenant t INNER JOIN Facility f ON t.Facility = f.ID WHERE t.Active = 1 ORDER BY f.Title, t.Name");
            DataTable dtFinal = new DataTable();
            dtFinal.Columns.AddRange(new DataColumn[] {
            new DataColumn("TenantId"),
            new DataColumn("Room"),
            new DataColumn("Tenant"),
            new DataColumn("Aadhar"),
            new DataColumn("PAN"),
            new DataColumn("VoterID"),
            new DataColumn("Photo"),
            new DataColumn("DriverLicense")
        });

            foreach (DataRow row in dtRaw.Rows)
            {
                int tenantId = Convert.ToInt32(row["TenantId"]);
                DataTable dtDocs = Utility._GetDataTable($"SELECT DocType FROM TenantKyc WHERE Tenant={tenantId} AND Active=1");
                string aadhar = "No", pan = "No", voter = "No", photo = "No", dl = "No";
                foreach (DataRow doc in dtDocs.Rows)
                {
                    string docType = doc["DocType"].ToString();
                    if (docType == "Aadhar") aadhar = "Yes";
                    else if (docType == "PAN") pan = "Yes";
                    else if (docType == "VoterID") voter = "Yes";
                    else if (docType == "Photo") photo = "Yes";
                    else if (docType == "DriverLicense") dl = "Yes";
                }
                if (photo == "No" || (aadhar == "No" && pan == "No" && voter == "No" && dl == "No"))
                {
                    dtFinal.Rows.Add(tenantId, row["RoomName"], row["TenantName"], aadhar, pan, voter, photo, dl);
                }
            }
            gvkyc.DataSource = dtFinal;
            gvkyc.DataBind();
        }
        protected void btnEdit_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            string tenantID = btn.CommandArgument; 
            Response.Redirect("~/KYCDoc.aspx?ID=" + tenantID);
        }
        protected void _btncomplete_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CompletedKYC.aspx");
        }

    }
}
