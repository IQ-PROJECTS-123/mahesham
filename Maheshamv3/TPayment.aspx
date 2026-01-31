<%@ Page Title="" Language="C#" MasterPageFile="~/Tenant.Master" AutoEventWireup="true" CodeBehind="TPayment.aspx.cs" Inherits="Maheshamv3.TPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid contact py-5">
<div class="container py-5">

    <div class="pb-5">
        <div class="bg-light rounded p-4 pb-0">

            <h2 class="display-5 mb-3">
                <a href="TSDashboard.aspx">Payment</a> - Tenant
            </h2>

            <div class="row g-5 align-items-center">
                <div class="col-lg-12">

                    <div class="row g-3">

                        <!-- Rent Month -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="form-floating">
                                <asp:Label runat="server" ID="_LabelMonth" CssClass="form-control"></asp:Label>
                                <label>Rent Month</label>
                            </div>
                        </div>

                        <!-- Name -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="form-floating">
                                <asp:Label runat="server" ID="_LabelName" CssClass="form-control"></asp:Label>
                                <label>Name</label>
                            </div>
                        </div>

                        <!-- Room -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="form-floating">
                                <asp:Label runat="server" ID="_LabelRoom" CssClass="form-control"></asp:Label>
                                <label>Room</label>
                            </div>
                        </div>

                       <%-- <!-- PAYMENT STATUS (NEW) -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="form-floating">
                                <asp:Label runat="server" ID="_LabelStatus" CssClass="form-control text-primary"></asp:Label>
                                <label>Payment Status</label>
                            </div>
                        </div>--%>

                        <!-- Payment Date -->
                        <div class="col-lg-6">
                            <div class="form-floating">
                                <asp:TextBox ID="_TextBoxStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                <label>Payment Date</label>
                            </div>
                        </div>

                        <!-- Total Amount -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="form-floating">
                                <asp:Label runat="server" ID="_LabelTotal" CssClass="form-control"></asp:Label>
                                <label>Total</label>
                            </div>
                        </div>

                        <!-- Paid Amount -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="form-floating">
                                <asp:TextBox runat="server" ID="_TextBoxAmount" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                <label>Paid Amount</label>
                            </div>
                        </div>

                        <!-- Payment Type -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="form-floating">
                                <asp:DropDownList runat="server" ID="_DropDownListType" CssClass="form-control"
                                    AutoPostBack="true" OnSelectedIndexChanged="_DropDownListType_SelectedIndexChanged">
                                    <asp:ListItem Text="Scan"></asp:ListItem>
                                    <asp:ListItem Text="UPI"></asp:ListItem>
                                    <asp:ListItem Text="Bank"></asp:ListItem>
                                    <asp:ListItem Text="Cash"></asp:ListItem>
                                    <asp:ListItem Text="Cash+UPI"></asp:ListItem>
                                </asp:DropDownList>
                                <label>Payment Type</label>
                            </div>
                        </div>

                        <!-- CASH Amount -->
                        <div class="col-lg-12 col-xl-6" runat="server" id="CashDiv" visible="false">
                            <div class="form-floating">
                                <asp:TextBox runat="server" ID="_txtCashAmount" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                <label>Cash Amount</label>
                            </div>
                        </div>

                        <!-- UPI Amount -->
                        <div class="col-lg-12 col-xl-6" runat="server" id="UPIDiv" visible="false">
                            <div class="form-floating">
                                <asp:TextBox runat="server" ID="_txtUpiAmount" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                <label>UPI Amount</label>
                            </div>
                        </div>

                        <!-- Upload Screenshot -->
                        <div class="col-lg-12 col-xl-6">
                            <div class="form-floating">
                                <asp:FileUpload runat="server" ID="_FileUpload" CssClass="form-control"></asp:FileUpload>
                                <label>Upload Screenshot</label>
                            </div>
                        </div>

                        <!-- Note -->
                        <div class="col-lg-12">
                            <div class="form-floating">
                                <asp:TextBox runat="server" ID="_TextBoxNote" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                                <label>Note (optional)</label>
                            </div>
                        </div>

                        <!-- Buttons & Message -->
                        <div class="col-12">
                            <asp:Literal runat="server" ID="_LiteralMSG"></asp:Literal>
                            <asp:Button runat="server" ID="_ButtonSubmit" Text="Submit Payment" Class="btn btn-primary w-100 py-3" Visible="false" OnClick="_ButtonSubmit_Click" />
                            <asp:Button runat="server" ID="_ButtonNewReading" Text="Close" Class="btn btn-secondary w-100 py-3 mt-2" Visible="false" OnClientClick="window.close(); return false;" />
                        </div>
                    </div> 
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</asp:Content>
