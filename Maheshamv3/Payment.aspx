<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Maheshamv3.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5" style="background-color:white">
        <div class="container py-5">
            <div class="pb-5">
                <div class="bg-light rounded p-4 pb-0">
                    <h2 class="display-5 mb-3">
                        <a href="Dashboard.aspx">Dashboard</a> - Payment
                    </h2>
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-12 wow fadeInLeft" data-wow-delay="0.1s"
                            style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInLeft;">
                            <div class="row g-3">

                                <!-- Rent Month -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:Label runat="server" ID="_LabelMonth" CssClass="form-control" ClientIDMode="Static"></asp:Label>
                                        <label for="_LabelMonth">Rent Month</label>
                                    </div>
                                </div>

                                <!-- Name -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:Label runat="server" ID="_LabelName" CssClass="form-control" ClientIDMode="Static"></asp:Label>
                                        <label for="_LabelName">Name</label>
                                    </div>
                                </div>

                                <!-- Room -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:Label runat="server" ID="_LabelRoom" CssClass="form-control" ClientIDMode="Static"></asp:Label>
                                        <label for="_LabelRoom">Room</label>
                                    </div>
                                </div>
                                <!-- Payment Date -->
                                <div class="col-lg-6">
                                    <div class="form-floating">
                                        <asp:TextBox ID="_TextBoxStartDate" runat="server" TextMode="Date" class="form-control"></asp:TextBox>
                                        <label>Payment Date</label>
                                    </div>
                                </div>

                                <!-- Total -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:Label runat="server" ID="_LabelTotal" CssClass="form-control" ClientIDMode="Static"></asp:Label>
                                        <label for="_LabelTotal">Total</label>
                                    </div>
                                </div>

                                <!-- Paid Amount -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextBoxAmount" TextMode="Number" required CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextBoxAmount">Paid Amount</label>
                                    </div>
                                </div>
                                <%--  <!-- maintenance -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextBoxMaitenance" TextMode="Number" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextBoxAmount">Maintenance</label>
                                    </div>
                                </div>--%>
                                <!-- Payment Type -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:DropDownList runat="server" ID="_DropDownListType" CssClass="form-control" ClientIDMode="Static" AutoPostBack="true" OnSelectedIndexChanged="_DropDownListType_SelectedIndexChanged">
                                            <asp:ListItem Text="Scan"></asp:ListItem>
                                            <asp:ListItem Text="Bank"></asp:ListItem>
                                            <asp:ListItem Text="Cash"></asp:ListItem>
                                            <asp:ListItem Text="Cash+UPI"></asp:ListItem>
                                        </asp:DropDownList>
                                        <label for="_DropDownListType">Payment Type</label>
                                    </div>
                                </div>
                                <!-- CASH Amount -->
                                <div class="col-lg-12 col-xl-6" runat="server" id="CashDiv" visible="false">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_txtCashAmount" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                        <label for="_txtCashAmount">Cash Amount</label>
                                    </div>
                                </div>
                                <!-- UPI Amount -->
                                <div class="col-lg-12 col-xl-6" runat="server" id="UPIDiv" visible="false">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_txtUpiAmount" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                        <label for="_txtUpiAmount">UPI Amount</label>
                                    </div>
                                </div>
                                <!-- Screenshot Upload -->
                                <div class="col-lg-12 col-xl-6">
                                    <div class="form-floating">
                                        <asp:FileUpload runat="server" ID="_FileUpload" CssClass="form-control" ClientIDMode="Static"></asp:FileUpload>
                                        <label for="_FileUpload">Screen Capture</label>
                                    </div>
                                </div>
                                <!-- Note -->
                                <div class="col-lg-12">
                                    <div class="form-floating">
                                        <asp:TextBox runat="server" ID="_TextBoxNote" CssClass="form-control" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
                                        <label for="_TextBoxNote">Note</label>
                                    </div>
                                </div>
                                <!-- Buttons & Message -->
                                <div class="col-12">
                                    <asp:Literal runat="server" ID="_LiteralMSG"></asp:Literal>
                                    <asp:Button runat="server" Visible="false" ID="_ButtonSubmit" Text="Submit"
                                        CssClass="btn btn-primary w-100 py-3" OnClick="_ButtonSubmit_Click" />
                                    <asp:Button runat="server" Visible="false" OnClientClick="window.close(); return false;"
                                        ID="_ButtonNewReading" Text="Close" CssClass="btn btn-secondary w-100 py-3 mt-2" />
                                </div>
                            </div>
                            <!-- end row g-3 -->
                        </div>
                        <!-- end col-lg-12 -->
                    </div>
                    <!-- end row g-5 -->
                </div>
                <!-- end bg-light -->
            </div>
            <!-- end pb-5 -->
        </div>
        <!-- end container -->
    </div>
    <!-- end container-fluid -->
</asp:Content>
