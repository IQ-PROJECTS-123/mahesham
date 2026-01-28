<%@ Page Title="Directions - Mahesham Lodge" Language="C#" MasterPageFile="~/Gen.Master" AutoEventWireup="true" CodeBehind="Directions.aspx.cs" Inherits="Maheshamv3.Directions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
    
    <style>
        /* Specific styles for Directions Page */
        .hero-bg {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), 
                        url('https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=1500&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            height: 400px;
        }

        .glass-panel {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        /* Matches your Master Page's spacing */
        .overlap-container { 
            margin-top: -60px; 
            position: relative; 
            z-index: 10; 
            margin-bottom: 80px;
        }

        h1, h2, .display-font { font-family: 'Playfair Display', serif; }

        @media (max-width: 768px) {
            .hero-bg { height: 300px; background-attachment: scroll; }
            .overlap-container { margin-top: 20px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <section class="hero-bg d-flex align-items-center justify-content-center text-center text-white">
        <div class="glass-panel p-4 p-md-5 rounded-4 shadow-lg animate__animated animate__fadeInDown">
            <span class="badge rounded-pill bg-primary mb-2 px-3 py-2 text-uppercase tracking-widest">Welcome to Hajipur</span>
            <h1 class="display-4 fw-bold text-white">Mahesham Lodge</h1>
            <p class="lead text-uppercase fw-light">Your Comfort, Our Priority</p>
        </div>
    </section>

    <div class="container overlap-container">
        <div class="row g-4">
            
            <div class="col-lg-5">
                <div class="card border-0 shadow p-4 p-md-5 h-100">
                    <h2 class="mb-4 text-dark border-bottom pb-2">Plan Your Arrival</h2>
                    
                    <div class="mb-4">
                        <h5 class="text-primary d-flex align-items-center gap-2">
                            <i class="fas fa-train text-primary"></i> By Train
                        </h5>
                        <p class="text-muted small">We are <strong>2 km</strong> from <strong>Hajipur Junction</strong>. E-rickshaws are available 24/7. Ask for "Mahesham Lodge" near Civil Court.</p>
                    </div>

                    <div class="mb-4">
                        <h5 class="text-primary d-flex align-items-center gap-2">
                            <i class="fas fa-plane text-primary"></i> By Air
                        </h5>
                        <p class="text-muted small">Patna Airport is <strong>22 km</strong> away. Drive over the Ganges via Mahatma Gandhi Setu.</p>
                    </div>

                    <div class="mb-4">
                        <h5 class="text-primary d-flex align-items-center gap-2">
                            <i class="fas fa-car text-primary"></i> By Road
                        </h5>
                        <p class="text-muted small">Near NH-19 and NH-77 junction. We offer <strong>secure parking</strong> for all guests.</p>
                    </div>

                    <hr class="my-4">
                    
                    <div class="text-center text-md-start">
                        <p class="small text-secondary mb-3">Need assistance?</p>
                        <a class="btn btn-primary rounded-pill px-4 py-2">
                            <i class="fas fa-phone-alt me-2"></i> Call Support +91 9555580458
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-7">
                <div class="card border-0 shadow h-100 overflow-hidden" style="min-height: 450px;">
                    <iframe 
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3594.321746627!2d85.2014136!3d25.693796!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ed594458539077%3A0x633d7b9365c09e3a!2sMahesham%20Lodge!5e0!3m2!1sen!2sin!4v1700000000000" 
                        class="w-100 h-100 border-0" 
                        allowfullscreen="" 
                        loading="lazy">
                    </iframe>
                </div>
            </div>

        </div>
    </div>
</asp:Content>