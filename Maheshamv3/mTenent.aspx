<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="mTenent.aspx.cs" Inherits="Maheshamv3.mTenent" UnobtrusiveValidationMode="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<<<<<<< HEAD
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5" style="background-color: white">
=======
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div class="container-fluid contact py-5" style="background-color:white">
>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <h2 class="display-5 mb-2"><a href="Dashboard.aspx">Dashboard</a> - Tenant</h2>
                    <div class="row g-3">
                        <!-- Tenant Type -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:DropDownList runat="server" ID="_DropDownListType" AutoPostBack="true" OnSelectedIndexChanged="_DropDownListType_SelectedIndexChanged"
                                    class="form-control">
                                    <asp:ListItem>Main Tenant</asp:ListItem>
                                    <asp:ListItem>Partner Tenant</asp:ListItem>
                                </asp:DropDownList>
                                <label>Tenant Type</label>
                            </div>
                        </div>
                        <!-- Room -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:DropDownList runat="server" ID="_DropDownListFacility" AutoPostBack="true" OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged"
                                    class="form-control">
                                    <asp:ListItem Value="">-- Select Room --</asp:ListItem>
                                </asp:DropDownList>
                                <label>ROOM</label>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvRoom" runat="server" ControlToValidate="_DropDownListFacility" InitialValue="" ErrorMessage="Please select a room!" Display="None" ValidationGroup="TenantForm"></asp:RequiredFieldValidator>
                        </div>
                        <!-- Name -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextName" runat="server" class="form-control"></asp:TextBox>
                                <label>Your Name</label>
                            </div>
                        </div>
                        <!-- RENT -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxAmount" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                                <label>Your Monthly Rental</label>
                            </div>
                        </div>
                        <!-- Maintenance -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextMaintenance" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                                <label>Maintenance Amount</label>
                            </div>
                        </div>

                        <!-- Advance Payment -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextAdvPayment" runat="server" class="form-control"></asp:TextBox>
                                <label>Advance Payment</label>
                            </div>
                        </div>

                        <!-- Start Date -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxStartDate" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                                <label>Rent Start Date</label>
                            </div>
                        </div>

                        <!-- Meter -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxMeter" runat="server" TextMode="Number" class="form-control"></asp:TextBox>
                                <label>Meter Reading Start</label>
                            </div>
                        </div>
<<<<<<< HEAD
                        <!-- Electric Unit Start -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:DropDownList ID="_DropDownMeter" runat="server" Class="form-control">
                                    <asp:ListItem Value="">Select Electric Unit</asp:ListItem>
                                    <asp:ListItem Value="7">7</asp:ListItem>
                                    <asp:ListItem Value="8">8</asp:ListItem>
                                    <asp:ListItem Value="9">9</asp:ListItem>
                                </asp:DropDownList>
                                <label>Electric Unit Start</label>
                            </div>
                        </div>
=======

>>>>>>> 976b0600d4677ab932bcd13353fd843c56e07b6c
                        <!-- Email -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxEmail" runat="server" class="form-control"></asp:TextBox>
                                <label>Your Email</label>
                            </div>
                        </div>
                        <!-- passowrd -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_Textpass" runat="server" class="form-control"></asp:TextBox>
                                <label>PassWord</label>
                            </div>
                        </div>
                        <!-- Aadhar -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxAadhar" runat="server" class="form-control"></asp:TextBox>
                                <label>Your Aadhar</label>
                            </div>
                        </div>

                        <!-- PAN -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxPAN" runat="server" class="form-control"></asp:TextBox>
                                <label>Your PAN</label>
                            </div>
                        </div>

                        <!-- Voter -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxVoter" runat="server" class="form-control"></asp:TextBox>
                                <label>Your Voter ID</label>
                            </div>
                        </div>

                        <!-- Mobile -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxMobile1" MaxLength="10" runat="server" class="form-control"></asp:TextBox>
                                <label>Your Primary Mobile</label>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxMobile2" MaxLength="10" runat="server" class="form-control"></asp:TextBox>
                                <label>Your Secondary Mobile</label>
                            </div>
                        </div>

                        <!-- Father -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxFather" runat="server" class="form-control"></asp:TextBox>
                                <label>Father's Name</label>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxFContact" runat="server" class="form-control"></asp:TextBox>
                                <label>Father's Contact</label>
                            </div>
                        </div>

                        <!-- Address -->
                        <div class="col-12">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxAddress" runat="server"
                                    TextMode="MultiLine" Rows="3" class="form-control"></asp:TextBox>
                                <label>Address</label>
                            </div>
                        </div>

                        <div class="col-12">
                            <asp:Literal ID="_LiteralMSG" runat="server"></asp:Literal>
                            <asp:Button ID="_ButtonSubmit" runat="server" Text="Submit" Class="btn btn-primary w-100 py-3" OnClick="_ButtonSubmit_Click" ValidationGroup="TenantForm" />
                            <asp:Button ID="_ButtonDocVeri" runat="server" Text="KYC Document.." CssClass="btn btn-danger w-100 py-3 mt-2" Visible="false" OnClick="_ButtonDocVeri_Click" />
                            <asp:Button ID="_ButtonAddMore" runat="server" Text="Add More.." CssClass="btn btn-success w-100 py-3 mt-2" Visible="false" OnClick="_ButtonAddMore_Click" />
                        </div>
                        <asp:ValidationSummary ID="vsPopup" runat="server" ShowMessageBox="true" ShowSummary="false" ValidationGroup="TenantForm" />
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
