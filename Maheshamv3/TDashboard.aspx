<%@ Page Title="" Language="C#" MasterPageFile="~/Tenant.Master" AutoEventWireup="true"
    CodeBehind="TDashboard.aspx.cs" Inherits="Maheshamv3.TDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid contact py-5">
    <div class="container py-5">
        <div class="pb-5">
            <div class="bg-light rounded p-4 pb-0">
                
                <h2 class="display-5 mb-2">
                    <a href="TDashboard.aspx">Rent</a> Details
                </h2>

                <div class="row g-3">

                    <!-- Name -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:TextBox ID="_TextName" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                            <label>Your Name</label>
                        </div>
                    </div>

                    <!-- Room -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:DropDownList ID="_DropDownListFacility" runat="server"
                                CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged">
                            </asp:DropDownList>
                            <label>ROOM</label>
                        </div>
                    </div>

                    <!-- Year -->
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:DropDownList ID="_DropDownListYear" runat="server"
                                CssClass="form-control" AutoPostBack="true"
                                OnSelectedIndexChanged="_DropDownListYear_SelectedIndexChanged">

                                <asp:ListItem Text="2024" />
                                <asp:ListItem Text="2025" />
                                <asp:ListItem Text="2026" />
                                <asp:ListItem Text="2027" />
                                <asp:ListItem Text="2028" />

                            </asp:DropDownList>
                            <label>Year</label>
                        </div>
                    </div>

                    <!-- GRIDVIEW -->
                    <div class="col-12 mt-4">
                        <asp:GridView ID="_GridViewRent" runat="server"
                            CssClass="table table-bordered"
                            AutoGenerateColumns="false"
                            OnRowCommand="_GridViewRent_RowCommand"
                            OnRowDataBound="_GridViewRent_RowDataBound">

                            <Columns>
                                <asp:BoundField DataField="StartDate" HeaderText="Start" />
                                <asp:BoundField DataField="EndDate" HeaderText="End" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                <asp:BoundField DataField="PaidAmount" HeaderText="Paid" />
                                <asp:BoundField DataField="TotalAmount" HeaderText="Total" />
                                <asp:BoundField DataField="Bill" HeaderText="Bill" />
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:Button ID="btnPay" runat="server"
                                            Text="Pay Now"
                                            CssClass="btn btn-success btn-sm"
                                            CommandName="Pay"
                                            CommandArgument='<%# Eval("ID") %>' />
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
