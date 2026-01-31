using System;
using System.Data;
using System.Data.SqlClient;

namespace Maheshamv3
{
    public partial class Facility : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    LoadFacilityData(Request.QueryString["ID"]);
                    btnSave.Text = "Update"; 
                }
            }
        }
        private void LoadFacilityData(string facilityId)
        {
            DataTable dataTable = Utility._GetDataTable("SELECT * FROM Facility WHERE ID=" + facilityId);
            if (dataTable.Rows.Count > 0)
            {
                _ddlBuilding.SelectedValue = Convert.ToString(dataTable.Rows[0]["Building"]);
                _txtTitle.Text = Convert.ToString(dataTable.Rows[0]["Title"]);
                _txtLocation.Text = Convert.ToString(dataTable.Rows[0]["Location"]);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Validate inputs
            if (string.IsNullOrEmpty(_ddlBuilding.SelectedValue))
            {
                ShowMessage("Please select a building.", isError: true);
                return;
            }

            if (string.IsNullOrEmpty(_txtTitle.Text))
            {
                ShowMessage("Please enter a title.", isError: true);
                return;
            }

            if (string.IsNullOrEmpty(_txtLocation.Text))
            {
                ShowMessage("Please enter a location.", isError: true);
                return;
            }

            try
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                    // Update existing facility
                    Utility.ExecuteQuery(
                        "UPDATE Facility SET Title=@Title, Building=@Building, Location=@Location WHERE ID=@ID",
                        false,
                        new SqlParameter("@Title", _txtTitle.Text),
                        new SqlParameter("@Building", _ddlBuilding.SelectedValue),
                        new SqlParameter("@Location", _txtLocation.Text),
                        new SqlParameter("@ID", Request.QueryString["ID"])
                    );

                    ShowMessage("Facility has been updated successfully!");
                }
                else
                {
                    // Insert new facility
                    Utility.ExecuteQuery(
                        "INSERT INTO Facility (Title, Building, Location, Active) VALUES (@Title, @Building, @Location, 1)",
                        false,
                        new SqlParameter("@Title", _txtTitle.Text),
                        new SqlParameter("@Building", _ddlBuilding.SelectedValue),
                        new SqlParameter("@Location", _txtLocation.Text)
                    );

                    ShowMessage("Facility has been saved successfully!");
                }
                btnSave.Visible = false;
                _ButtonAddMore.Visible = true;
                _ButtonViewFacilities.Visible = true;
            }
            catch (Exception ex)
            {
                ShowMessage($"Error saving facility: {ex.Message}", isError: true);
            }
        }
        protected void _ButtonAddMore_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.AbsolutePath);
        }
        protected void _ButtonViewFacilities_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Facilities.aspx"); 
        }

        private void ShowMessage(string message, bool isError = false)
        {
            string alertClass = isError ? "alert-danger" : "alert-success";
            _litMessage.Text = $"<div class='alert {alertClass} mt-3'>{message}</div>";
        }
    }
}
