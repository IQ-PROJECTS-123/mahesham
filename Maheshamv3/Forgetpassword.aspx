<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forgetpassword.aspx.cs" Inherits="Maheshamv3.Forgetpassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-8 mx-auto wow fadeInLeft" data-wow-delay="0.1s">
                            <h2 class="display-5 mb-2">
                                <a href="Dashboard.aspx">Dashboard</a> - Reset Password
                            </h2>
                            <p class="text-muted mb-4">
                                Enter your registered Email or Phone to reset your password.
                            </p>
                            <div class="row g-3">
                                <div class="col-lg-8 col-md-10 mx-auto">
                                    <div class="form-floating mb-3">
                                        <asp:TextBox ID="_TextBoxEmail" runat="server" CssClass="form-control" placeholder="Email or Phone"></asp:TextBox>
                                        <label for="_TextBoxEmail">Email / Phone</label>
                                    </div>

                                    <div class="d-grid mb-3">
                                        <asp:Button ID="_ButtonSendOTP" runat="server" Text="Send OTP" CssClass="btn btn-primary py-2 fs-5" OnClick="_ButtonSendOTP_Click" />
                                    </div>

                                    <asp:Panel ID="PanelOTP" runat="server" Visible="false">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="_TextBoxOTP" runat="server" CssClass="form-control" placeholder="Enter OTP"></asp:TextBox>
                                            <label for="_TextBoxOTP">Enter OTP</label>
                                        </div>

                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="_TextBoxNewPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="New Password"></asp:TextBox>
                                            <label for="_TextBoxNewPass">New Password</label>
                                        </div>
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="_TextConfirmPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
                                            <label for="_TextConfirmPass">Confirm Password</label>
                                        </div>

                                        <div class="d-grid mb-3">
                                            <asp:Button ID="_ButtonReset" runat="server" Text="Reset Password" CssClass="btn btn-success py-2 fs-5" OnClick="_ButtonReset_Click" />
                                        </div>
                                    </asp:Panel>

                                    <asp:Label ID="_LabelMessage" runat="server" CssClass="text-center d-block mt-3 text-danger"></asp:Label>

                                    <div class="text-center mt-4">
                                        <a href="authlogin.aspx" class="text-primary fw-bold">Back to Login</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
