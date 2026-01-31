<%@ Page Title="Best Lodge & Rooms in Hajipur | Secure Living" Language="C#" MasterPageFile="~/Gen.Master" AutoEventWireup="true" CodeBehind="secure-room-on-rent-in-Hajipur.aspx.cs" Inherits="Maheshamv3.secure_room_on_rent_in_Hajipur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        body { font-family: 'Inter', sans-serif; }
        
        /* Modern Hero with Overlay */
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), 
                        url('https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            min-height: 80vh;
            display: flex;
            align-items: center;
        }

        /* Hover Effects for Cards */
        .hover-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
        }
        .hover-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 1rem 3rem rgba(0,0,0,.175)!important;
        }

        /* FAQ Accordion Styling (Modern Clean) */
        .accordion-button:not(.collapsed) {
            background-color: #e8f5e9;
            color: #2e7d32;
        }
        .accordion-button:focus {
            box-shadow: none;
            border-color: rgba(0,0,0,.125);
        }

        /* Custom Icon Colors */
        .text-success-custom { color: #27ae60; }
        .bg-success-gradient { background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-wrapper">
        
        <section class="hero-section text-white">
            <div class="container text-center">
                <div class="row justify-content-center">
                    <div class="col-lg-9">
                        <span class="badge bg-success mb-3 px-3 py-2">Premium Student Housing</span>
                        <h1 class="display-3 fw-bold mb-4">Best Lodge in Hajipur for <span class="text-success">Success-Driven</span> Minds</h1>
                        <p class="lead mb-5 opacity-90">Affordable, secure, and peaceful rooms in Hajipur designed for students and professionals who need a quiet environment to focus on their goals.</p>
                        <div class="d-grid d-sm-flex justify-content-center gap-3">
                            <a href="#rooms" class="btn btn-success bg-success-gradient btn-lg px-5 py-3 fw-bold shadow">View Rooms</a>
                            <a href="ConnectWithUs1.aspx" class="btn btn-outline-light btn-lg px-5 py-3 fw-bold">Reserve Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-light">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <h2 class="fw-bold h1">Safe and Secure Living</h2>
                    <p class="text-muted mx-auto" style="max-width: 700px;">Safety is non-negotiable. We provide a disciplined environment that prioritizes security and academic focus.</p>
                </div>
                
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card h-100 p-4 text-center hover-card shadow-sm">
                            <div class="display-5 text-success-custom mb-3"><i class="bi bi-shield-check"></i></div>
                            <h3 class="h5 fw-bold">Peaceful Environment</h3>
                            <p class="text-muted mb-0">Stay focused with zero distractions, perfect for competitive exam preparation.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100 p-4 text-center hover-card shadow-sm">
                            <div class="display-5 text-success-custom mb-3"><i class="bi bi-wallet2"></i></div>
                            <h3 class="h5 fw-bold">Affordable Pricing</h3>
                            <p class="text-muted mb-0">Premium comfort without the heavy price tag of traditional hotels.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100 p-4 text-center hover-card shadow-sm">
                            <div class="display-5 text-success-custom mb-3"><i class="bi bi-geo-alt"></i></div>
                            <h3 class="h5 fw-bold">Prime Location</h3>
                            <p class="text-muted mb-0">Walking distance to the railway station, markets, and top coaching centers.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5" id="rooms">
            <div class="container py-5">
                <h2 class="fw-bold h1 text-center mb-5">Room Accommodations</h2>
                <div class="row g-4 justify-content-center">
                    <div class="col-md-5">
                        <div class="card overflow-hidden hover-card shadow-sm h-100">
                            <img src="https://images.unsplash.com/photo-1513694203232-719a280e022f?auto=format&fit=crop&w=800&q=80" class="card-img-top" style="height: 300px; object-fit: cover;" alt="Private Room">
                            <div class="card-body p-4">
                                <h3 class="fw-bold">Private Rooms</h3>
                                <p class="text-muted">Perfect for working professionals or senior students who value maximum privacy and silence.</p>
                                <hr class="my-4 opacity-10">
                                <a href="ConnectWithUs1.aspx" class="btn btn-success w-100 py-2">Check Availability</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="card overflow-hidden hover-card shadow-sm h-100">
                            <img src="https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=800&q=80" class="card-img-top" style="height: 300px; object-fit: cover;" alt="Shared Room">
                            <div class="card-body p-4">
                                <h3 class="fw-bold">Shared Rooms</h3>
                                <p class="text-muted">A collaborative and budget-friendly option for students and aspirants traveling together.</p>
                                <hr class="my-4 opacity-10">
                                <a href="ConnectWithUs1.aspx" class="btn btn-success w-100 py-2">Check Availability</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-white">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="text-center mb-5">
                            <h2 class="fw-bold">Connectivity & Advantage</h2>
                            <p class="text-muted">Why choose our lodge over expensive hotels? Location and value.</p>
                        </div>
                        
                        <div class="accordion shadow-sm" id="faqAccordion">
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button fw-600" type="button" data-bs-toggle="collapse" data-bs-target="#f1">
                                        Is a lodge suitable for long-term stay in Hajipur?
                                    </button>
                                </h2>
                                <div id="f1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body text-muted">
                                        Absolutely. Our facilities are optimized for long-term stays, providing the stability students need for academic success.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed fw-600" type="button" data-bs-toggle="collapse" data-bs-target="#f2">
                                        How is a lodge different from a hotel?
                                    </button>
                                </h2>
                                <div id="f2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body text-muted">
                                        While hotels focus on luxury and short-term visits, lodges provide essential living amenities, security, and a quiet environment tailored for daily living.
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed fw-600" type="button" data-bs-toggle="collapse" data-bs-target="#f3">
                                        Is staying near the railway station beneficial?
                                    </button>
                                </h2>
                                <div id="f3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body text-muted">
                                        Yes. It drastically reduces commute times and provides immediate access to major transport hubs for outstation students.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>
</asp:Content>