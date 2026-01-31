<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Facility.aspx.cs" Inherits="Maheshamv3.Facility" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5" style="background-color:white">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12 wow fadeInLeft" data-wow-delay="0.1s">
                            <h2 class="display-5 mb-2">
                                <a href="Dashboard.aspx">Dashboard</a> - Facility
                            </h2>
                            <div class="row g-3">
                                <!-- Building Dropdown -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_ddlBuilding" CssClass="form-control">
                                            <asp:ListItem Text=" Select Building " Value=""></asp:ListItem>
                                            <asp:ListItem Text="Mahesham-I" Value="Mahesham-1"></asp:ListItem>
                                            <asp:ListItem Text="Mahesham-II" Value="Mahesham-II"></asp:ListItem>
                                        </asp:DropDownList>
                                        <label for="_ddlBuilding">Building</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_txtTitle" CssClass="form-control" required></asp:TextBox>
                                        <label for="_txtTitle">Facility Title</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_txtLocation" CssClass="form-control" placeholder="Enter Location"></asp:TextBox>
                                        <label for="_txtLocation">Location</label>
                                    </div>
                                </div>

                                <asp:HiddenField runat="server" ID="hfFacilityID" />
                                <asp:HiddenField runat="server" ID="_hfActive" Value="1" />

                                <asp:Literal runat="server" ID="_litlesms"></asp:Literal>

                                <div class="col-12">
                                    <asp:Literal runat="server" ID="_litMessage"></asp:Literal>
                                    <asp:Button runat="server" ID="btnSave" Text="Submit" CssClass="btn btn-primary w-100 py-3" OnClick="btnSave_Click" />
                                  
                                    <asp:Button runat="server" ID="_ButtonAddMore" Text="Add more.." CssClass="btn btn-danger w-100 py-3 mt-2" OnClick="_ButtonAddMore_Click" Visible="false" />
                                    <asp:Button runat="server" ID="_ButtonViewFacilities" Text="View Facilities.." CssClass="btn btn-success w-100 py-3 mt-2" Visible="false" OnClick="_ButtonViewFacilities_Click"/>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
