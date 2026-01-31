<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Maheshamv3.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Header/Banner Start -->
    <div class="container-fluid d-flex align-items-center justify-content-center text-center"
        style="background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), 
            url('img/Mahesham1.jpeg') center/cover no-repeat fixed; height: 350px;">
        <div class="container">
            <h1 class="display-3 fw-bold text-warning wow fadeInDown" data-wow-delay="0.2s">About Us</h1>
            <p class="lead text-white wow fadeInUp" data-wow-delay="0.4s">
                Stay Smart • Stay Budget-Friendly • Stay Comfortable
            </p>
            <ol class="breadcrumb justify-content-center mt-4 mb-0 wow fadeInUp" data-wow-delay="0.6s">
                <li class="breadcrumb-item"><a href="Default.aspx" class="text-white">Home</a></li>
                <li class="breadcrumb-item active text-warning">About</li>
            </ol>
        </div>
    </div>
    <!-- Header/Banner End -->
    <!-- Banner Section Start -->
    <div class="container-fluid bg-secondary wow zoomInDown" data-wow-delay="0.1s">
        <div class="container">
            <div class="d-flex flex-column flex-lg-row align-items-center justify-content-center text-center p-5">
                <h1 class="me-4"><span class="fw-normal">Join Mahesham Hostel Today!</span></h1>
                <a href="Contact.aspx" class="text-white fw-bold fs-2">
                    <i class="fa fa-phone me-1"></i>+91-9876543210
                </a>
            </div>
        </div>
    </div>
    <!-- Banner Section End -->
    <!-- About Section Start -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row g-5 align-items-center">

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
                            At <strong style="color: red">Mahesham Lodge Hostel</strong>, we believe that a comfortable stay creates the best learning environment.
                            Our hostel offers clean, spacious, and fully furnished rooms at affordable rent, designed especially for students and working professionals.
                          With 24/7 security, hygienic facilities, and a friendly atmosphere, you’ll feel right at home while staying close to your college or workplace.
                        </p>
                        <a class="btn btn-primary rounded-pill text-white py-3 px-5" href="Contact.aspx">Contact Us</a>
                    </div>
                </div>
                <hr />

                <div class="row g-5 align-items-center mt-5">
                    <!-- Left Text -->
                    <div class="col-lg-7 wow fadeInLeft" data-wow-delay="0.3s">
                        <h4 class="text-secondary sub-title fw-bold">Experience Nature</h4>
                        <h1 class="display-3 mb-4">Stay <strong class="text-primary">Close to Nature</strong> with Peace & Comfort
                        </h1>
                        <p>
                            <span style="font-size: 2.5rem; font-weight: bold; color: #2d6a4f; vertical-align: initial;">N</span>ature is the best teacher for students—it inspires creativity, builds patience, and teaches the value of balance in life. 
                                 Surrounded by greenery, fresh air, and peaceful surroundings, students can focus better on their studies and reduce stress. 
                                 Living close to nature not only refreshes the mind but also encourages healthy habits, positivity, and a calm lifestyle. 
                                 At <span style="color: red; font-weight: bold;">Mahesham</span> Hostel, we provide an environment where students can enjoy comfort while staying connected with nature, making their learning journey more joyful and productive.
                        </p>
                    </div>
                    <!-- Right Image -->
                    <div class="col-lg-5 wow fadeInRight" data-wow-delay="0.1s">
                        <div class="border bg-secondary rounded">
                            <img src="img/Nature.jpg" class="img-fluid w-100 rounded" alt="Nature at Mahesham Hostel">
                        </div>
                    </div>

                </div>
                <hr />

                <div class="row g-5 align-items-center">
                    <!-- Left Image -->
                    <div class="col-lg-5 wow fadeInLeft" data-wow-delay="0.1s">
                        <div class="border bg-secondary rounded">
                            <img src="img/facility2.jpg" class="img-fluid w-100 rounded" alt="Mahesham Hostel">
                        </div>
                    </div>

                    <!-- Right Text -->
                    <div class="col-lg-7 wow fadeInRight" data-wow-delay="0.3s">
                        <h1 class="display-3 mb-4">
                            <strong class="text-primary">Facility</strong> for Students 
                        </h1>
                        <p>
                            At <span style="color: red; font-weight: bold;">Mahesham</span> PG Hostel, we understand that finding the right place to stay is more than just about rooms—it’s about comfort, safety, and a sense of belonging. That’s why we provide a homely environment designed especially for students and working professionals.
                        </p>

                        <!-- Facilities List with Icons -->
                        <div class="row g-4">
                            <!-- Rooms -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-house-door-fill text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>Clean & Spacious Rooms</h5>
                                    <p class="text-muted">Single, double, and triple sharing options available.</p>
                                </div>
                            </div>

                            <!-- Security -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-shield-lock-fill text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>24/7 Security & CCTV</h5>
                                    <p class="text-muted">Round-the-clock surveillance for safety and peace of mind.</p>
                                </div>
                            </div>

                            <!-- Food -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-egg-fried text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>Nutritious & Hygienic Food</h5>
                                    <p class="text-muted">Freshly cooked, healthy meals provided daily.</p>
                                </div>
                            </div>

                            <!-- Wi-Fi -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-wifi text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>High-Speed Wi-Fi</h5>
                                    <p class="text-muted">Uninterrupted internet for study and work.</p>
                                </div>
                            </div>

                            <!-- Study Room -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-book-half text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>Study Room / Library</h5>
                                    <p class="text-muted">Quiet space for focused learning.</p>
                                </div>
                            </div>

                            <!-- Laundry -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-basket text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>Laundry Service</h5>
                                    <p class="text-muted">Convenient laundry facilities available.</p>
                                </div>
                            </div>

                            <!-- Drinking Water -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-droplet-fill text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>RO Drinking Water</h5>
                                    <p class="text-muted">Clean and safe drinking water for all residents.</p>
                                </div>
                            </div>

                            <!-- Power Backup -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-lightning-charge-fill text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>Power Backup</h5>
                                    <p class="text-muted">Uninterrupted power supply during outages.</p>
                                </div>
                            </div>

                            <!-- Parking -->
                            <div class="col-md-4 d-flex align-items-start">
                                <i class="bi bi-car-front-fill text-primary fs-1 me-3"></i>
                                <div>
                                    <h5>Parking Facility</h5>
                                    <p class="text-muted">Safe parking for two-wheelers and four-wheelers.</p>
                                </div>
                            </div>

                            <p class="mt-4">
                                💡 Whether you are a student preparing for your future or a working professional focusing on your career, 
                                <span style="color: red; font-weight: bold;">Mahesham</span> PG is more than just accommodation—it’s your second home where you feel safe, supported, and comfortable.
                            </p>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    <!-- About Section End -->
</asp:Content>
