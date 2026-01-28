<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Building.aspx.cs" Inherits="Maheshamv3.Building" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12 wow fadeInLeft" data-wow-delay="0.1s">
                            <h2 class="display-5 mb-2">
                                <a href="Dashboard.aspx">Dashboard</a> - Building
                            </h2>
                            <div class="row g-3">
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextTitle" required class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextTitle">Title</label>
                                    </div>
                                </div>
                                <!--Content-->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextContent" required class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextContent">Content</label>
                                    </div>
                                </div>
                                <!--Contact-->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextMobile" MaxLength="10" required class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextMobile">Mobile</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextCity" required class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextCity">City</label>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextEmail" TextMode="Email" class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextEmail">Email</label>
                                    </div>
                                </div>
                                <!--Description-->
                                <div class="col-12">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextDescription" TextMode="MultiLine" Rows="4" required placeholder="Building detailed content" class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextDescription">Description</label>
                                    </div>
                                </div>
                                <asp:HiddenField runat="server" ID="_hfActive" Value="1" />

                                <asp:Literal runat="server" ID="_litlesms"></asp:Literal>

                                <div class="col-12">
                                    <asp:Literal runat="server" ID="_LiteralMSG"></asp:Literal>
                                    <asp:Button runat="server" ID="ButtonSubmit" Text="Submit" CssClass="btn btn-primary w-100 py-3" OnClick="ButtonSubmit_Click"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
