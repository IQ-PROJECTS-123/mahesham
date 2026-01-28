<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MeterDateEntry.aspx.cs" Inherits="Maheshamv3.MeterDateEntry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5" style="background-color:white">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12 wow fadeInLeft" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">
                            <h2 class="display-5 mb-2"><a href="Dashboard.aspx">Dashboard</a> - Meter Reading</h2>
                            <div class="row g-3">
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListYear" AutoPostBack="true" OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged" class="form-control" ClientIDMode="Static">
                                            <asp:ListItem Text="2024"></asp:ListItem>
                                            <asp:ListItem Selected="True" Text="2025"></asp:ListItem>
                                            <asp:ListItem Text="2026"></asp:ListItem>
                                            <asp:ListItem Text="2027"></asp:ListItem>
                                            <asp:ListItem Text="2028"></asp:ListItem>
                                        </asp:DropDownList>
                                        <label for="_DropDownListYear">YEAR</label>
                                    </div>
                                    <a href="MeterDateEntry.aspx">MeterDateEntry.aspx</a>
                                </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListFacility" AutoPostBack="true" OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged" class="form-control" ClientIDMode="Static"></asp:DropDownList>
                                        <label for="_DropDownListFacility">ROOM</label>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-xl-12">
                                    <asp:GridView ID="GridView2" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL. No.">
                                                <ItemTemplate>
                                                    <%#Container.DataItemIndex+1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="Month" HeaderText="Month" />
                                            <asp:TemplateField HeaderText="Reading">
                                                <ItemTemplate>
                                                    <asp:TextBox ToolTip='<%# Bind("ID") %>' ID="_TextBox" runat="server" Text='<%# Bind("Reading") %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                           <%-- <asp:TemplateField HeaderText="Total">
                                                <ItemTemplate>
                                                    <asp:TextBox ToolTip='<%# Bind("ID") %>' ID="_TextBoxTotal" runat="server" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Paid">
                                                <ItemTemplate>
                                                    <asp:TextBox ToolTip='<%# Bind("ID") %>' ID="_TextBoxPaid" runat="server" ></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="col-12">
                                    <asp:Literal runat="server" ID="_LiteralMSG"></asp:Literal>
                                    <asp:Button runat="server" ID="_ButtonSubmit" Text="Submit" CssClass="btn btn-primary w-100 py-3" OnClick="_ButtonSubmit_Click" />
                                    <asp:Button runat="server" Visible="false" ID="_ButtonNewReading" Text="Read More.." CssClass="btn btn-primary w-100 py-3" OnClick="_ButtonSubmit_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
