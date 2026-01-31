<%@ Page Title="Premium Stay Hajipur | The Elite Choice" Language="C#" MasterPageFile="~/Gen.Master" AutoEventWireup="true" CodeBehind="Best-Stay-In-Hajipur.aspx.cs" Inherits="Maheshamv3.testpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <style>
        :root {
            --gold: #d4af37;
            --dark-bg: #0a0a0a;
        }

        body { font-family: 'Poppins', sans-serif; background-color: var(--dark-bg); color: #fff; }
        .playfair { font-family: 'Playfair Display', serif; }
        
        /* Smooth Scroll Optimization */
        [data-aos] { will-change: transform, opacity; }

        /* Hero Styling */
        .hero-premium {
            min-height: 90vh;
            background: linear-gradient(to right, rgba(0,0,0,0.9), rgba(0,0,0,0.4)), 
                        url('https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260');
            background-size: cover; background-position: center;
        }

        .text-gold { color: var(--gold); }
        .btn-gold { 
            background: var(--gold); color: #000; font-weight: 700; border-radius: 0; 
            padding: 15px 40px; transition: all 0.5s cubic-bezier(0.19, 1, 0.22, 1); 
        }
        .btn-gold:hover { background: #fff; letter-spacing: 2px; transform: translateY(-3px); }

        /* Room Image Hover */
        .room-img-container { overflow: hidden; height: 100%; }
        .room-img { transition: transform 1.2s cubic-bezier(0.19, 1, 0.22, 1); object-fit: cover; height: 100%; min-height: 400px; }
        .room-card:hover .room-img { transform: scale(1.1); }

        /* Custom Accordion Styling for Dark Theme */
        .accordion-item { background-color: #161616; border: 1px solid #222; margin-bottom: 10px; }
        .accordion-button { background-color: #161616; color: #fff; font-weight: 600; padding: 25px; }
        .accordion-button:not(.collapsed) { background-color: #1a1a1a; color: var(--gold); box-shadow: none; }
        .accordion-button::after { filter: invert(1); }
        .accordion-body { background-color: #0d0d0d; color: #a0a0a0; line-height: 1.8; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="overflow-hidden">
        
        <section class="hero-premium d-flex align-items-center">
            <div class="container" data-aos="fade-up" data-aos-duration="1500">
                <div class="row">
                    <div class="col-lg-7">
                        <h1 class="display-1 playfair text-gold mb-3">Hajipur’s <span class="text-white">Elite</span> <br/>Living Space</h1>
                        <p class="fs-5 text-secondary border-start border-3 border-warning ps-4 mb-5">
                            Redefining budget accommodation. A sanctuary of peace designed for high-achieving students and focused professionals.
                        </p>
                        <a href="#rooms" class="btn btn-gold text-uppercase shadow-lg">View The Collection</a>
                    </div>
                </div>
            </div>
        </section>

        <div class="container position-relative" style="margin-top: -60px; z-index: 10;">
            <div class="row g-0 shadow-lg text-center">
                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="bg-dark p-5 border-end border-secondary border-opacity-25 h-100">
                        <i class="bi bi-lightning-charge fs-1 text-gold mb-3"></i>
                        <h3 class="h5 text-uppercase tracking-widest">Instant Connect</h3>
                        <p class="small text-secondary mb-0">100m from Railway & NH</p>
                    </div>
                </div>
                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="bg-dark p-5 border-end border-secondary border-opacity-25 h-100">
                        <i class="bi bi-shield-lock fs-1 text-gold mb-3"></i>
                        <h3 class="h5 text-uppercase tracking-widest">Secure Vault</h3>
                        <p class="small text-secondary mb-0">24/7 CCTV & Controlled Access</p>
                    </div>
                </div>
                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
                    <div class="bg-dark p-5 h-100">
                        <i class="bi bi-moon-stars fs-1 text-gold mb-3"></i>
                        <h3 class="h5 text-uppercase tracking-widest">Quiet Zone</h3>
                        <p class="small text-secondary mb-0">Zero-Distraction Environment</p>
                    </div>
                </div>
            </div>
        </div>

        <section class="py-5 my-5">
            <div class="container py-5">
                <div class="row align-items-center g-5">
                    <div class="col-lg-6" data-aos="fade-right" data-aos-duration="1200">
                        <h2 class="playfair display-5 text-white mb-4">The Smart Alternative <br/><span class="text-gold">to Hotels</span></h2>
                        <p class="lead text-secondary">Why pay for overpriced luxury when you need practical focus? Our lodge is the bridge between affordability and high-standard living.</p>
                        <p class="text-secondary opacity-75">Tailored for competitive exam students and job seekers, we provide a disciplined environment that hotels simply cannot offer.</p>
                    </div>
                    <div class="col-lg-6" data-aos="zoom-in" data-aos-duration="1200">
                        <div class="p-5 border border-warning border-opacity-25 bg-white bg-opacity-10 backdrop-blur">
                            <h4 class="text-gold mb-3">Location Advantage</h4>
                            <p class="text-secondary small mb-0">Staying near the Hajipur Railway Station area improves connectivity and saves precious travel time for interviews and coaching schedules. Our rooms put you exactly where you need to be.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section id="rooms" class="py-5 bg-black">
            <div class="container py-5">
                <h2 class="playfair text-center display-4 mb-5" data-aos="fade-down">Accommodations</h2>
                
                <div class="row g-0 mb-5 room-card bg-dark overflow-hidden" data-aos="fade-up" data-aos-duration="1200">
                    <div class="col-lg-6 room-img-container">
                        <img src="https://images.pexels.com/photos/1743231/pexels-photo-1743231.jpeg?auto=compress&cs=tinysrgb&w=800" class="w-100 room-img" alt="Executive Single">
                    </div>
                    <div class="col-lg-6 p-5 d-flex flex-column justify-content-center">
                        <h3 class="playfair display-6 mb-4">Executive Single</h3>
                        <ul class="list-unstyled mb-5">
                            <li class="py-2 border-bottom border-secondary border-opacity-25 text-secondary"><i class="bi bi-check2-circle text-gold me-3"></i>Private High-Focus Zone</li>
                            <li class="py-2 border-bottom border-secondary border-opacity-25 text-secondary"><i class="bi bi-check2-circle text-gold me-3"></i>Personal Wardrobe & Desk</li>
                            <li class="py-2 border-bottom border-secondary border-opacity-25 text-secondary"><i class="bi bi-check2-circle text-gold me-3"></i>Attached Balcony Access</li>
                        </ul>
                        <asp:Button ID="btnSingle" runat="server" Text="Request Selection" CssClass="btn btn-gold align-self-start" />
                    </div>
                </div>

                <div class="row g-0 room-card bg-dark overflow-hidden flex-row-reverse" data-aos="fade-up" data-aos-duration="1200">
                    <div class="col-lg-6 room-img-container">
                        <img src="https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?auto=compress&cs=tinysrgb&w=800" class="w-100 room-img" alt="Premium Sharing">
                    </div>
                    <div class="col-lg-6 p-5 d-flex flex-column justify-content-center text-lg-end">
                        <h3 class="playfair display-6 mb-4">Premium Sharing</h3>
                        <ul class="list-unstyled mb-5">
                            <li class="py-2 border-bottom border-secondary border-opacity-25 text-secondary">Dual Occupancy Space <i class="bi bi-check2-circle text-gold ms-3"></i></li>
                            <li class="py-2 border-bottom border-secondary border-opacity-25 text-secondary">High Ventilation Layout <i class="bi bi-check2-circle text-gold ms-3"></i></li>
                            <li class="py-2 border-bottom border-secondary border-opacity-25 text-secondary">Full CCTV Coverage <i class="bi bi-check2-circle text-gold ms-3"></i></li>
                        </ul>
                        <asp:Button ID="btnDouble" runat="server" Text="Request Selection" CssClass="btn btn-gold align-self-lg-end" />
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5">
            <div class="container py-5">
                <h2 class="playfair text-center mb-5" data-aos="fade-up">The Essential Guide</h2>
                <div class="row justify-content-center">
                    <div class="col-lg-8" data-aos="fade-up" data-aos-duration="1200">
                        <div class="accordion" id="faqElite">
                            <div class="accordion-item">
                                <h2 class="accordion-header"><button class="accordion-button" data-bs-toggle="collapse" data-bs-target="#f1">Is a lodge suitable for long-term stay?</button></h2>
                                <div id="f1" class="accordion-collapse collapse show" data-bs-parent="#faqElite">
                                    <div class="accordion-body">Yes. Unlike hotels, our lodge is designed for routine living, offering lower monthly rents and essential facilities.</div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header"><button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#f2">Are private rooms available?</button></h2>
                                <div id="f2" class="accordion-collapse collapse" data-bs-parent="#faqElite">
                                    <div class="accordion-body">We offer both "Executive Single" for professionals and "Premium Sharing" for students.</div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header"><button class="accordion-button collapsed" data-bs-toggle="collapse" data-bs-target="#f3">How is this different from a hotel?</button></h2>
                                <div id="f3" class="accordion-collapse collapse" data-bs-parent="#faqElite">
                                    <div class="accordion-body">Hotels charge daily. We provide a focused, safe community for long-term achievers at a fraction of the cost.</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="py-5 text-center" style="background: var(--gold);" data-aos="zoom-in">
            <div class="container py-4">
                <h2 class="display-4 fw-bold text-dark mb-3">READY TO START?</h2>
                <p class="text-dark fs-5 mb-4">Secure your space in Hajipur's most trusted lodge.</p>
                <a href="ConnectWithUs1.aspx" class="btn btn-dark btn-lg rounded-0 px-5 py-3 fw-bold">CONNECT WITH US</a>
            </div>
        </section>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        AOS.init({
            duration: 1000,
            easing: 'ease-out-quint', // Ultra-smooth curve
            once: true,
            mirror: false
        });
    </script>
</asp:Content>