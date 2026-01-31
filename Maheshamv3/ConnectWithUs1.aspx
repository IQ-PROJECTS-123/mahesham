<%@ Page Title="" Language="C#" MasterPageFile="~/Gen.Master" AutoEventWireup="true" CodeBehind="ConnectWithUs1.aspx.cs" Inherits="Maheshamv3.ConnectWithUs1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

 <style>
     body { font-family: 'Outfit', sans-serif; background-color: #F4F7F6; }
     
     .contact-header {
         background: linear-gradient(135deg, #2F3542 0%, #1e2129 100%);
         padding: 100px 0 140px;
     }
     .btn-submit-3d {
         background-color: #FF4757;
         border-color: #FF4757;
         color: white;
         font-weight: 700;
         border-radius: 15px;
         box-shadow: 0 6px 0px #d63031, 0 10px 20px rgba(255, 71, 87, 0.3);
         transition: all 0.2s ease;
         position: relative;
     }
     .btn-submit-3d:hover {
         background-color: #ff2e3d;
         transform: translateY(-2px);
         box-shadow: 0 8px 0px #d63031, 0 12px 25px rgba(255, 71, 87, 0.4);
         color: white;
     }
     .btn-submit-3d:active {
         transform: translateY(4px);
         box-shadow: 0 2px 0px #d63031, 0 5px 10px rgba(255, 71, 87, 0.2);
     }
     .icon-box {
         width: 50px;
         height: 50px;
         background: #fff2f2;
         color: #FF4757;
         display: flex;
         align-items: center;
         justify-content: center;
         border-radius: 12px;
     }
     
     .negative-margin { margin-top: -80px; }
 </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-wrapper pb-5">
        <header class="contact-header text-center text-white">
            <div class="container">
                <h1 class="display-4 fw-bold">Let's Connect</h1>
                <p class="lead opacity-75">Have questions? We'd love to hear from you.</p>
            </div>
        </header>

        <div class="container negative-margin">
            <div class="row g-4">
                
                <div class="col-lg-4">
                    <div class="d-flex flex-column gap-3">
                        
                        <a href="tel:+919555580458" class="card border-0 shadow-sm p-4 text-decoration-none text-dark rounded-4 shadow-hover">
                            <div class="icon-box mb-3"><i class="fas fa-phone-alt fs-4"></i></div>
                            <h5 class="fw-bold mb-1">Direct Call</h5>
                            <p class="text-muted small mb-2">Speak to our manager instantly</p>
                            <span class="fw-bold" style="color: #FF4757">+91 9555580458</span>
                        </a>

                        <a href="https://wa.me/919555580458" class="btn btn-success fw-bold p-3 rounded-3 shadow-sm">
                            <i class="fab fa-whatsapp me-2"></i> Chat on WhatsApp
                        </a>

                        <div class="card border-0 shadow-sm p-4 rounded-4">
                            <div class="icon-box mb-3"><i class="fas fa-location-dot fs-4"></i></div>
                            <h5 class="fw-bold mb-1">Visit Us</h5>
                            <a href="https://www.google.com/maps..." class="text-muted small text-decoration-none">
                                Near Hajipur Junction, Hajipur, Bihar
                            </a>
                        </div>

                        <div class="rounded-4 overflow-hidden shadow-sm" style="height: 250px;">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3594.757094055531!2d85.21134311138865!3d25.70337907728362!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ed5d00601e46d7%3A0x9fafab6066f1640a!2sMahesham%20Lodge!5e0!3m2!1sen!2sin!4v1710000000000!5m2!1sen!2sin" 
                                width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                    </div>
                </div>

                <div class="col-lg-8">
                    <div class="card border-0 shadow-lg p-4 p-md-5 rounded-5">
                        <h3 class="fw-bold mb-4">Send Inquiry</h3>
                        
                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Your Name</label>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-lg bg-light border-0 py-3 px-4" placeholder="Full Name"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold small text-uppercase">Mobile Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control form-control-lg bg-light border-0 py-3 px-4" placeholder="91XXXXXXXX"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <label class="form-label fw-bold small text-uppercase">Select Room Type</label>
                            <asp:DropDownList ID="ddlRoom" runat="server" CssClass="form-select form-select-lg bg-light border-0 py-3 px-4">
                                <asp:ListItem>Single Premium Room</asp:ListItem>
                                <asp:ListItem>Double Sharing Room</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn btn-submit-3d w-100 py-3" OnClick="btnSubmit_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
