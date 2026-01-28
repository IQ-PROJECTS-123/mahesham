<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Maheshamv3.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashboard-wrapper {
            background-color: #f5f7fb;
            min-height: 100vh;
            padding: 40px;
        }

        .dashboard-title {
            font-size: 32px;
            font-weight: 700;
            color: #1e1e1e;
            margin-bottom: 30px;
            text-align: center;
        }

        @media (max-width: 576px) {
            .col-xl-3,
            .col-md-6 {
                flex: 0 0 100% !important;
                max-width: 100% !important;
            }

            .row.g-4 {
                flex-direction: column !important;
            }
        }

        .row.g-4 {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 1.5rem;
            margin-left: 0;
            margin-right: 0;
        }

        .col-12.col-md-6.col-xl-3 {
            display: flex;
            flex: 1 0 25%;
            max-width: 25%;
            padding-left: 0.75rem;
            padding-right: 0.75rem;
        }

        @media (max-width: 992px) {
            .col-xl-3 {
                flex: 0 0 50%;
                max-width: 50%;
            }
        }

        @media (max-width: 576px) {
            .col-xl-3,
            .col-md-6 {
                flex: 0 0 100%;
                max-width: 100%;
            }
        }

        .dashboard-card {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            border-radius: 16px;
            color: #fff;
            text-align: center;
            padding: 25px 15px;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

            .dashboard-card:hover {
                transform: translateY(-6px);
                box-shadow: 0 10px 24px rgba(0, 0, 0, 0.15);
            }

            .dashboard-card i {
                font-size: 38px;
                margin-bottom: 15px;
                transition: all 0.3s ease;
            }

            .dashboard-card:hover i {
                transform: scale(1.15);
            }

            .dashboard-card h5 {
                font-size: 17px;
                font-weight: 500;
                margin-bottom: 8px;
            }

            .dashboard-card .value,
            .dashboard-card .value-circle {
                font-size: 26px;
                font-weight: 700;
            }

        .value-circle {
            width: 60px;
            height: 40px;
            background: #ffffff33;
            border-radius: 40%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 10px auto;
        }

        .dashboard-link {
            display: inline-block;
            margin-top: 10px;
            font-weight: 600;
            color: #fff;
            background-color: rgba(255, 255, 255, 0.25);
            padding: 5px 16px;
            border-radius: 20px;
            text-decoration: none;
            transition: all 0.3s;
        }

            .dashboard-link:hover {
                background-color: rgba(255, 255, 255, 0.4);
            }

        .bg-blue {
            background: linear-gradient(135deg, #2196f3, #21cbf3);
        }

        .bg-green {
            background: linear-gradient(135deg, #43a047, #66bb6a);
        }

        .bg-orange {
            background: linear-gradient(135deg, #fb8c00, #ffb74d);
        }

        .bg-red {
            background: linear-gradient(135deg, #e53935, #ef5350);
        }

        .bg-purple {
            background: linear-gradient(135deg, #8e24aa, #ba68c8);
        }

        .bg-teal {
            background: linear-gradient(135deg, #009688, #4db6ac);
        }

        .bg-gray {
            background: linear-gradient(135deg, #546e7a, #90a4ae);
        }

        .bg-pink {
            background: linear-gradient(135deg, #d81b60, #f06292);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-wrapper">
        <div class="container-fluid">
            <h2 class="dashboard-title">🏠 Dashboard Overview</h2>
            <div class="row g-4">
                <!-- 11️⃣ Total Rooms -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-blue">
                        <i class="bi bi-house-door-fill"></i>
                        <h5>Total Rooms</h5>
                        <div class="value-circle">
                            <asp:Literal ID="_LiteralTotalRooms" runat="server" />
                        </div>
                    </div>
                </div>
                <!-- 6️⃣ Payment Done -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-orange">
                        <i class="bi bi-clock-history"></i>
                        <h5>Payment Done</h5>
                        <div class="value">
                            <asp:Literal ID="_LiteralDone" runat="server" />
                        </div>
                        <a href="Rent.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 12️⃣ Total Vacant -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-green text-center p-3">
                        <i class="bi bi-door-open-fill fs-2"></i>
                        <h5 class="mt-2 mb-3">Vacant+Occupied</h5>
                        <div class="d-flex justify-content-center align-items-center gap-4">
                            <div class="value-circle bg-danger">
                                <asp:Literal ID="_Literalvacant" runat="server" />
                                <div class="circle-label"></div>
                            </div>
                            <div class="value-circle bg-success">
                                <asp:Literal ID="_Literaloccupied" runat="server" />
                                <div class="circle-label"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 2️⃣ Add Tenant -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-green">
                        <i class="bi bi-person-plus-fill"></i>
                        <h5>Add Tenant</h5>
                        <a href="mTenent.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 3️⃣ Meter Reading -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-purple">
                        <i class="bi bi-speedometer2"></i>
                        <h5>Meter Reading</h5>
                        <a href="MeterReading.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 8️⃣ Room Ledger -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-gray">
                        <i class="bi bi-journal-text"></i>
                        <h5>Room Ledger</h5>
                        <a href="ROOMLedger.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 4️⃣ Rent Generator -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-teal">
                        <i class="bi bi-calculator"></i>
                        <h5>Rent Generator</h5>
                        <a href="RentGenerator.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 5️⃣ Payment Pending -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-orange">
                        <i class="bi bi-clock-history"></i>
                        <h5>Payment Pending</h5>
                        <div class="value">
                            <asp:Literal ID="_LiteralPending" runat="server" />
                        </div>
                        <a href="Payment Due.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 7️⃣ Rental -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-pink">
                        <i class="bi bi-receipt"></i>
                        <h5>Rental</h5>
                        <a href="Rent.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 1️⃣ Add Facility -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-red">
                        <i class="bi bi-building"></i>
                        <h5>Add Facility</h5>
                        <a href="Facility.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 9️⃣ Tenant View -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-blue">
                        <i class="bi bi-people-fill"></i>
                        <h5>Tenant View</h5>
                        <a href="Tenent.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
                <!-- 🔟 Data Entry -->
                <div class="col-12 col-md-6 col-xl-3">
                    <div class="dashboard-card bg-orange">
                        <i class="bi bi-file-bar-graph"></i>
                        <h5>Data Entry</h5>
                        <a href="DataEntry.aspx" class="dashboard-link">Go</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
