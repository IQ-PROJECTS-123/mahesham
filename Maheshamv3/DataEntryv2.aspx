<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DataEntryv2.aspx.cs" Inherits="Maheshamv3.DataEntryv2" %>
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
                                <a href="Dashboard.aspx">Dashboard</a> - Data Entry
                            </h2>
                            <div class="row g-3">
                                 <div class="col-lg-12 col-xl-6">
     <div class="form-floating">
         <asp:DropDownList runat="server" ID="_DropDownListFacility" AutoPostBack="true" OnSelectedIndexChanged="_DropDownListFacility_SelectedIndexChanged" class="form-control" ClientIDMode="Static"></asp:DropDownList>
         <label for="_DropDownListFacility">ROOM</label>
     </div>
 </div>
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" required ID="_DropDownListYear" class="form-control" ClientIDMode="Static">
                                            <asp:ListItem Value="" Text="None"></asp:ListItem>
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
                                        <asp:DropDownList runat="server" required ID="_DropDownListMonth" class="form-control" ClientIDMode="Static">
                                            <asp:ListItem Value="" Text="None"></asp:ListItem>
                                            <asp:ListItem Value="1" Text="JAN"></asp:ListItem>
                                            <asp:ListItem Value="2" Text="FEB"></asp:ListItem>
                                            <asp:ListItem Value="3" Text="MAR"></asp:ListItem>
                                            <asp:ListItem Value="4" Text="APR"></asp:ListItem>
                                            <asp:ListItem Value="5" Text="MAY"></asp:ListItem>
                                            <asp:ListItem Value="6" Text="JUN"></asp:ListItem>
                                            <asp:ListItem Value="7" Text="JUL"></asp:ListItem>
                                            <asp:ListItem Value="8" Text="AUG"></asp:ListItem>
                                            <asp:ListItem Value="9" Text="SEP"></asp:ListItem>
                                            <asp:ListItem Value="10" Text="OCT"></asp:ListItem>
                                            <asp:ListItem Value="11" Text="NOV"></asp:ListItem>
                                            <asp:ListItem Value="12" Text="DEC"></asp:ListItem>
                                        </asp:DropDownList>
                                        <label for="_DropDownListMonth">Month</label>
                                    </div>
                                </div>

                               

                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextFacility" required class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextFacility">Reading</label>
                                    </div>
                                </div>

                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextBoxPaid" required class="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextPaidBox">Paid Amount</label>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <asp:Literal runat="server" ID="_LiteralMSG"></asp:Literal>
                                    <asp:Button runat="server" ID="_ButtonSubmit" Text="Submit" CssClass="btn btn-primary w-100 py-3" OnClick="_ButtonSubmit_Click" />
                                </div>
                                <asp:GridView ID="gvDataEnrty" class="table table-bordered table-condensed table-responsive table-hover " runat="server" AutoGenerateColumns="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="SL. No.">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="rYear" HeaderText="Year" />
                                        <asp:BoundField DataField="rMonth" HeaderText="Month" />
                                        <asp:BoundField DataField="meterstart" HeaderText="Start" />
                                        <asp:BoundField DataField="meterend" HeaderText="End" />
                                        <asp:BoundField DataField="Reading" HeaderText="Reading" />
                                        <asp:BoundField DataField="Ebill" HeaderText="Electric Bill" />
                                        <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" />

                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:ImageButton CommandArgument='<%#Bind("ID") %>' ID="_ImageButtonView" runat="server" ImageUrl="~/img/edit.png" Width="30px" ToolTip="View Payment Details" OnClientClick="target ='_blank';" OnClick="_ImageButtonView_Click" />
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
