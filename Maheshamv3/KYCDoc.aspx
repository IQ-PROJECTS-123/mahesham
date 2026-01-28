<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="KYCDoc.aspx.cs" Inherits="Maheshamv3.KYCDoc" %>

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
                                <a href="Dashboard.aspx">Dashboard</a> - KYC Documents
                            </h2>
                            <div class="row g-3">
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList ID="_DropDownListFacility" runat="server" AutoPostBack="true"
                                            OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged"
                                            CssClass="form-control" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <label for="_DropDownListFacility">ROOM</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList ID="_dropdownTenant" runat="server" CssClass="form-control" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <label for="_dropdownTenant">Tenant</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList ID="_dropdownDoc" runat="server" CssClass="form-control" ClientIDMode="Static">
                                            <asp:ListItem Text=" Select Documents " Value="" />
                                            <asp:ListItem Text="Aadhar Card" Value="Aadhar" />
                                            <asp:ListItem Text="PAN Card" Value="PAN" />
                                            <asp:ListItem Text="Voter ID" Value="VoterID" />
                                            <asp:ListItem Text="Photo" Value="Photo" />
                                            <asp:ListItem Text="Driver License" Value="DriverLicense" />
                                        </asp:DropDownList>
                                        <label for="_dropdownDoc">Document Type</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="_txtDocNumber" runat="server" CssClass="form-control" ClientIDMode="Static" />
                                        <label for="_txtDocNumber">Document Number</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:FileUpload ID="_fleupload" runat="server" CssClass="form-control" ClientIDMode="Static" />
                                        <label for="_fleupload">Upload File</label>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary w-100 py-3"
                                        Text="Submit" OnClick="btnSubmit_Click" />
                                </div>
                                <div class="col-12">
                                    <asp:Label ID="_lblMessage" runat="server" CssClass="text-success"></asp:Label>
                                </div>
                                <asp:GridView ID="gvTenantDocs" runat="server" AutoGenerateColumns="false"
                                    CssClass="table table-bordered table-hover"
                                    DataKeyNames="Id"
                                    OnRowDataBound="gvTenantDocs_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="DocType" HeaderText="Document Type" />
                                        <asp:BoundField DataField="DocNumber" HeaderText="Document Number" />
                                        <asp:TemplateField HeaderText="File">
                                            <ItemTemplate>
                                                <a href='<%# ResolveUrl("~/content/pic/" + Eval("FilePath")) %>' target="_blank">View Doc</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:Button ID="btnActive" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="btnActive_Click" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
