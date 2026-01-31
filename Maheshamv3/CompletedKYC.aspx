<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompletedKYC.aspx.cs" Inherits="Maheshamv3.CompletedKYC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12">

                            <h2 class="display-5 mb-2">
                                <a href="Dashboard.aspx">Dashboard</a> - Tenant KYC Completed 
                            </h2>
                            <asp:GridView ID="gvkyc" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered table-hover"
                                HeaderStyle-CssClass="table-dark" GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="TenantId" HeaderText="Tenant ID" />
                                    <asp:BoundField DataField="Room" HeaderText="Room" />
                                    <asp:BoundField DataField="Tenant" HeaderText="Tenant Name" />
                                    <asp:BoundField DataField="Aadhar" HeaderText="Aadhar" />
                                    <asp:BoundField DataField="PAN" HeaderText="PAN" />
                                    <asp:BoundField DataField="VoterID" HeaderText="Voter ID" />
                                    <asp:BoundField DataField="Photo" HeaderText="Photo" />
                                    <asp:BoundField DataField="DriverLicense" HeaderText="Driver License" />

                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:ImageButton CommandArgument='<%# Bind("TenantId") %>' ID="_ImageButtonView" runat="server" ImageUrl="~/img/edit.png" Width="30px" ToolTip="View KYC " OnClick="_ImageButtonView_Click" />
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
</asp:Content>
