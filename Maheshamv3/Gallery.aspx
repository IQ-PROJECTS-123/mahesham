<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Maheshamv3.Gellery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid py-5 bg-light" id="Gallery">
    <div id="Gallery" class="container py-5">
        <div class="text-center mb-5">
            <h1 class="display-4 mb-0">Mahesham Environment</h1>
        </div>

        <div class="row g-4">
            <!-- Single Room -->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card border-0 shadow-sm">
                    <img src="img/single.jpg" class="card-img-top" alt="Single Room">
                </div>
            </div>

            <!-- Double Room -->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card border-0 shadow-sm">
                    <img src="img/Double1.jpg" class="card-img-top" alt="Double Room">
                </div>
            </div>

            <!-- Shared Room -->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card border-0 shadow-sm">
                    <img src="img/share.jpg" class="card-img-top" alt="Shared Room">
                </div>
            </div>

            <!-- Dining Hall -->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card border-0 shadow-sm">
                    <img src="img/dining.jpg" class="card-img-top" alt="Dining Hall">
                </div>
            </div>

            <!-- Study Area -->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card border-0 shadow-sm">
                    <img src="img/study.jpg" class="card-img-top" alt="Study Area">
                </div>
            </div>

            <!-- Hostel Building -->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card border-0 shadow-sm">
                    <img src="img/building.jpg" class="card-img-top" alt="Hostel Building">
                </div>
            </div>

            <!-- Nature Views -->
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card border-0 shadow-sm">
                    <img src="img/nature.jpg" class="card-img-top" alt="Nature Views">
                </div>
            </div>

        </div>
    </div>
</div>

</asp:Content>
