using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public partial class Building : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["ID"]))
                {
                   
                    DataTable dataTable = Utility._GetDataTable("Select * from Building where id=" + Request.QueryString["ID"]);
                    if (dataTable.Rows.Count > 0)
                    {
                        _TextTitle.Text = Convert.ToString(dataTable.Rows[0]["Title"]);
                        _TextContent.Text = Convert.ToString(dataTable.Rows[0]["Content_Person"]);
                        _TextMobile.Text = Convert.ToString(dataTable.Rows[0]["Mobile"]);
                        _TextCity.Text = Convert.ToString(dataTable.Rows[0]["City"]);
                        _TextEmail.Text = Convert.ToString(dataTable.Rows[0]["Email"]);
                        _TextDescription.Text = Convert.ToString(dataTable.Rows[0]["Description"]);
                    }
                   
                }
            }
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {

            Utility.ExecuteQuery(String.IsNullOrEmpty(Request.QueryString["ID"]) ? "INSERT INTO Building(Title, Content_Person, Mobile, City, Email, Description, Active) VALUES(@Title, @Content_Person, @Mobile, @City, @Email, @Description, 1)" : "UPDATE Building SET Title=@Title, Content_Person=@Content_Person, Mobile=@Mobile, City=@City, Email=@Email, Description=@Description WHERE Id=" + Request.QueryString["ID"],
                false,
                new SqlParameter("@Title", _TextTitle.Text),
                new SqlParameter("@Content_Person", _TextContent.Text),
                new SqlParameter("@Mobile", _TextMobile.Text),
                new SqlParameter("@City", _TextCity.Text),
                new SqlParameter("@Email", _TextEmail.Text),
                new SqlParameter("@Description", _TextDescription.Text)
            );
            _litlesms.Text = "<div class='alert alert-success mt-3'>Place has been submitted successfully!!</div>";

        }

    }
}
