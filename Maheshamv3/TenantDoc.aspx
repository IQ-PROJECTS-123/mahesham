<%@ Page Title="" Language="C#" MasterPageFile="~/Tenant.Master" AutoEventWireup="true" CodeBehind="TenantDoc.aspx.cs" Inherits="Maheshamv3.TenantDoc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid contact py-5">
    <div class="container py-5">
        <div class="pb-5">
            <div class="bg-light rounded p-4 pb-0">
                <h2 class="display-5 mb-2"><a href="TDashboard.aspx">Dashboard</a> - Document</h2>
                <div class="row g-3">

                    <!-- Name -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:TextBox ID="_TextName" runat="server" class="form-control"></asp:TextBox>
                            <label>Your Name</label>
                        </div>
                    </div>

                    <!-- Room -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:DropDownList ID="_DropDownListFacility" runat="server" AutoPostBack="true" class="form-control">
                                <asp:ListItem Value="">-- Select Room --</asp:ListItem>
                            </asp:DropDownList>
                            <label>ROOM</label>
                        </div>
                    </div>

                    <!-- Aadhar -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:FileUpload ID="fileAadhar" runat="server" CssClass="form-control" />
                            <label>Aadhar Card</label>
                        </div>
                    </div>

                    <!-- PAN -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:FileUpload ID="filePan" runat="server" CssClass="form-control" />
                            <label>PAN Card</label>
                        </div>
                    </div>

                    <!-- Photo -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:FileUpload ID="filePhoto" runat="server" CssClass="form-control" />
                            <label>Photo</label>
                        </div>
                    </div>

                    <!-- Driving Licence -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:FileUpload ID="fileLicence" runat="server" CssClass="form-control" />
                            <label>Driving Licence</label>
                        </div>
                    </div>

                    <!-- Voter ID -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:FileUpload ID="fileVoter" runat="server" CssClass="form-control" />
                            <label>Voter ID Card</label>
                        </div>
                    </div>

                    <!-- Submit -->
                    <div class="col-12">
                        <asp:Literal ID="_LiteralMSG" runat="server"></asp:Literal>
                        <asp:Button ID="_ButtonSubmit" runat="server" Text="Submit" CssClass="btn btn-primary w-100 py-3" OnClick="_ButtonSubmit_Click" ValidationGroup="TenantForm" />
                    </div>

                    <asp:ValidationSummary ID="vsPopup" runat="server" ShowMessageBox="true" 
                        ShowSummary="false" ValidationGroup="TenantForm" />

                </div>
            </div>
        </div>
    </div>
</div></asp:Content>
