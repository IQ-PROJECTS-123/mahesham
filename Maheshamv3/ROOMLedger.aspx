<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ROOMLedger.aspx.cs" Inherits="Maheshamv3.ROOMLedger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid contact py-5" style="background-color:white">
     <div class="container py-5">
         <div class="pb-5">
             <div class="bg-light rounded p-4 pb-0">
                 <div class="row g-5 align-items-center">
                     <div class="col-lg-12 wow fadeInLeft" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">
                         <h2 class="display-5 mb-2"><a href="Dashboard.aspx" >Dashboard</a> - ROOM LADGER </h2> 
                         <div class="row g-3">
                             <div class="col-lg-12 col-xl-6">
                                 <div class="form-floating">
                                     <asp:DropDownList runat="server" ID="_DropDownListYear" AutoPostBack="true" OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged" class="form-control" ClientIDMode="Static">
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
                                     <asp:DropDownList runat="server" ID="_DropDownListFacility" AutoPostBack="true" OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged" class="form-control" ClientIDMode="Static">
                                  </asp:DropDownList>
                                     <label for="_DropDownListFacility">ROOM</label>
                                 </div>
                             </div>
                             <asp:GridView ID="GridView2" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="false">
                                 <Columns>
                                     <asp:TemplateField HeaderText="SL. No.">
                                         <ItemTemplate>
                                             <%#Container.DataItemIndex+1 %>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Photo">
                                         <ItemTemplate>
                                             <img src='/assets/Photo/abc.jpg' width="35" height="35" class="rounded-circle" />
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="AmountType" HeaderText="Type" />  
                                     <asp:BoundField DataField="Name" HeaderText="Name" />
                                    <asp:BoundField DataField="rMonth" HeaderText="Month" />                                   
                                     <asp:BoundField DataField="PeriodStart" HeaderText="Date Join" />
                                    <%-- <asp:BoundField DataField="PeriodEnd" HeaderText="Period End" />--%>
                                     <asp:BoundField DataField="Amount" HeaderText="Amount" />
                                     <asp:BoundField DataField="MeterStart" HeaderText="Meter Start" />
                                     <asp:BoundField DataField="MeterEnd" HeaderText="Meter End" />
                                     <asp:BoundField DataField="Maintenance" HeaderText="Maintenance" />
                                     <asp:BoundField DataField="Unit" HeaderText="Unit" />
                                     <asp:BoundField DataField="Bill" HeaderText="Bill" />
                                     <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" />
                                     <asp:BoundField DataField="PaidAmount" HeaderText="Paid" />
                                     <asp:BoundField DataField="Paidon" HeaderText="Paid On" />
                                     <asp:BoundField DataField="PaymentType" HeaderText="Mode" />
                                     <asp:BoundField DataField="Due" HeaderText="Due" />
                                     <asp:TemplateField HeaderText="Action">
                                         <ItemTemplate>
                                             <asp:ImageButton CommandArgument='<%# Bind("ID") %>' ID="_ImageButtonView" runat="server" ImageUrl="~/img/edit.png" Width="30px" ToolTip="View Payment Details" OnClientClick="target ='_blank';" OnClick="_ImageButtonView_Click" />
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
