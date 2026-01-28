<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rent.aspx.cs" Inherits="Maheshamv3.Rent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color: white !important;
        }

        .rent-card {
            transition: .3s ease-in-out;
            border: none !important;
            background: #ffffff;
            box-shadow: 0px 5px 20px rgba(0,0,0,.08);
        }

            .rent-card:hover {
                transform: translateY(-10px);
                box-shadow: 0px 20px 40px rgba(0,0,0,.15);
            }

        .card-header-bg {
            background: linear-gradient(135deg, #0d6efd, #478cff);
            color: white;
            padding: 20px;
        }

        .profile-img {
            border: 3px solid #fff;
            padding: 2px;
            transition: .3s;
            box-shadow: 0 0 15px rgba(255,255,255,.4);
        }

            .profile-img:hover {
                transform: scale(1.12);
            }

        .key {
            font-weight: 600;
            width: 110px;
            display: inline-block;
        }

        .card-body {
            background-color: aqua;
            color: brown;
        }

        .divider {
            height: 1px;
            background: #eaeaea;
            margin: 6px 0;
        }

        .pay-now-btn {
            background: linear-gradient(135deg, #00c853, #009624);
            color: #fff;
            border: none;
            padding: 12px 24px;
            border-radius: 50px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            box-shadow: 0 5px 12px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease-in-out;
        }

            .pay-now-btn:hover {
                background: linear-gradient(135deg, #00e676, #00c853);
                transform: translateY(-4px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);
            }

            .pay-now-btn:active {
                transform: translateY(2px);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            }

        .header-controls {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            align-items: center;
            gap: 10px;
        }

        .btn-group .btn {
            min-width: 90px;
            font-weight: 600;
            border-radius: 20px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid contact py-5" style="background-color: white">
        <div class="container py-5">
            <div class="header-controls mb-3">
                <h2 class="display-5 mb-0">
                    <a href="Dashboard.aspx">Dashboard</a> - Rental
                </h2>
                <div class="btn-group">
                    <asp:Button ID="btnTile" runat="server" Text="Tile" CssClass="btn btn-outline-primary"
                        OnClick="btnTile_Click" />
                    <asp:Button ID="btnGrid" runat="server" Text="Grid" CssClass="btn btn-outline-dark"
                        OnClick="btnGrid_Click" />
                </div>
            </div>
            <div class="row g-3 mb-4">
                <div class="col-lg-6">
                    <div class="form-floating">
                        <asp:DropDownList ID="_DropDownListYear" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="_DropDownListYear_SelectedIndexChanged"
                            class="form-control">
                            <asp:ListItem Text="2024" />
                            <asp:ListItem Text="2025" />
                            <asp:ListItem Text="2026" />
                            <asp:ListItem Text="2027" />
                            <asp:ListItem Text="2028" />
                        </asp:DropDownList>
                        <label for="_DropDownListYear">Year</label>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="form-floating">
                        <asp:DropDownList ID="_DropDownListMonth" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="_DropDownListMonth_SelectedIndexChanged"
                            class="form-control">
                            <asp:ListItem Value="JAN" Text="JAN" />
                            <asp:ListItem Value="FEB" Text="FEB" />
                            <asp:ListItem Value="MAR" Text="MAR" />
                            <asp:ListItem Value="APR" Text="APR" />
                            <asp:ListItem Value="MAY" Text="MAY" />
                            <asp:ListItem Value="JUN" Text="JUN" />
                            <asp:ListItem Value="JUL" Text="JUL" />
                            <asp:ListItem Value="AUG" Text="AUG" />
                            <asp:ListItem Value="SEP" Text="SEP" />
                            <asp:ListItem Value="OCT" Text="OCT" />
                            <asp:ListItem Value="NOV" Text="NOV" />
                            <asp:ListItem Value="DEC" Text="DEC" />
                        </asp:DropDownList>
                        <label for="_DropDownListMonth">Month</label>
                    </div>
                </div>

                <div class="col-lg-12">
                    <div class="form-floating">
                        <asp:DropDownList ID="_dropdownloadRent" runat="server" AutoPostBack="true"
                            OnSelectedIndexChanged="_dropdownloadRent_SelectedIndexChanged"
                            class="form-control">
                            <asp:ListItem Text="All" />
                            <asp:ListItem Text="Pending" />
                            <asp:ListItem Text="Rental" />
                            <asp:ListItem Text="Advance" />
                            <asp:ListItem Text="Vacent" />
                        </asp:DropDownList>
                        <label for="_dropdownloadRent">Rent Type</label>
                    </div>
                </div>
            </div>
            <%--Pending--%>
            <asp:Panel ID="PanelPending" runat="server" Visible="false">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="fw-bold text-warning mb-0">Pending Rent (<asp:Literal runat="server" ID="_LiteralrPeding"></asp:Literal>)</h4>
                    <span class="badge bg-danger px-4 py-2 fs-6">Pending:
                  
                        <asp:Label ID="lblTotalPending" runat="server"></asp:Label>
                    </span>
                </div>
                <asp:ListView ID="ListViewPending" runat="server" ItemPlaceholderID="itemPlaceholder">
                    <LayoutTemplate>
                        <div class="row">
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card rent-card border-danger rounded-4 overflow-hidden">
                                <div class="card-header-bg text-center pending-header-bg">
                                    <img src="~/img/man.png" class="rounded-circle profile-img" width="75" height="75"
                                        onerror="this.src='~/img/default.png'" runat="server" />
                                    <h5 class="fw-bold mt-2 mb-0"><%# Eval("Name") %></h5>
                                    <span class="badge bg-dark text-warning mt-1 px-3">Room: <%# Eval("facility") %></span>
                                </div>
                                <div class="card-body p-4">
                                    <p class="mb-2"><span class="key">Mobile:</span> <%# Eval("Mobile1") %></p>
                                    <p class="mb-2"><span class="key">Amount:</span> <strong class="text-danger">₹<%# Eval("Amount") %></strong></p>
                                    <p class="mb-2"><span class="key">Period:</span> <%# Eval("PeriodStart") %> → <%# Eval("PeriodEnd") %></p>
                                    <p class="mb-2"><span class="key">Type:</span> <%# Eval("AmountType") %></p>
                                    <p class="mb-2"><span class="key">Meter:</span> <%# Eval("MeterStart") %> → <%# Eval("MeterEnd") %> (<%# Eval("Unit") %> Unit)</p>
                                    <div class="bg-warning rounded-3 p-2 text-center mt-3">
                                        <p class="fw-bold text-danger mb-1">Total: ₹<%# Eval("TotalAmount") %></p>
                                        <p class="fw-bold text-dark mb-0">Paid: ₹<%# Eval("PaidAmount") %> (Pending)</p>
                                    </div>
                                    <div class="text-end mt-3">
                                        <asp:Button ID="btnPayPending" runat="server" Text="Pay Now" CssClass="pay-now-btn"
                                            CommandArgument='<%# Eval("ID") %>' OnClick="btnPayNow_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </asp:Panel>

            <!-- Card Layout List -->
            <asp:Panel ID="PanelAdvance" runat="server">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="fw-bold text-primary mb-0">Advance  (<asp:Literal runat="server" ID="_LiteralrAdvace"></asp:Literal>)</h4>
                    <span class="badge bg-dark px-4 py-2 fs-6">Total Advance: 
                        <asp:Label ID="lblTotalAdvance" runat="server"></asp:Label>
                    </span>
                </div>
                <asp:ListView ID="ListViewAdvance" runat="server">
                    <LayoutTemplate>
                        <div class="row">
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </div>
                    </LayoutTemplate>

                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card rent-card rounded-4 overflow-hidden">
                                <div class="card-header-bg text-center">
                                    <img src="~/img/man.png" class="rounded-circle profile-img" width="75" height="75" onerror="this.src='~/img/default.png'" runat="server" />
                                    <h5 class="fw-bold mt-2 mb-0"><%# Eval("Name") %></h5>
                                    <span class="badge bg-light text-dark mt-1 px-3">Room: <%# Eval("facility") %>
                                    </span>
                                </div>
                                <div class="card-body p-4">
                                    <p class="mb-2"><span class="key">Mobile:</span> <%# Eval("Mobile1") %></p>
                                    <p class="mb-2"><span class="key">Period:</span> <%# Eval("PeriodStart") %> → <%# Eval("PeriodEnd") %></p>
                                    <p class="mb-2"><span class="key">Type:</span> <%# Eval("AmountType") %></p>
                                    <p class="mb-2"><span class="key">Meter:</span> <%# Eval("MeterStart") %> → <%# Eval("MeterEnd") %> (<%# Eval("Unit") %> Unit)</p>
                                    <div class="divider"></div>
                                    <p class="mb-2"><span class="key">Amount:</span> <strong>₹<%# Eval("Amount") %></strong></p>
                                    <p class="mb-2"><span class="key">Bill:</span> <strong>₹<%# Eval("Bill") %></strong></p>
                                    <div class="bg-light rounded-3 p-2 text-center mt-3">
                                        <p class="fw-bold text-danger mb-1">Total: ₹<%# Eval("TotalAmount") %></p>
                                        <p class="fw-bold text-success mb-0">Paid: ₹<%# Eval("PaidAmount") %></p>
                                    </div>
                                    <div class="text-center mt-3">
                                        <asp:Button ID="btnPayAdvance" runat="server" Text="Pay Now" CssClass="pay-now-btn"
                                            CommandArgument='<%# Eval("ID") %>' OnClick="btnPayNow_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </asp:Panel>
            <%---------    Rent   -------%>
            <asp:Panel ID="PanelRent" runat="server" Visible="false">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="fw-bold text-primary mb-0">Received Payment (<asp:Literal runat="server" ID="_LiteralrCount"></asp:Literal>)</h4>
                    <span class="badge bg-dark px-4 py-2 fs-6">Expected :
                     <asp:Label runat="server" ID="lblTotalExpected"></asp:Label>
                    </span>
                    <span class="badge bg-dark px-4 py-2 fs-6">Total cash:
                     <asp:Label runat="server" ID="lblTotalcash"></asp:Label>
                    </span>
                    <span class="badge bg-dark px-4 py-2 fs-6">Total scan:
                    <asp:Label runat="server" ID="lblTotalscan"></asp:Label>
                    </span>
                    <span class="badge bg-dark px-4 py-2 fs-6">Total Rent:
                     <asp:Label ID="lblTotalPaid" runat="server"></asp:Label>
                    </span>
                </div>
                <asp:ListView ID="ListViewRent" runat="server" ItemPlaceholderID="itemPlaceholderRent">
                    <LayoutTemplate>
                        <div class="row">
                            <asp:PlaceHolder ID="itemPlaceholderRent" runat="server"></asp:PlaceHolder>
                        </div>
                    </LayoutTemplate>

                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card rent-card rounded-4 overflow-hidden">
                                <div class="card-header-bg text-center">
                                    <img src="~/img/man.png" class="rounded-circle profile-img" width="75" height="75" onerror="this.src='~/img/default.png'" runat="server" />
                                    <h5 class="fw-bold mt-2 mb-0"><%# Eval("Name") %></h5>
                                    <span class="badge bg-light text-dark mt-1 px-3">Room: <%# Eval("facility") %></span>
                                </div>
                                <div class="card-body p-4">
                                    <p class="mb-2"><span class="key">Mobile:</span> <%# Eval("Mobile1") %></p>
                                    <p class="mb-2"><span class="key">Amount:</span> <strong>₹<%# Eval("Amount") %></strong></p>
                                    <p class="mb-2"><span class="key">Period:</span> <%# Eval("PeriodStart") %> → <%# Eval("PeriodEnd") %></p>
                                    <p class="mb-2"><span class="key">Type:</span> <%# Eval("AmountType") %></p>
                                    <p class="mb-2"><span class="key">Meter:</span> <%# Eval("MeterStart") %> → <%# Eval("MeterEnd") %> (<%# Eval("Unit") %> Unit)</p>
                                    <div class="bg-light rounded-3 p-2 text-center mt-3">
                                        <p class="fw-bold text-danger mb-1">Total: ₹<%# Eval("TotalAmount") %></p>
                                        <p class="fw-bold text-success mb-0">Paid: ₹<%# Eval("PaidAmount") %></p>
                                    </div>
                                    <div class="text-end mt-3">
                                        <asp:Button ID="btnPayRent" runat="server" Text="Pay Now" CssClass="pay-now-btn"
                                            CommandArgument='<%# Eval("ID") %>' OnClick="btnPayNow_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </asp:Panel>
            <%--Vacent--%>
            <asp:Panel ID="PanelVacent" runat="server" Visible="false">
                <h4 class="fw-bold text-primary mb-3">Vacant (<asp:Literal runat="server" ID="_LiteralrVacent"></asp:Literal>)</h4>
                <asp:ListView ID="ListViewVacent" runat="server">
                    <LayoutTemplate>
                        <div class="row">
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server"></asp:PlaceHolder>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="col-md-4 mb-4">
                            <div class="card rent-card rounded-4 overflow-hidden">
                                <div class="card-header-bg text-center">
                                    <img src="~/img/man.png" class="rounded-circle profile-img" width="75" height="75" onerror="this.src='~/img/default.png'" runat="server" />
                                    <h5 class="fw-bold mt-2 mb-0"><%# Eval("Name") %></h5>
                                    <span class="badge bg-light text-dark mt-1 px-3">Room: <%# Eval("facility") %></span>
                                </div>
                                <div class="card-body p-4">
                                    <%-- <p class="mb-2"><span class="key">Mobile:</span> <%# Eval("Mobile1") %></p>--%>
                                    <p class="mb-2"><span class="key">Meter:</span> <%# Eval("MeterStart") %> → <%# Eval("MeterEnd") %> (<%# Eval("Unit") %> Unit)</p>
                                    <p class="text-danger fw-bold mt-3">Status: Vacant</p>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
            </asp:Panel>
        </div>
    </div>
</asp:Content>
