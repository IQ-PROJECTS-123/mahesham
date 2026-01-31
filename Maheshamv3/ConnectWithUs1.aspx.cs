using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class ConnectWithUs1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string connStrin = ConfigurationManager.ConnectionStrings["Capis"].ConnectionString;
            string query = "INSERT INTO interestedstudent(Name, Phone, YourType) VALUES(@Name, @Phone, @YourType)";

            try
            {
                using (SqlConnection conn = new SqlConnection(connStrin))
                {
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {

                        cmd.Parameters.AddWithValue("@ID", 1);
                        cmd.Parameters.AddWithValue("@Name", txtName.Text);
                        cmd.Parameters.AddWithValue("@Phone", txtPhone.Text);
                        cmd.Parameters.AddWithValue("@YourType", ddlRoom.SelectedValue);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                        txtName.Text = "";
                        txtPhone.Text = "";
                        ddlRoom.SelectedIndex = 0;



                        Response.Write("<script>alert('Form submitted successfully!');</script>");
                    }
                }
            }
            catch (Exception ex)
            {

                Response.Write("Error: " + ex.Message);
            }

        }
    }
}