using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Maheshamv3
{
    public class Utility
    {
        static public void _BindDropdown(System.Web.UI.WebControls.DropDownList ddl, String Query,String ValueField,String TestField, Boolean RequiredValidation)
        {
            DataTable _dt = Utility._GetDataTable(Query);
            ddl.DataSource = _dt;            
            ddl.DataTextField=TestField;
            ddl.DataValueField=ValueField;
            ddl.DataBind();           
            ddl.Items.Insert(0, new ListItem("None", RequiredValidation? String.Empty  : "0"));

        }
        static public void _BindDropdown(System.Web.UI.WebControls.DropDownList ddl, String Query, String ValueField, String TestField, String selectedValue, Boolean RequiredValidation)
        {
            DataTable _dt = Utility._GetDataTable(Query);
            ddl.DataSource = _dt;
            ddl.DataTextField = TestField;
            ddl.DataValueField = ValueField;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("None", RequiredValidation ? String.Empty : "0"));
            if (!String.IsNullOrEmpty(selectedValue))
                ddl.SelectedValue = selectedValue;

        }
        static public void _BindChechboxList(System.Web.UI.WebControls.CheckBoxList chklist, String Query, String ValueField, String TestField)
        {
            DataTable _dt = Utility._GetDataTable(Query);
            chklist.DataSource = _dt;
            chklist.DataTextField = TestField;
            chklist.DataValueField = ValueField;
            chklist.DataBind();          


        }
        static public void _BindGridView(System.Web.UI.WebControls.GridView gv, String Query)
        {
            DataTable _dt = Utility._GetDataTable(Query);
            gv.DataSource = _dt;
            gv.DataBind(); 
        }
        static public void _SendEmail(String _To, String _Ccs, String _Subject, String _MSG)
        {
            try
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("info@iq-india.com", "MAHESHAM LODGE");
                String[] _ccs = _Ccs.TrimEnd(';').Split(';');
                _ccs = _ccs.Distinct().ToArray();
                foreach (String _cc in _ccs)
                    if (!String.IsNullOrEmpty(_cc))
                        if (_To != _cc)
                            message.CC.Add(new MailAddress(_cc));
                message.To.Add(new MailAddress(_To));
                message.Subject = _Subject;
                message.IsBodyHtml = true;
                message.Body = _MSG;
                message.Priority = MailPriority.High;
                smtp.Port = 25;
                smtp.Host = "email-smtp.ap-south-1.amazonaws.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("AKIAVY75UURZKY6JOY5L", "BCgGVIOe8wFp+mlL7bknwTcFkX0BnsQe+tsKoRZ+hZ9R");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
            }
            catch (Exception)
            {
            }
        }
        static public System.Data.DataTable _GetDataTable(String _Query)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(_Query, System.Configuration.ConfigurationManager.ConnectionStrings["Capis"].ConnectionString);
            System.Data.DataTable dt = new System.Data.DataTable();
            adapter.Fill(dt);
            return dt;
        }
        static public void ExecuteQuery(String _Query)
        {
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Capis"].ConnectionString);

            try
            {
                SqlCommand cmd = Con.CreateCommand();
                cmd.CommandText = _Query;               
                Con.Open();
                cmd.ExecuteNonQuery();
            }
            catch { }
            finally { Con.Close(); }
        }
        static public void ExecuteQuery(String _Query, Boolean _Procedure,params SqlParameter[] _Parameters)
        {
            SqlConnection Con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["Capis"].ConnectionString);

            try
            {
                SqlCommand cmd = Con.CreateCommand();
                cmd.CommandText = _Query;                
                cmd.CommandType =  _Procedure ? CommandType.StoredProcedure : CommandType.Text;
                foreach(SqlParameter _Parameter in _Parameters)
                    cmd.Parameters.Add(_Parameter);
                Con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (Exception ex) { }
            finally { Con.Close(); }
        }
        public static void ClearControls(Control parent)
        {
            foreach (Control c in parent.Controls)
            {
                if (c is TextBox tb)
                {
                    tb.Text = string.Empty;
                }
                else if (c is DropDownList ddl)
                {
                    if (ddl.Items.Count > 0)
                        ddl.SelectedIndex = 0;
                }
                else if (c.HasControls())
                {
                    // recursive clearing if nested inside panels/divs
                    ClearControls(c);
                }
            }
        }

    }

}