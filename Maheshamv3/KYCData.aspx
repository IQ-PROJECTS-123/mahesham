<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KYCData.aspx.cs" Inherits="Maheshamv3.KYCData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12 wow fadeInLeft" data-wow-delay="0.1s"
                            style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h2 class="display-5 mb-0">
                                    <a href="Dashboard.aspx">Dashboard</a> - KYC Document
                                </h2>
                                <asp:Button ID="_btncomplete" runat="server" Text="Completed KYC" CssClass="btn btn-primary" OnClick="_btncomplete_Click" />
                            </div>
                            <asp:GridView ID="gvkyc" runat="server"
                                AutoGenerateColumns="false"
                                CssClass="table table-bordered table-condensed table-responsive table-hover"
                                DataKeyNames="TenantId">

                                <Columns>
                                    <asp:TemplateField HeaderText="SL. No.">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex + 1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Tenant" HeaderText="Tenant" />
                                    <asp:BoundField DataField="Room" HeaderText="Room" />
                                    <asp:BoundField DataField="Aadhar" HeaderText="Aadhar Card" />
                                    <asp:BoundField DataField="PAN" HeaderText="PAN Card" />
                                    <asp:BoundField DataField="VoterID" HeaderText="Voter ID" />
                                    <asp:BoundField DataField="Photo" HeaderText="Photo" />
                                    <asp:BoundField DataField="DriverLicense" HeaderText="Driver License" />
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:ImageButton CommandArgument='<%# Bind("TenantId") %>' ID="_ImageButtonView" runat="server" ImageUrl="~/img/edit.png" Width="30px" ToolTip="View KYC Details" OnClick="btnEdit_Click" />
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
