<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Quality.aspx.cs" Inherits="Maheshamv3.Quality" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Rooms & Pricing Start -->
    <div class="container-fluid training py-5 bg-light" style="background-color:white">
        <div class="container py-5">
            <div class="pb-5">
                <div class="row g-4 align-items-end">
                    <div class="col-xl-8">
                        <h4 class="text-secondary sub-title fw-bold wow fadeInUp" data-wow-delay="0.1s">Rooms & Pricing</h4>
                        <h1 class="display-2 mb-0 wow fadeInUp" data-wow-delay="0.3s">Comfortable & Affordable Stay</h1>
                    </div>
                </div>
            </div>
            <!-- Owl Carousel -->
            <div class="training-carousel owl-carousel pt-5 wow fadeInUp" data-wow-delay="0.1s" id="roomAccordion">
                <!-- Single Room --> 
                <div class="training-item bg-white rounded">
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
                            aria-controls="singleDetail">Detail</button>
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
                <div class="training-item bg-white rounded">
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
                            aria-controls="doubleDetail">Detail</button>
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
                <div class="training-item bg-white rounded">
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
                            aria-controls="sharedDetail">Detail</button>
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
        </div>
    </div>
    <hr />

    <!-- Facilities -->
    <div class="container-fluid py-5">
        <div class="container py-5">
            <div class="row g-5 align-items-center">
                <!-- Left Image -->
                <div class="col-lg-5 wow fadeInLeft" data-wow-delay="0.1s">
                    <div class="border bg-secondary rounded">
                        <img src="img/facility2.jpg" class="img-fluid w-100 rounded" alt="Mahesham Hostel Facility">
                    </div>
                </div>

                <!-- Right Text -->
                <div class="col-lg-7 wow fadeInRight" data-wow-delay="0.3s">
                    <h1 class="display-3 mb-4"><strong class="text-primary">Facilities</strong> for Students</h1>
                    <p>
                        At <span style="color: red; font-weight: bold;">Mahesham</span> PG Hostel, we understand that finding the right place 
                        to stay is more than just about rooms—it’s about comfort, safety, and a sense of belonging.
                    </p>
                    <!-- Facilities List -->
                    <div class="row g-4">
                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-house-door-fill text-primary fs-1 me-3"></i>
                            <div>
                                <h5>Clean & Spacious Rooms</h5>
                                <p class="text-muted">Single, double, and triple sharing options available.</p>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-shield-lock-fill text-primary fs-1 me-3"></i>
                            <div>
                                <h5>24/7 Security & CCTV</h5>
                                <p class="text-muted">Round-the-clock surveillance for safety.</p>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-egg-fried text-primary fs-1 me-3"></i>
                            <div>
                                <h5>Nutritious & Hygienic Food</h5>
                                <p class="text-muted">Healthy, freshly cooked meals every day.</p>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-wifi text-primary fs-1 me-3"></i>
                            <div>
                                <h5>High-Speed Wi-Fi</h5>
                                <p class="text-muted">Seamless connectivity for study & work.</p>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-book-half text-primary fs-1 me-3"></i>
                            <div>
                                <h5>Study Room / Library</h5>
                                <p class="text-muted">Dedicated space for focused learning.</p>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-basket text-primary fs-1 me-3"></i>
                            <div>
                                <h5>Laundry Service</h5>
                                <p class="text-muted">On-site laundry facility for residents.</p>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-droplet-fill text-primary fs-1 me-3"></i>
                            <div>
                                <h5>RO Drinking Water</h5>
                                <p class="text-muted">Clean and safe drinking water 24/7.</p>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-lightning-charge-fill text-primary fs-1 me-3"></i>
                            <div>
                                <h5>Power Backup</h5>
                                <p class="text-muted">Uninterrupted electricity supply.</p>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex align-items-start">
                            <i class="bi bi-car-front-fill text-primary fs-1 me-3"></i>
                            <div>
                                <h5>Parking Facility</h5>
                                <p class="text-muted">Secure parking for vehicles.</p>
                            </div>
                        </div>
                    </div>

                    <p class="mt-4">
                        💡 Whether you are a student preparing for your future or a working professional focusing on your career, 
                        <span style="color: red; font-weight: bold;">Mahesham</span> PG is more than just accommodation—it’s your second home.
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- Facilities Section End -->

</asp:Content>
