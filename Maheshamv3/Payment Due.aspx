<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment Due.aspx.cs" Inherits="Maheshamv3.Payment_Due" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-5" style="background-color: white">
        <div class="container py-5">
            <div class="bg-light rounded p-4 pb-0">
                <h2 class="display-5 mb-3">
                    <a href="Dashboard.aspx">Dashboard</a> - Payment Due
                </h2>
                <!-- Year and Month Selection -->
                <div class="row g-3 mb-4">
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:DropDownList runat="server" ID="_DropDownListYear" AutoPostBack="true"
                                OnSelectedIndexChanged="_DropDownListYear_SelectedIndexChanged" class="form-control">
                                <asp:ListItem Value="">Select Year</asp:ListItem>
                                <asp:ListItem Value="2024">2024</asp:ListItem>
                                <asp:ListItem Value="2025">2025</asp:ListItem>
                                <asp:ListItem Value="2026">2026</asp:ListItem>
                                <asp:ListItem Value="2027">2027</asp:ListItem>
                                <asp:ListItem Value="2028">2028</asp:ListItem>
                            </asp:DropDownList>
                            <label for="_DropDownListYear">Year</label>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="form-floating">
                            <asp:DropDownList runat="server" ID="_DropDownListMonth" AutoPostBack="true"
                                OnSelectedIndexChanged="_DropDownListMonth_SelectedIndexChanged" class="form-control">
                                <asp:ListItem Value="" Text="Select Month"></asp:ListItem>
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
                </div>
                <!-- PDF BUTTON -->

                <asp:Button ID="btnDownloadPDF" runat="server" Text="Download PDF" Class="btn btn-danger mb-3" OnClick="btnDownloadPDF_Click"/>

                <!-- Selected Month-Year -->
                <h4 class="text-danger fw-bold mb-3">Pending Payments
                   
                    <asp:Label ID="_LabelYearMonth" runat="server"></asp:Label>
                </h4>
                <div class="card shadow-sm border-success">
                    <div class="card-body d-flex justify-content-between align-items-center">
                        <span class="h5 mb-0 text-success fw-bold">Total Due Amount:</span>
                        <asp:Label ID="lblTotalDue" runat="server" CssClass="h5 mb-0 text-success fw-bold"></asp:Label>
                    </div>
                    <!-- GridView -->
                    <asp:GridView ID="_GridView2" runat="server" AutoGenerateColumns="False" Class="table table-bordered table-striped table-hover" EmptyDataText="No pending payments found.">
                        <Columns>
                            <asp:BoundField DataField="Tenant" HeaderText="Tenant Name" />
                            <asp:BoundField DataField="Room" HeaderText="Room" />
                            <asp:BoundField DataField="MonthName" HeaderText="Month" />
                            <asp:BoundField DataField="Year" HeaderText="Year" />
                            <asp:BoundField DataField="PeriodStart" HeaderText="Period Start" />
                            <asp:BoundField DataField="PeriodEnd" HeaderText="Period End" />
                            <asp:BoundField DataField="MeterStart" HeaderText="Meter Start" />
                            <asp:BoundField DataField="MeterEnd" HeaderText="Meter End" />
                            <asp:BoundField DataField="Unit" HeaderText="Units Used" />
                            <asp:BoundField DataField="Bill" HeaderText="Electric Bill" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:N2}" />
                            <asp:BoundField DataField="PaidAmount" HeaderText="Paid Amount" DataFormatString="{0:N2}" />
                            <%-- <asp:BoundField DataField="PrevDue" HeaderText="Previous Due" DataFormatString="{0:N2}" />
                        <asp:BoundField DataField="CurrentDue" HeaderText="Current Due" DataFormatString="{0:N2}" />--%>
                            <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:ImageButton CommandArgument='<%# Bind("ID") %>' ID="_ImageButtonView" runat="server" ImageUrl="~/img/edit.png" Width="30px" ToolTip="Payment Due" OnClick="_ImageButtonView_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
