<%@ Page Title="" Language="C#" MasterPageFile="~/Tenant.Master" AutoEventWireup="true" CodeBehind="TMeterReading.aspx.cs" Inherits="Maheshamv3.TMeterReading" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12">
                            <h2 class="display-5 mb-2">
                                <a href="TDashboard.aspx">Meter</a> Reading
                            </h2>
                            <div class="row g-3">
                                <!-- Tenant Name -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:Label runat="server" ID="_LabelTenantName" CssClass="form-control"
                                            Style="padding-top: 20px;"></asp:Label>
                                        <label>Tenant Name</label>
                                    </div>
                                </div>
                                <!-- Facility / Room -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:Label runat="server" ID="_LabelFacilityName" CssClass="form-control"
                                            Style="padding-top: 20px;"></asp:Label>
                                        <label>Room / Facility</label>
                                    </div>
                                </div>
                                <!-- YEAR -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListYear" CssClass="form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="_DropDownListYear_SelectedIndexChanged">
                                            <asp:ListItem Text="2024" />
                                            <asp:ListItem Text="2025" />
                                            <asp:ListItem Text="2026" />
                                            <asp:ListItem Text="2027" />
                                            <asp:ListItem Text="2028" />
                                        </asp:DropDownList>
                                        <label for="_DropDownListYear">YEAR</label>
                                    </div>
                                </div>

                                <!-- MONTH -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListMonth" CssClass="form-control"
                                            AutoPostBack="true" OnSelectedIndexChanged="_DropDownListMonth_SelectedIndexChanged">
                                            <asp:ListItem Text="JAN" />
                                            <asp:ListItem Text="FEB" />
                                            <asp:ListItem Text="MAR" />
                                            <asp:ListItem Text="APR" />
                                            <asp:ListItem Text="MAY" />
                                            <asp:ListItem Text="JUN" />
                                            <asp:ListItem Text="JUL" />
                                            <asp:ListItem Text="AUG" />
                                            <asp:ListItem Text="SEP" />
                                            <asp:ListItem Text="OCT" />
                                            <asp:ListItem Text="NOV" />
                                            <asp:ListItem Text="DEC" />
                                        </asp:DropDownList>
                                        <label for="_DropDownListMonth">Reading Month</label>
                                    </div>
                                </div>

                                <!-- Reading Input -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextBoxReading" CssClass="form-control"
                                            placeholder="Enter Meter Reading"></asp:TextBox>
                                        <label for="_TextBoxReading">Meter Reading</label>
                                    </div>
                                </div>

                                <!-- File Upload -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:FileUpload runat="server" ID="_FileUpload" CssClass="form-control" />
                                        <label for="_FileUpload">Upload Meter Capture</label>
                                    </div>

                                    <div class="mt-2">
                                        <asp:Literal ID="_LiteralOldFile" runat="server"></asp:Literal>
                                    </div>
                                </div>

                                <!-- Message + Buttons -->
                                <div class="col-12 mt-2">
                                    <asp:Literal runat="server" ID="_LiteralMSG"></asp:Literal>
                                    <asp:Button runat="server" ID="_ButtonSubmit" Text="Submit" Class="btn btn-primary w-100 py-3" OnClick="_ButtonSubmit_Click" />
                                    <asp:Button runat="server" ID="_ButtonNewReading" Visible="false" Text="Submit Another" OnClick="_ButtonNewReading_Click" class="btn btn-secondary w-100 py-3 mt-3" />
                                </div>

                            </div>
                            <!-- row -->
                        </div>

                    </div>
                    <!-- row -->
                </div>
            </div>

        </div>
    </div>
</asp:Content>
