<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tenant_logger.aspx.cs" Inherits="Maheshamv3.Tenant_logger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5" >
        <div class="container py-5" >
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12 wow fadeInLeft" data-wow-delay="0.1s">
                            <h2 class="display-5 mb-2">
                                <a href="Dashboard.aspx">Dashboard</a> - ROOM LEDGER
                            </h2> 

                            <div class="row g-3">
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListFacility" AutoPostBack="true" 
                                            OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged" class="form-control" ClientIDMode="Static">
                                        </asp:DropDownList>
                                        <label for="_DropDownListFacility">ROOM</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" 
                                        class="table table-bordered table-condensed table-responsive table-hover"
                                        OnRowDataBound="GridView2_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderText="SL. No.">
                                                <ItemTemplate>
                                                    <%# Container.DataItemIndex + 1 %>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Photo">
                                                <ItemTemplate>
                                                    <img src='/assets/Photo/abc.jpg' class="rounded-circle" />
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:BoundField DataField="rMonth" HeaderText="Month" />
                                            <asp:BoundField DataField="PeriodStart" HeaderText="Due" />
                                            <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                            <asp:BoundField DataField="MeterStart" HeaderText="Meter Start" />
                                            <asp:BoundField DataField="MeterEnd" HeaderText="Meter End" />
                                            <asp:BoundField DataField="Unit" HeaderText="Unit" />
                                            <asp:BoundField DataField="Bill" HeaderText="Bill" />
                                            <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" />
                                            <asp:BoundField DataField="PaidAmount" HeaderText="Paid" />
                                            <asp:BoundField DataField="PaidOn" HeaderText="Paid On" />
                                            <asp:BoundField DataField="Due" HeaderText="Due" />
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:PlaceHolder ID="phAction" runat="server"></asp:PlaceHolder>
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
    </div>     
</asp:Content>
