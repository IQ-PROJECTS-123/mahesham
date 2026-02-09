using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Maheshamv3
{
    public partial class mTenent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRooms();
<<<<<<< HEAD
=======

>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                string tenantId = Request.QueryString["ID"];
                if (!string.IsNullOrEmpty(tenantId))
                    LoadTenantData(tenantId);
            }
        }

        private void LoadTenantData(string tenantId)
        {
            string query = $"SELECT *, FORMAT(RentStart,'yyyy-MM-dd') AS StartOn FROM Tenant WHERE ID={tenantId}";
            DataTable dt = Utility._GetDataTable(query);
<<<<<<< HEAD

            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];

                Utility._BindDropdown(_DropDownListFacility,"SELECT ID, Building+' '+Location+' - '+Title AS Title FROM Facility","ID", "Title", false);
=======
            if (dt.Rows.Count > 0)
            {
                DataRow row = dt.Rows[0];
                Utility._BindDropdown(_DropDownListFacility,"SELECT ID, Building+' '+Location+' - '+Title AS Title FROM Facility", "ID", "Title", false);
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                _DropDownListType.SelectedValue = row["TenantType"].ToString();
                _DropDownListFacility.SelectedValue = row["Facility"].ToString();
                _TextName.Text = row["Name"].ToString();
                _TextBoxEmail.Text = row["Email"].ToString();
<<<<<<< HEAD
                _Textpass.Text = row["PWD"].ToString();
=======
                _Textpass.Text = row["PWD"].ToString();    
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                _TextBoxMobile1.Text = row["Mobile1"].ToString();
                _TextBoxMobile2.Text = row["Mobile2"].ToString();
                _TextBoxFather.Text = row["FatherName"].ToString();
                _TextBoxFContact.Text = row["HomeNumber"].ToString();
                _TextBoxAddress.Text = row["Address"].ToString();
                _TextBoxAadhar.Text = row["AadharNumber"].ToString();
                _TextBoxPAN.Text = row["PANNumber"].ToString();
                _TextBoxVoter.Text = row["VoterNumber"].ToString();
                _TextBoxAmount.Text = row["MonthlyRent"].ToString();
                _TextMaintenance.Text = row["Maintenance"].ToString();
                _TextAdvPayment.Text = row["Advance"].ToString();
<<<<<<< HEAD
                _TextBoxMeter.Text = row["MeterReadingStart"].ToString();   
                _DropDownMeter.SelectedValue = row["eUnitCost"].ToString(); 
=======
                _TextBoxMeter.Text = row["MeterReadingStart"].ToString();
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                _TextBoxStartDate.Text = row["StartOn"].ToString();
            }
        }

        protected void _ButtonSubmit_Click(object sender, EventArgs e)
        {
            if (_DropDownListFacility.SelectedIndex == 0)
            {
                ShowMessage("Please select a room.", false);
                return;
            }

<<<<<<< HEAD
            if (string.IsNullOrEmpty(_TextBoxMeter.Text))
            {
                ShowMessage("Please enter meter reading start.", false);
                return;
            }

            if (string.IsNullOrEmpty(_DropDownMeter.SelectedValue))
            {
                ShowMessage("Please select electric unit cost.", false);
                return;
            }

            string tenantId = Request.QueryString["ID"];

            if (_DropDownListType.SelectedValue == "Main Tenant")
            {
                string checkQuery = $@"SELECT * FROM Tenant WHERE Facility={_DropDownListFacility.SelectedValue}AND TenantType='Main Tenant'AND Active=1
                    {(string.IsNullOrEmpty(tenantId) ? "" : $"AND ID <> {tenantId}")}";

=======

            string tenantId = Request.QueryString["ID"];
            if (_DropDownListType.SelectedValue == "Main Tenant")
            {
                string checkQuery = $@"SELECT * FROM Tenant WHERE Facility={_DropDownListFacility.SelectedValue}AND TenantType='Main Tenant' AND Active=1 {(string.IsNullOrEmpty(tenantId) ? "" : $"AND ID <> {tenantId}")}";
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                if (Utility._GetDataTable(checkQuery).Rows.Count > 0)
                {
                    ShowMessage("Main Tenant already exists in this room.", false);
                    return;
                }
            }

            string query = string.IsNullOrEmpty(tenantId)
<<<<<<< HEAD
                ? @"INSERT INTO Tenant(MeterReadingStart,eUnitCost,TenantType,Name,Mobile1,Mobile2,Email,PWD,Address,FatherName,HomeNumber,AadharNumber,PANNumber,VoterNumber,Facility,MonthlyRent,Maintenance,Advance,RentStart,Active)
                VALUES(@MeterReadingStart,@eUnitCost,@TenantType,@Name,@Mobile1,@Mobile2,@Email,@PWD,@Address,@FatherName,@HomeNumber,@AadharNumber,@PANNumber,@VoterNumber,@Facility,@MonthlyRent,@Maintenance,@Advance,@RentStart,1)": @"UPDATE Tenant SET MeterReadingStart=@MeterReadingStart,eUnitCost=@eUnitCost,TenantType=@TenantType,Name=@Name,Mobile1=@Mobile1,Mobile2=@Mobile2,Email=@Email,PWD=@PWD,Address=@Address,FatherName=@FatherName,HomeNumber=@HomeNumber,AadharNumber=@AadharNumber,PANNumber=@PANNumber,VoterNumber=@VoterNumber,Facility=@Facility,MonthlyRent=@MonthlyRent,Maintenance=@Maintenance,Advance=@Advance,RentStart=@RentStart WHERE ID=" + tenantId;

            Utility.ExecuteQuery(query, false,
                new SqlParameter("@MeterReadingStart", Convert.ToInt32(_TextBoxMeter.Text)),
                new SqlParameter("@eUnitCost", Convert.ToInt32(_DropDownMeter.SelectedValue)),
=======
                ? @"INSERT INTO Tenant(MeterReadingStart, TenantType, Name, Mobile1, Mobile2, Email,PWD, Address, FatherName,HomeNumber, AadharNumber, PANNumber, VoterNumber, Facility, MonthlyRent, Maintenance,Advance, RentStart, Active)
                   VALUES(@MeterReadingStart, @TenantType, @Name, @Mobile1, @Mobile2, @Email, @PWD, @Address, @FatherName,@HomeNumber, @AadharNumber, @PANNumber, @VoterNumber, @Facility, @MonthlyRent, @Maintenance,@Advance, @RentStart, 1)"
                : @"UPDATE Tenant SET MeterReadingStart=@MeterReadingStart, TenantType=@TenantType, Name=@Name, Mobile1=@Mobile1,Mobile2=@Mobile2, Email=@Email,PWD=@PWD, Address=@Address, FatherName=@FatherName, HomeNumber=@HomeNumber,AadharNumber=@AadharNumber, PANNumber=@PANNumber, VoterNumber=@VoterNumber, Facility=@Facility,MonthlyRent=@MonthlyRent, Maintenance=@Maintenance, Advance=@Advance, RentStart=@RentStart WHERE ID=" + tenantId;

            Utility.ExecuteQuery(query, false,
                new SqlParameter("@MeterReadingStart", _TextBoxMeter.Text),
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                new SqlParameter("@TenantType", _DropDownListType.SelectedValue),
                new SqlParameter("@Name", _TextName.Text),
                new SqlParameter("@Mobile1", _TextBoxMobile1.Text),
                new SqlParameter("@Mobile2", _TextBoxMobile2.Text),
                new SqlParameter("@Email", _TextBoxEmail.Text),
                new SqlParameter("@PWD", _Textpass.Text),
                new SqlParameter("@Address", _TextBoxAddress.Text),
                new SqlParameter("@FatherName", _TextBoxFather.Text),
                new SqlParameter("@HomeNumber", _TextBoxFContact.Text),
                new SqlParameter("@AadharNumber", _TextBoxAadhar.Text),
                new SqlParameter("@PANNumber", _TextBoxPAN.Text),
                new SqlParameter("@VoterNumber", _TextBoxVoter.Text),
                new SqlParameter("@Facility", _DropDownListFacility.SelectedValue),
                new SqlParameter("@MonthlyRent", _TextBoxAmount.Text),
                new SqlParameter("@Maintenance", _TextMaintenance.Text),
                new SqlParameter("@Advance", _TextAdvPayment.Text),
                new SqlParameter("@RentStart", _TextBoxStartDate.Text)
            );

            ShowMessage("Tenant submitted successfully!", true);
<<<<<<< HEAD
=======

>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
            _ButtonSubmit.Visible = false;
            _ButtonDocVeri.Visible = true;
            _ButtonAddMore.Visible = true;
        }
<<<<<<< HEAD

=======
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
        protected void _DropDownListType_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindRooms();
        }

        protected void _DropDownListFacility_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (_DropDownListType.SelectedValue == "Partner Tenant" &&
                !string.IsNullOrEmpty(_DropDownListFacility.SelectedValue))
            {
<<<<<<< HEAD
                string query = @"SELECT RentStart, MonthlyRent, Maintenance, MeterReadingStart, eUnitCost FROM Tenant WHERE TenantType='Main Tenant'AND Facility=" + _DropDownListFacility.SelectedValue;
=======
                string query = $@"SELECT RentStart, MonthlyRent, Maintenance, MeterReadingStart FROM Tenant WHERE TenantType='Main Tenant' AND Facility={_DropDownListFacility.SelectedValue}";
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                DataTable dt = Utility._GetDataTable(query);
                if (dt.Rows.Count > 0)
                {
                    _TextBoxAmount.Text = dt.Rows[0]["MonthlyRent"].ToString();
                    _TextMaintenance.Text = dt.Rows[0]["Maintenance"].ToString();
                    _TextBoxMeter.Text = dt.Rows[0]["MeterReadingStart"].ToString();
<<<<<<< HEAD
                    _DropDownMeter.SelectedValue = dt.Rows[0]["eUnitCost"].ToString();
=======
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                    _TextBoxStartDate.Text = Convert.ToDateTime(dt.Rows[0]["RentStart"]).ToString("yyyy-MM-dd");
                }
            }
        }

        protected void BindRooms()
        {
<<<<<<< HEAD
            string query =_DropDownListType.SelectedValue == "Main Tenant"? @"SELECT ID, Building+' '+Location+' - '+Title AS Title FROM Facility WHERE NOT ID IN (SELECT Facility FROM Tenant WHERE Active=1 AND TenantType='Main Tenant')ORDER BY ID": @"SELECT DISTINCT f.ID, f.Building+' '+f.Location+' - '+f.Title AS Title FROM Facility f INNER JOIN Tenant t ON t.Facility=f.ID WHERE t.Active=1 AND t.TenantType='Main Tenant'ORDER BY f.ID";
=======
            string query =_DropDownListType.SelectedValue == "Main Tenant" ? @"SELECT ID, Building+' '+Location+' - '+Title AS Title FROM Facility WHERE NOT ID IN (SELECT Facility FROM Tenant WHERE Active=1 AND TenantType='Main Tenant')ORDER BY ID": @"SELECT DISTINCT f.ID, f.Building+' '+f.Location+' - '+f.Title AS Title FROM Facility f INNER JOIN Tenant t ON t.Facility=f.ID WHERE t.Active=1 AND t.TenantType='Main Tenant' ORDER BY f.ID";
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
            Utility._BindDropdown(_DropDownListFacility, query, "ID", "Title", true);
        }

        protected void _ButtonAddMore_Click(object sender, EventArgs e)
        {
            Utility.ClearControls(this);
            BindRooms();
            _LiteralMSG.Text = "";
            _ButtonSubmit.Visible = true;
            _ButtonDocVeri.Visible = false;
            _ButtonAddMore.Visible = false;
        }

        protected void _ButtonDocVeri_Click(object sender, EventArgs e)
        {
            string tenantId = Request.QueryString["ID"] ?? GetLastInsertedTenantID();
            Response.Redirect("~/KYCDoc.aspx?TenantID=" + tenantId);
        }

        private string GetLastInsertedTenantID()
        {
            DataTable dt = Utility._GetDataTable("SELECT TOP 1 ID FROM Tenant ORDER BY ID DESC");
            return dt.Rows.Count > 0 ? dt.Rows[0]["ID"].ToString() : "0";
        }

        private void ShowMessage(string msg, bool success)
        {
            string css = success ? "bg-success" : "bg-danger";
            _LiteralMSG.Text = $"<div class='p-3 mb-2 {css} text-white'>{msg}</div>";
        }
    }
}
