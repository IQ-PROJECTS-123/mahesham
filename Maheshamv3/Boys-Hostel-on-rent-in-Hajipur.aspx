<%@ Page Title="Boys Hostel & Lodge in Hajipur | Mahesham" Language="C#" MasterPageFile="~/Gen.Master" AutoEventWireup="true" CodeBehind="Boys-Hostel-on-rent-in-Hajipur.aspx.cs" Inherits="Maheshamv3.Boys_Hostel_on_rent_in_Hajipur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        /* Smooth Rendering Optimization */
        [data-aos] {
            will-change: transform, opacity;
        }

        .hero-banner {
            background: linear-gradient(rgba(13, 110, 253, 0.75), rgba(33, 37, 41, 0.85)), 
                        url('https://images.unsplash.com/photo-1555854877-bab0e564b8d5?auto=format&fit=crop&w=1920&q=80');
            background-size: cover; background-position: center; min-height: 70vh;
        }

        .room-image { height: 260px; object-fit: cover; transition: transform 0.6s cubic-bezier(0.165, 0.84, 0.44, 1); }
        .card:hover .room-image { transform: scale(1.08); }

        .accordion-button:not(.collapsed) { background-color: #f8f9fa; color: #0d6efd; box-shadow: none; }
        
        .whatsapp-float {
            position: fixed; width: 60px; height: 60px; bottom: 40px; right: 40px;
            background-color: #25d366; color: #FFF; border-radius: 50px;
            text-align: center; font-size: 30px; box-shadow: 0 10px 25px rgba(0,0,0,0.2); z-index: 100;
            transition: all 0.3s ease;
        }
        .whatsapp-float:hover { transform: scale(1.1) rotate(10deg); color: white; }
        
        .feature-icon-circle {
            width: 80px; height: 80px; display: flex; align-items: center; justify-content: center;
            margin: 0 auto 20px; border-radius: 50%; background: #eef5ff; color: #0d6efd;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="overflow-hidden bg-white">
        
        <section class="hero-banner d-flex align-items-center text-white text-center">
            <div class="container" data-aos="zoom-out" data-aos-duration="1500">
                <div class="row justify-content-center">
                    <div class="col-lg-9">
                        <span class="badge bg-primary mb-3 px-3 py-2 text-uppercase fw-bold shadow-sm">Mahesham Lodge</span>
                        <h1 class="display-3 fw-bold mb-3">Best Lodge in Hajipur, Bihar</h1>
                        <p class="fs-4 mb-5 opacity-75">For Students, Job Seekers & Working Professionals</p>
                        <div class="d-flex justify-content-center gap-3">
                            <a href="#gallery" class="btn btn-primary btn-lg px-4 py-3 shadow-lg fw-bold">Explore Rooms</a>
                            <a href="ConnectWithUs1.aspx" class="btn btn-outline-light btn-lg px-4 py-3 fw-bold border-2">Book Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5">
            <div class="container py-5">
                <div class="row align-items-center g-5">
                    <div class="col-lg-6" data-aos="fade-right" data-aos-duration="1200">
                        <h2 class="text-primary fw-bold display-6 mb-4">Smart Living for Your Career Goals</h2>
                        <p class="text-secondary fs-5 mb-4">Finding the right place to stay can directly affect your focus. We provide an environment designed for success, connectivity, and peace of mind.</p>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <div class="p-3 border-start border-primary border-4 rounded shadow-sm bg-light h-100">
                                    <h5 class="fw-bold mb-1"><i class="bi bi-mortarboard-fill text-primary me-2"></i>Ideal for Aspirants</h5>
                                    <p class="small text-muted mb-0">Peaceful environment for exams.</p>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="p-3 border-start border-danger border-4 rounded shadow-sm bg-light h-100">
                                    <h5 class="fw-bold mb-1"><i class="bi bi-geo-alt-fill text-danger me-2"></i>Location Plus</h5>
                                    <p class="small text-muted mb-0">Near Hajipur Junction station.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6" data-aos="fade-left" data-aos-duration="1200">
                        <img src="https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&w=800&q=80" class="img-fluid rounded-4 shadow-lg" alt="Lodge Hajipur">
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-light">
            <div class="container py-5 text-center">
                <h2 class="fw-bold mb-5 display-6" data-aos="fade-up">Why Choose Mahesham Lodge?</h2>
                <div class="row g-4">
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                        <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                            <div class="feature-icon-circle"><i class="bi bi-book fs-2"></i></div>
                            <h3 class="h4 fw-bold">Study Environment</h3>
                            <p class="text-muted small">Quiet zones designed for maximum concentration and academic success.</p>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                        <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                            <div class="feature-icon-circle"><i class="bi bi-shield-check fs-2"></i></div>
                            <h3 class="h4 fw-bold">Safe & Secure</h3>
                            <p class="text-muted small">Controlled entry and warden-supervised premises for total peace of mind.</p>
                        </div>
                    </div>
                    <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                        <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                            <div class="feature-icon-circle"><i class="bi bi-wallet2 fs-2"></i></div>
                            <h3 class="h4 fw-bold">Budget Friendly</h3>
                            <p class="text-muted small">Lower monthly rent and flexible durations compared to the best hotels.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="gallery" class="py-5">
            <div class="container py-5">
                <div class="text-center mb-5" data-aos="fade-down" data-aos-duration="1000">
                    <h2 class="fw-bold display-6">Comfortable Rooms in Hajipur</h2>
                    <p class="text-muted fs-5">Flexible accommodation options to match your lifestyle</p>
                </div>
                <div class="row g-4 justify-content-center">
                    <div class="col-md-5" data-aos="fade-right" data-aos-duration="1200">
                        <div class="card border-0 shadow-lg h-100 overflow-hidden rounded-4">
                            <img src="https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?auto=format&fit=crop&w=800&q=80" class="room-image" alt="Private Room">
                            <div class="card-body p-4">
                                <h4 class="fw-bold text-primary mb-3">Private Rooms</h4>
                                <p class="text-muted small mb-4">Perfect for working professionals who value privacy and a personal workspace.</p>
                                <ul class="list-unstyled mb-4">
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i> Personal Study Table</li>
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i> Private Wardrobe</li>
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i> Premium Bedding</li>
                                </ul>
                                <a href="ConnectWithUs1.aspx" class="btn btn-primary w-100 py-3 rounded-pill fw-bold shadow-sm">Enquire Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5" data-aos="fade-left" data-aos-duration="1200">
                        <div class="card border-0 shadow-lg h-100 overflow-hidden rounded-4">
                            <img src="https://images.unsplash.com/photo-1544124499-58912cbddaad?auto=format&fit=crop&w=800&q=80" class="room-image" alt="Shared Room">
                            <div class="card-body p-4">
                                <h4 class="fw-bold text-primary mb-3">Shared Rooms</h4>
                                <p class="text-muted small mb-4">The most affordable choice for students looking to manage costs effectively.</p>
                                <ul class="list-unstyled mb-4">
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i> Dual Occupancy</li>
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i> Separate Lockers</li>
                                    <li class="mb-2"><i class="bi bi-check-circle-fill text-success me-2"></i> High-Speed WiFi</li>
                                </ul>
                                <a href="ConnectWithUs1.aspx" class="btn btn-primary w-100 py-3 rounded-pill fw-bold shadow-sm">Enquire Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-light">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8" data-aos="fade-up" data-aos-duration="1000">
                        <h2 class="text-center fw-bold mb-5 display-6">Frequently Asked Questions</h2>
                        <div class="accordion accordion-flush shadow rounded-4 overflow-hidden border" id="faqAccordion">
                            
                            <div class="accordion-item border-bottom">
                                <h2 class="accordion-header">
                                    <button class="accordion-button fw-bold py-3" type="button" data-bs-toggle="collapse" data-bs-target="#q1">
                                        1. Is a lodge suitable for long-term stay in Hajipur?
                                    </button>
                                </h2>
                                <div id="q1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body text-secondary lh-lg">
                                        Yes. Lodges are designed for both short and long-term stays, making them ideal for students, job seekers, and professionals.
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item border-bottom">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed fw-bold py-3" type="button" data-bs-toggle="collapse" data-bs-target="#q2">
                                        2. Are private rooms available?
                                    </button>
                                </h2>
                                <div id="q2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body text-secondary lh-lg">
                                        Most lodges, including Mahesham, offer both shared and private rooms in Hajipur, depending on your personal preference and budget.
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item border-bottom">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed fw-bold py-3" type="button" data-bs-toggle="collapse" data-bs-target="#q3">
                                        3. How is a lodge different from a hotel?
                                    </button>
                                </h2>
                                <div id="q3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body text-secondary lh-lg">
                                        Hotels focus on luxury and short stays, while lodges focus on affordability, safety, and daily living needs.
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item border-bottom">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed fw-bold py-3" type="button" data-bs-toggle="collapse" data-bs-target="#q4">
                                        4. Is staying near the railway station beneficial?
                                    </button>
                                </h2>
                                <div id="q4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body text-secondary lh-lg">
                                        Yes. Staying near the Hajipur railway station improves connectivity and saves travel time.
                                    </div>
                                </div>
                            </div>

                            <div class="accordion-item">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed fw-bold py-3" type="button" data-bs-toggle="collapse" data-bs-target="#q5">
                                        5. Is food a problem if the lodge doesn’t provide it?
                                    </button>
                                </h2>
                                <div id="q5" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                    <div class="accordion-body text-secondary lh-lg">
                                        Not really. Nearby mess services, tiffin providers, and restaurants usually cover daily food needs easily.
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 bg-primary text-white text-center">
            <div class="container py-5" data-aos="zoom-in" data-aos-duration="1200">
                <h2 class="display-5 fw-bold mb-3">Focus on Your Future Today</h2>
                <p class="mb-4 fs-5 opacity-90">Secure, Affordable, and Comfortable Rooms in Hajipur.</p>
                <a href="ConnectWithUs1.aspx" class="btn btn-outline-light btn-lg px-5 py-3 rounded-pill fw-bold shadow">Book Your Room Now</a>
            </div>
        </section>

        <a href="https://wa.me/91XXXXXXXXXX" class="whatsapp-float d-flex align-items-center justify-content-center" target="_blank">
            <i class="bi bi-whatsapp"></i>
        </a>

    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            easing: 'ease-out-quart',
            once: true,
            anchorPlacement: 'top-bottom'
        });
    </script>
</asp:Content>