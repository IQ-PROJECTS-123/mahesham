<%@ Page Title="Best Lodge & Rooms in Hajipur | Students & Professionals" Language="C#" MasterPageFile="~/Gen.Master" AutoEventWireup="true" CodeBehind="Lodge-in-hajipur.aspx.cs" Inherits="Maheshamv3.Lodge_in_hajipur" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --lp-primary: #ff4757;
            --lp-secondary: #2f3542;
            --lp-accent: #ffa502;
            --lp-bg: #f4f7f6;
        }

        body { font-family: 'Outfit', sans-serif; background-color: var(--lp-bg); }

        /* Custom Hero Styling */
        .hero-v3 {
            height: 75vh;
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1');
            background-size: cover;
            background-position: center;
            border-radius: 0 0 50px 50px;
        }

        .btn-primary-custom { background-color: var(--lp-primary); border-color: var(--lp-primary); color: white; }
        .btn-primary-custom:hover { background-color: #e04040; color: white; transform: translateY(-3px); }
        
        /* FAQ Styling (Keeping the detail/summary look) */
        details summary { list-style: none; }
        details summary::-webkit-details-marker { display: none; }
        details[open] { border-color: var(--lp-primary) !important; }
        
        .border-left-brand { border-left: 5px solid var(--lp-primary); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="pg-landing-wrapper">
        
        <section class="hero-v3 d-flex align-items-center justify-content-center text-center text-white mb-5">
            <div class="container">
                <span class="badge rounded-pill px-3 py-2 mb-3" style="background: rgba(255,255,255,0.2);">Best Rated Accommodation</span>
                <h1 class="display-3 fw-bold mb-3">Find Your Home Away <br/> From Home in Hajipur</h1>
                <p class="lead mb-4 opacity-75">Strategic locations, high-speed security, and a peaceful environment <br class="d-none d-md-block"> tailored for Bihar's brightest students and professionals.</p>
                <div class="d-flex justify-content-center gap-3">
                    <a href="#rooms" class="btn btn-primary-custom btn-lg px-4 rounded-3 shadow">Explore Rooms</a>
                    <a href="ConnectWithUs1.aspx" class="btn btn-outline-light btn-lg px-4 rounded-3">Contact Host</a>
                </div>
            </div>
        </section>

        <section class="py-5">
            <div class="container">
                <div class="row align-items-center g-5">
                    <div class="col-lg-7">
                        <h2 class="fw-bold mb-4 ps-3 border-left-brand">Top Rated Lodge in Hajipur, Bihar</h2>
                        <p class="text-muted lh-lg">Finding the right place to stay can directly affect your focus, safety, and daily routine. Whether you are a student preparing for competitive exams or a professional on a mission, our lodge offers the perfect blend of <strong>affordability and comfort</strong>.</p>
                        <p class="text-muted lh-lg">Unlike overpriced hotels, we provide a <strong>peaceful environment</strong> specifically designed for long-term stays. Our strategic location near the Hajipur Railway Station ensures you never miss a commute.</p>
                    </div>
                    <div class="col-lg-5">
                        <div class="card bg-dark text-white p-4 border-0 rounded-4 shadow-lg">
                            <h4 style="color: var(--lp-accent);">Quick Benefits</h4>
                            <ul class="list-unstyled mt-3 lh-lg">
                                <li><i class="fas fa-check-circle me-2 text-success"></i> 24/7 Power Backup</li>
                                <li><i class="fas fa-check-circle me-2 text-success"></i> Filtered Drinking Water</li>
                                <li><i class="fas fa-check-circle me-2 text-success"></i> High-Speed Connectivity</li>
                                <li><i class="fas fa-check-circle me-2 text-success"></i> Walking distance to NH</li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="row g-4 mt-5">
                    <div class="col-md-4">
                        <div class="card h-100 p-4 border-0 shadow-sm rounded-4 text-center">
                            <i class="fas fa-user-shield fa-3x mb-3" style="color: var(--lp-primary);"></i>
                            <h4 class="fw-bold">Safe & Secure</h4>
                            <p class="text-muted">CCTV surveillance and verified entry for total peace of mind.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100 p-4 border-0 shadow-sm rounded-4 text-center">
                            <i class="fas fa-map-marked-alt fa-3x mb-3" style="color: var(--lp-primary);"></i>
                            <h4 class="fw-bold">Prime Location</h4>
                            <p class="text-muted">Located near coaching hubs, hospitals, and the railway station.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card h-100 p-4 border-0 shadow-sm rounded-4 text-center">
                            <i class="fas fa-wallet fa-3x mb-3" style="color: var(--lp-primary);"></i>
                            <h4 class="fw-bold">Student Friendly</h4>
                            <p class="text-muted">Flexible monthly rentals that don't burn a hole in your pocket.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-light" id="rooms">
            <div class="container">
                <h2 class="text-center fw-bold mb-5">Our Accommodations</h2>
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm rounded-5 overflow-hidden">
                            <img src="https://images.pexels.com/photos/1743231/pexels-photo-1743231.jpeg?auto=compress&cs=tinysrgb&w=800" class="card-img-top" style="height: 300px; object-fit: cover;" alt="Single Room">
                            <div class="card-body p-4">
                                <span class="badge bg-danger bg-opacity-10 text-danger mb-2">Most Popular</span>
                                <h3 class="fw-bold">Single Premium Room</h3>
                                <p class="text-muted">Enjoy total privacy with a dedicated study area, private balcony, and high-speed ventilation.</p>
                                <a href="ConnectWithUs1.aspx" class="btn btn-primary-custom w-100 py-3 rounded-3 mt-2">Check Availability</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card border-0 shadow-sm rounded-5 overflow-hidden">
                            <img src="https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&w=800" class="card-img-top" style="height: 300px; object-fit: cover;" alt="Double Room">
                            <div class="card-body p-4">
                                <span class="badge bg-info bg-opacity-10 text-info mb-2">Economical</span>
                                <h3 class="fw-bold">Double Sharing Room</h3>
                                <p class="text-muted">Spacious shared living with individual storage and regular housekeeping services.</p>
                                <a href="ConnectWithUs1.aspx" class="btn btn-primary-custom w-100 py-3 rounded-3 mt-2">Check Availability</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5">
            <div class="container">
                <h2 class="text-center fw-bold mb-5">Frequently Asked Questions</h2>
                <div class="mx-auto" style="max-width: 800px;">
                    
                    <details class="mb-3 border rounded-3 bg-white p-2">
                        <summary class="p-3 fw-bold d-flex justify-content-between align-items-center cursor-pointer">
                            Is a lodge suitable for long-term stay in Hajipur?
                            <i class="fas fa-plus text-primary small"></i>
                        </summary>
                        <div class="p-3 pt-0 text-muted border-top mt-2">
                            Yes. Lodges are specifically designed for long-term stays, making them far more practical than hotels for students and working professionals.
                        </div>
                    </details>

                    <details class="mb-3 border rounded-3 bg-white p-2">
                        <summary class="p-3 fw-bold d-flex justify-content-between align-items-center">
                            Are private rooms available?
                            <i class="fas fa-plus text-primary small"></i>
                        </summary>
                        <div class="p-3 pt-0 text-muted border-top mt-2">
                            We offer both single private rooms for maximum focus and double-sharing rooms for those looking for a budget-friendly option.
                        </div>
                    </details>

                </div>
            </div>
        </section>
    </div>
</asp:Content>