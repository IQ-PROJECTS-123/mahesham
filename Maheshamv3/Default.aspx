<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Maheshamv3.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Mahesham Lodge - Rooms on Rent - HAJIPUR </title>
    <style type="text/css">
        /* Carousel full screen */
        .header-carousel {
            width: 100%;
            height: 100vh; /* full viewport height */
            overflow: hidden;
        } 

            .header-carousel img {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

        .carousel-caption {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.55); /* dark overlay */
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .carousel-caption-content {
            max-width: 900px;
        }

        /* About section image fix */
        .about-section img {
            object-fit: cover;
        }

        /* Main content spacing */
        .main-content {
            position: relative;
            z-index: 10;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Carousel Banner Start -->
    <div class="header-carousel owl-carousel">
        <div class="header-carousel-item">
            <img src="img/Maheshamb1.jpeg" alt="Mahesham Banner">
            <div class="carousel-caption">
                <div class="carousel-caption-content p-3">
                    <h4 class="text-secondary text-uppercase sub-title fw-bold mb-4 wow fadeInUp" data-wow-delay="0.1s" style="letter-spacing: 3px;">Stay Smart, Stay Budget-Friendly
                    </h4>
                    <h1 class="display-1 text-white mb-4 wow fadeInUp" data-wow-delay="0.3s">Single Room on Rent in Hajipur with Kitchen Slab and Sink
                    </h1>
                    <p class="fs-5 text-white wow fadeInUp" data-wow-delay="0.5s">
                        आपका घर, आपकी सफलता का अड्डा। पढ़ाई का साथी, सपनों का साथी।<br />
                        शांति और सुकून का ठिकाना। प्रकृति की गोद में, सुकून की छांव।
                    </p>
                    <div class="pt-2">
                        <a class="btn btn-primary rounded-pill text-white py-3 px-5 m-2 wow fadeInLeft" data-wow-delay="0.7s" href="Contact.aspx">Book Now</a>
                        <a class="btn btn-secondary rounded-pill text-white py-3 px-5 m-2 wow fadeInRight" data-wow-delay="0.9s" href="About.aspx">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel Banner End -->

    <!-- Main Content Start -->
    <div class="main-content">

        <!-- Banner CTA Section -->
        <div class="container-fluid bg-secondary wow zoomInDown" data-wow-delay="0.1s">
            <div class="container">
                <div class="d-flex flex-column flex-lg-row align-items-center justify-content-center text-center p-5">
                    <h1 class="me-4 wow fadeInLeft" data-wow-delay="0.3s">
                        <span class="fw-normal">Join Mahesham Hostel Today!</span>
                    </h1>
                    <a href="tel:+919876543210" class="text-white fw-bold fs-2 wow fadeInRight" data-wow-delay="0.5s">
                        <i class="fa fa-phone me-1"></i>+91-9876543210
                    </a>
                </div>
            </div>
        </div>
        <!-- Banner CTA Section End -->

        <!-- About Section Start -->
        <div class="container-fluid py-5">
            <div id="about" class="container py-5">
                <div class="row g-5 align-items-center">

                    <!-- Left Image -->
                    <div class="col-lg-5 wow fadeInLeft" data-wow-delay="0.1s">
                        <div class="border bg-secondary rounded">
                            <img src="img/About_pic.jpg" class="img-fluid w-100 rounded" alt="Mahesham Hostel">
                        </div>
                    </div>

                    <!-- Right Text -->
                    <div class="col-lg-7 wow fadeInRight" data-wow-delay="0.3s">
                        <h4 class="text-secondary sub-title fw-bold">About Mahesham Hostel</h4>
                        <h1 class="display-3 mb-4">
                            <strong class="text-primary">Comfortable Stay</strong> for Students & Professionals
                        </h1>
                        <p>
                            At <strong>Mahesham Lodge Hostel</strong>, we believe that a comfortable stay creates the best learning environment.
                            Our hostel offers clean, spacious, and fully furnished rooms at affordable rent, designed especially for students and working professionals.
                            With 24/7 security, hygienic facilities, and a friendly atmosphere, you’ll feel right at home while staying close to your college or workplace.
                        </p>
                        <a class="btn btn-primary rounded-pill text-white py-3 px-5" href="Contact.aspx">Contact Us</a>
                        <a class="btn btn-primary rounded-pill text-white py-3 px-5" href="About.aspx">More Information..</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About Section End -->
        <!-- Rooms & Pricing Start -->
        <div class="container-fluid training py-5 bg-light">
            <div id="Room" class="container py-5">
                <div class="pb-5">
                    <div class="row g-4 align-items-end">
                        <div class="col-xl-8">
                            <h4 class="text-secondary sub-title fw-bold wow fadeInUp" data-wow-delay="0.1s">Rooms & Pricing
                            </h4>
                            <h1 class="display-2 mb-0 wow fadeInUp" data-wow-delay="0.3s">Comfortable & Affordable Stay
                            </h1>
                        </div>
                    </div>
                </div>
                <!-- Owl Carousel -->
                <div class="training-carousel owl-carousel pt-5" id="roomAccordion">
                    <!-- Single Room -->
                    <div class="training-item bg-white rounded wow fadeInLeft" data-wow-delay="0.1s">
                        <div class="training-img rounded-top position-relative">
                            <asp:Image ID="ImgSingleRoom" runat="server" ImageUrl="img/single.jpg"
                                AlternateText="Single Room" CssClass="img-fluid rounded-top w-100" />
                            <h1 class="fs-1 fw-bold bg-primary text-white d-inline-block rounded p-2 position-absolute"
                                style="top: 0; left: 0;">01</h1>
                        </div>
                        <div class="rounded-bottom border border-top-0 p-4">
                            <h4>Single Room</h4>
                            <p>Private space for one person.</p>
                            <button class="btn btn-primary rounded-pill text-white py-2 px-4 toggle-btn"
                                type="button" data-bs-toggle="collapse"
                                data-bs-target="#singleDetail" aria-expanded="false"
                                aria-controls="singleDetail">
                                Detail
                            </button>
                            <div id="singleDetail" class="accordion-collapse collapse mt-3"
                                data-bs-parent="#roomAccordion">
                                <div class="p-3 border rounded bg-light">
                                    <p>✅ WiFi, ✅ Kitchen, ✅ Laundry, ✅ Security</p>
                                    <p><strong>Rent:</strong> ₹6,000 – ₹8,000 / month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Double Room -->
                    <div class="training-item bg-white rounded wow fadeInUp" data-wow-delay="0.2s">
                        <div class="training-img rounded-top position-relative">
                            <asp:Image ID="ImgDoubleRoom" runat="server" ImageUrl="img/Double1.jpg"
                                AlternateText="Double Room" CssClass="img-fluid rounded-top w-100" />
                            <h1 class="fs-1 fw-bold bg-primary text-white d-inline-block rounded p-2 position-absolute"
                                style="top: 0; left: 0;">02</h1>
                        </div>
                        <div class="rounded-bottom border border-top-0 p-4">
                            <h4>Double Room</h4>
                            <p>Shared between two people.</p>
                            <button class="btn btn-primary rounded-pill text-white py-2 px-4 toggle-btn"
                                type="button" data-bs-toggle="collapse"
                                data-bs-target="#doubleDetail" aria-expanded="false"
                                aria-controls="doubleDetail">
                                Detail
                            </button>
                            <div id="doubleDetail" class="accordion-collapse collapse mt-3"
                                data-bs-parent="#roomAccordion">
                                <div class="p-3 border rounded bg-light">
                                    <p>✅ WiFi, ✅ Kitchen, ✅ Laundry, ✅ Security</p>
                                    <p><strong>Rent:</strong> ₹4,000 – ₹5,500 / month</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Shared Room -->
                    <div class="training-item bg-white rounded wow fadeInRight" data-wow-delay="0.3s">
                        <div class="training-img rounded-top position-relative">
                            <asp:Image ID="ImgSharedRoom" runat="server" ImageUrl="img/share.jpg"
                                AlternateText="Shared Room" CssClass="img-fluid rounded-top w-100" />
                            <h1 class="fs-1 fw-bold bg-primary text-white d-inline-block rounded p-2 position-absolute"
                                style="top: 0; left: 0;">03</h1>
                        </div>
                        <div class="rounded-bottom border border-top-0 p-4">
                            <h4>Shared Room</h4>
                            <p>Budget-friendly multiple bed option.</p>
                            <button class="btn btn-primary rounded-pill text-white py-2 px-4 toggle-btn"
                                type="button" data-bs-toggle="collapse"
                                data-bs-target="#sharedDetail" aria-expanded="false"
                                aria-controls="sharedDetail">
                                Detail
                            </button>
                            <div id="sharedDetail" class="accordion-collapse collapse mt-3"
                                data-bs-parent="#roomAccordion">
                                <div class="p-3 border rounded bg-light">
                                    <p>✅ WiFi, ✅ Kitchen, ✅ Laundry, ✅ Security</p>
                                    <p><strong>Rent:</strong> ₹2,500 – ₹3,500 / month</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-5">
                    <a href="Quality.aspx" style="background-color: #007bff; color: white; border: none; padding: 12px 30px; border-radius: 25px; font-weight: bold; font-size: 18px; cursor: pointer; transition: 0.3s;"
                        onmouseover="this.style.backgroundColor='#0056b3'"
                        onmouseout="this.style.backgroundColor='#007bff'">More Facility Info
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Rooms & Pricing End -->
    <hr />
    <div class="container-fluid py-5 bg-light" id="Gallery" style="background-color: #f8f9fa;">
    <div class="container py-5">
        <div class="text-center mb-5">
            <h1 class="display-4 wow fadeInUp" data-wow-delay="0.1s" style="margin-bottom: 0;">Mahesham Environment</h1>
            <p class="text-secondary wow fadeInUp" data-wow-delay="0.3s" style="color: #6c757d;">Some Picture Of Our <strong style="color:red"> MAHESHAM</strong></p>
        </div>

        <div class="row g-4">
            <div class="col-sm-6 col-md-4 col-lg-3 wow fadeInUp" data-wow-delay="0.1s">
                <div class="card border-0 shadow-sm overflow-hidden" style="position: relative; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="img/single.jpg" class="card-img-top" alt="Single Room" style="height: 250px; object-fit: cover; width: 100%;">
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s ease;" class="gallery-overlay">
                        <a href="img/single.jpg" style="color: #fff; text-decoration: none; font-size: 1.5rem;"><i class="fa fa-search"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-3 wow fadeInUp" data-wow-delay="0.2s">
                <div class="card border-0 shadow-sm overflow-hidden" style="position: relative; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="img/Double1.jpg" class="card-img-top" alt="Double Room" style="height: 250px; object-fit: cover; width: 100%;">
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s ease;" class="gallery-overlay">
                        <a href="img/Double1.jpg" style="color: #fff; text-decoration: none; font-size: 1.5rem;"><i class="fa fa-search"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-3 wow fadeInUp" data-wow-delay="0.3s">
                <div class="card border-0 shadow-sm overflow-hidden" style="position: relative; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="img/share.jpg" class="card-img-top" alt="Shared Room" style="height: 250px; object-fit: cover; width: 100%;">
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s ease;" class="gallery-overlay">
                        <a href="img/share.jpg" style="color: #fff; text-decoration: none; font-size: 1.5rem;"><i class="fa fa-search"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-3 wow fadeInUp" data-wow-delay="0.4s">
                <div class="card border-0 shadow-sm overflow-hidden" style="position: relative; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="https://images.stockcake.com/public/b/6/4/b6416eb4-1de8-411d-bb81-58965fb22e33_large/gothic-dining-hall-stockcake.jpg" class="card-img-top" alt="Dining Hall" style="height: 250px; object-fit: cover; width: 100%;">
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s ease;" class="gallery-overlay">
                        <a href="https://images.stockcake.com/public/b/6/4/b6416eb4-1de8-411d-bb81-58965fb22e33_large/gothic-dining-hall-stockcake.jpg" style="color: #fff; text-decoration: none; font-size: 1.5rem;"><i class="fa fa-search"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-3 wow fadeInUp" data-wow-delay="0.5s">
                <div class="card border-0 shadow-sm overflow-hidden" style="position: relative; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="https://images.stockcake.com/public/2/5/e/25ec5940-bdb9-47a0-a68b-cd3bc2d41951_large/study-chaos-captured-stockcake.jpg" class="card-img-top" alt="Study Area" style="height: 250px; object-fit: cover; width: 100%;">
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s ease;" class="gallery-overlay">
                        <a href="https://images.stockcake.com/public/2/5/e/25ec5940-bdb9-47a0-a68b-cd3bc2d41951_large/study-chaos-captured-stockcake.jpg" style="color: #fff; text-decoration: none; font-size: 1.5rem;"><i class="fa fa-search"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-3 wow fadeInUp" data-wow-delay="0.6s">
                <div class="card border-0 shadow-sm overflow-hidden" style="position: relative; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="https://images.pexels.com/photos/440155/pexels-photo-440155.jpeg" class="card-img-top" alt="Hostel Building" style="height: 250px; object-fit: cover; width: 100%;">
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s ease;" class="gallery-overlay">
                        <a href="https://images.pexels.com/photos/440155/pexels-photo-440155.jpeg" style="color: #fff; text-decoration: none; font-size: 1.5rem;"><i class="fa fa-search"></i></a>
                    </div>
                </div>
            </div>

            <div class="col-sm-6 col-md-4 col-lg-3 wow fadeInUp" data-wow-delay="0.7s">
                <div class="card border-0 shadow-sm overflow-hidden" style="position: relative; transition: transform 0.3s ease, box-shadow 0.3s ease;">
                    <img src="img/nature.jpg" class="card-img-top" alt="Nature Views" style="height: 250px; object-fit: cover; width: 100%;">
                    <div style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; opacity: 0; transition: opacity 0.3s ease;" class="gallery-overlay">
                        <a href="img/nature.jpg" style="color: #fff; text-decoration: none; font-size: 1.5rem;"><i class="fa fa-search"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    </div>
    <!-- Main Content End -->
</asp:Content>
