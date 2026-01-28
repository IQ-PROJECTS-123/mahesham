<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MBuilding.aspx.cs" Inherits="Maheshamv3.MBuilding" %>
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
                          
                         <h2 class="display-5 mb-2">
                             <a href="Dashboard.aspx">Dashboard</a> - Building Master
                         </h2>
                         <asp:GridView ID="gvBuilding" runat="server"
                             AutoGenerateColumns="false"
                             CssClass="table table-bordered table-condensed table-responsive table-hover"
                             DataKeyNames="ID">
                             <Columns>
                                 <asp:TemplateField HeaderText="SL. No.">
                                     <ItemTemplate>
                                         <%# Container.DataItemIndex + 1 %>
                                     </ItemTemplate>
                                  </asp:TemplateField>
                                  <asp:BoundField DataField="Title" HeaderText="Title" />
                                  <asp:BoundField DataField="Content_Person" HeaderText="Content_Person" />                               
                                  <asp:BoundField DataField="Mobile" HeaderText="Mobile" />  
                                  <asp:BoundField DataField="City" HeaderText="City" />  
                                  <asp:BoundField DataField="Email" HeaderText="Email" />
                                  <asp:BoundField DataField="Description" HeaderText="Description" />  
                                  <asp:TemplateField HeaderText="Action">
                                     <ItemTemplate>
                                         <asp:ImageButton ID="_ImageButtonEdit" runat="server"
                                             CommandArgument='<%# Eval("ID") %>'
                                             ImageUrl="~/img/edit.png" Width="25px"
                                             ToolTip="Edit Facility"
                                             Onclick="_ImageButtonEdit_Click" />

                                         <asp:ImageButton ID="_ImageButtonDelete" runat="server"
                                             CommandArgument='<%# Eval("ID") %>'
                                             ImageUrl="~/img/Cross.png" Width="25px"
                                             ToolTip="Delete Facility"
                                             Onclick="_ImageButtonDelete_Click"/>
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
