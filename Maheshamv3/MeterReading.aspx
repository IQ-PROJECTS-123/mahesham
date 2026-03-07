<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MeterReading.aspx.cs" Inherits="Maheshamv3.MeterReading" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5" style="background-color:white">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12 wow fadeInLeft" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">
                            <h2 class="display-5 mb-2"><a href="Dashboard.aspx" >Dashboard</a> - Meter Reading</h2>
                            <div class="row g-3">
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListYear"  AutoPostBack="true" OnSelectedIndexChanged="_DropDownListType_SelectedIndexChanged"  class="form-control" ClientIDMode="Static">
                                            <asp:ListItem Text="2024"></asp:ListItem>
                                            <asp:ListItem Text="2025"></asp:ListItem>
                                            <asp:ListItem Text="2026"></asp:ListItem>
                                            <asp:ListItem Text="2027"></asp:ListItem>
                                            <asp:ListItem Text="2028"></asp:ListItem>
                                        </asp:DropDownList>
                                        <label for="_DropDownListYear">YEAR</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListMonth"  AutoPostBack="true" OnSelectedIndexChanged="_DropDownListType_SelectedIndexChanged"  class="form-control" ClientIDMode="Static">
                                            <asp:ListItem Value="JAN" Text="JAN"></asp:ListItem>
                                            <asp:ListItem Value="FEB" Text="FEB"></asp:ListItem>
                                            <asp:ListItem Value="MAR" Text="MAR"></asp:ListItem>
                                            <asp:ListItem Value="APR" Text="APR"></asp:ListItem>
                                            <asp:ListItem Value="MAY" Text="MAY"></asp:ListItem>
                                            <asp:ListItem Value="JUN" Text="JUN"></asp:ListItem>
                                            <asp:ListItem Value="JUL" Text="JUL"></asp:ListItem>
                                            <asp:ListItem Value="AUG" Text="AUG"></asp:ListItem>
                                            <asp:ListItem Value="SEP" Text="SEP"></asp:ListItem>
                                            <asp:ListItem Value="OCT" Text="OCT"></asp:ListItem>
                                            <asp:ListItem Value="NOV" Text="NOV"></asp:ListItem>
                                            <asp:ListItem Value="DEC" Text="DEC"></asp:ListItem>
                                        </asp:DropDownList>
                                        <label for="_DropDownListMonth">Reading Month</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListFacility"   AutoPostBack="true" OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged"   class="form-control" ClientIDMode="Static"></asp:DropDownList>
                                        <label for="_DropDownListFacility">ROOM</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextBoxReading" required class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextBoxReading">Meter Reading</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:FileUpload runat="server" ID="_FileUpload" class="form-control" ClientIDMode="Static"></asp:FileUpload>
                                        <label for="_FileUpload">Screen Capture</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <asp:Literal runat="server" ID="_LiteralMSG"></asp:Literal>
                                    <asp:Button runat="server" ID="_ButtonSubmit" Text="Submit" CssClass="btn btn-primary w-100 py-3" OnClick="_ButtonSubmit_Click" />
                                    <asp:Button runat="server" Visible="false" ID="_ButtonNewReading" Text="Read More.." CssClass="btn btn-primary w-100 py-3" OnClick="_ButtonNewReading_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>