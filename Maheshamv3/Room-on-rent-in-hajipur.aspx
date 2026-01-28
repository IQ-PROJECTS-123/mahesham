<%@ Page Title="Best Lodge & Room on Rent in Hajipur | Students & Professionals" Language="C#" MasterPageFile="~/Gen.Master" AutoEventWireup="true" CodeBehind="Room-on-rent-in-hajipur.aspx.cs" Inherits="Maheshamv3.Room_on_rent_in_hajipur" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #room-haji-wrapper {
            --brh-primary: #ff6b00;
            --brh-primary-dark: #e66000;
            --brh-light: #f4f6fb;
            --brh-dark: #111;
            --brh-shadow: 0 20px 40px rgba(0,0,0,.1);
            font-family: 'Poppins', sans-serif;
            background: var(--brh-light);
            color: #333;
            width: 100%;
            line-height: 1.6;
        }

        #room-haji-wrapper * { box-sizing: border-box; }

        /* ================= HERO ================= */
        #room-haji-wrapper .brh-hero {
            height: 70vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #fff;
            background: #000 url('https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?auto=format&fit=crop&w=1920&q=80') center/cover no-repeat;
        }

        #room-haji-wrapper .brh-hero::after {
            content: '';
            position: absolute;
            inset: 0;
            background: rgba(0,0,0,0.6);
        }

        #room-haji-wrapper .brh-hero-content { position: relative; z-index: 2; padding: 20px; max-width: 800px; }
        #room-haji-wrapper .brh-hero h1 { font-size: 3rem; color: white; margin-bottom: 15px; font-weight: 700; line-height: 1.2; }
        #room-haji-wrapper .brh-hero p { font-size: 1.2rem; margin-bottom: 30px; opacity: 0.9; }

        /* ================= SECTIONS ================= */
        #room-haji-wrapper .brh-section { padding: 80px 8%; }
        #room-haji-wrapper .brh-section h2 { text-align: center; font-size: 2.2rem; color: var(--brh-dark); margin-bottom: 40px; }
        #room-haji-wrapper .brh-section h2::after {
            content: ''; width: 60px; height: 4px; background: var(--brh-primary); display: block; margin: 10px auto;
        }

        /* ================= FAQ (NO JS ACCORDION) ================= */
        .faq-container { max-width: 900px; margin: 40px auto 0; }
        .faq-item { background: #fff; margin-bottom: 15px; border-radius: 10px; overflow: hidden; box-shadow: 0 4px 10px rgba(0,0,0,0.03); position: relative; border: 1px solid #eee; }
        .faq-input { position: absolute; opacity: 0; z-index: -1; }
        .faq-label { 
            display: flex; justify-content: space-between; align-items: center;
            padding: 20px; font-weight: 600; color: var(--brh-dark); cursor: pointer; 
            transition: background 0.3s;
        }
        .faq-label:hover { background: #fafafa; }
        .faq-label::after { content: '\f078'; font-family: 'Font Awesome 5 Free'; font-weight: 900; transition: 0.3s; color: var(--brh-primary); }
        .faq-answer { max-height: 0; overflow: hidden; transition: all 0.3s ease; background: #fff; padding: 0 20px; color: #666; }
        .faq-input:checked ~ .faq-answer { max-height: 300px; padding: 10px 20px 20px; border-top: 1px solid #f5f5f5; }
        .faq-input:checked ~ .faq-label::after { transform: rotate(180deg); }

        /* ================= ROOM CARDS ================= */
        #room-haji-wrapper .brh-room-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(320px, 1fr)); gap: 30px; }
        #room-haji-wrapper .brh-room-card { background: #fff; border-radius: 20px; overflow: hidden; box-shadow: var(--brh-shadow); border: 1px solid #eee; }
        #room-haji-wrapper .brh-room-card img { width: 100%; height: 220px; object-fit: cover; }
        #room-haji-wrapper .brh-card-content { padding: 25px; }
        #room-haji-wrapper .brh-card-content h3 { color: var(--brh-primary); font-size: 1.5rem; margin-bottom: 15px; }
        #room-haji-wrapper .feature-list { list-style: none; padding: 0; margin-bottom: 25px; }
        #room-haji-wrapper .feature-list li { padding: 8px 0; border-bottom: 1px solid #f9f9f9; font-size: 0.95rem; display: flex; align-items: center; }
        #room-haji-wrapper .feature-list li i { color: #2ed573; margin-right: 10px; }
        #room-haji-wrapper .brh-btn { background: var(--brh-primary); color: white !important; padding: 12px 25px; border-radius: 50px; text-decoration: none; display: block; text-align: center; font-weight: 600; transition: 0.3s; }
        #room-haji-wrapper .brh-btn:hover { background: var(--brh-primary-dark); transform: translateY(-3px); }

        /* ================= FEATURES ================= */
        #room-haji-wrapper .brh-feature-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 25px; }
        #room-haji-wrapper .brh-feature-card { background: #fff; padding: 30px; border-radius: 20px; text-align: center; border: 1px solid #eee; transition: 0.3s; }
        #room-haji-wrapper .brh-feature-card i { font-size: 2.5rem; color: var(--brh-primary); margin-bottom: 15px; display: block;}

        .content-body { max-width: 900px; margin: 0 auto; color: #555; }
        .content-body p { margin-bottom: 20px; font-size: 1.05rem; }

        @media (max-width: 768px) {
            #room-haji-wrapper .brh-hero h1 { font-size: 2rem; }
            #room-haji-wrapper .brh-section { padding: 50px 5%; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="room-haji-wrapper">
        
        <section class="brh-hero">
            <div class="brh-hero-content">
                <h1>Best Lodge & Room on Rent in Hajipur</h1>
                <p>Affordable, secure, and practical accommodation for students, job seekers & working professionals.</p>
                <a href="#rooms" class="brh-btn" style="display:inline-block">View Available Rooms</a>
            </div>
        </section>

        <section class="brh-section" style="background:white;">
            <div class="content-body">
                <h2>Why Choose Our Lodge in Hajipur?</h2>
                <p>Finding the right place to stay can directly affect your focus, safety, and daily routine—especially if you are a student, job seeker, or working professional. If you are searching for a <strong>lodge in Hajipur, Bihar</strong> that is affordable, secure, and practical for daily living, you need more than just a bed and four walls.</p>
                <p>Hajipur is growing fast with coaching centers, offices, and transport connectivity. A well-managed lodge style stay is often the smartest option for people who need comfort, safety, and flexibility without burning money.</p>
            </div>
        </section>

        <section class="brh-section" id="rooms">
            <h2>Our Accommodations</h2>
            <div class="brh-room-grid">
                <div class="brh-room-card">
                    <img src="https://images.unsplash.com/photo-1598928506311-c55ded91a20c?auto=format&fit=crop&w=600&q=80" alt="Private Room in Hajipur" />
                    <div class="brh-card-content">
                        <h3>Single Private Room</h3>
                        <p>Complete privacy for working professionals and students preparing for competitive exams.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check-circle"></i> Private & Peaceful</li>
                            <li><i class="fas fa-check-circle"></i> Individual Study Desk</li>
                            <li><i class="fas fa-check-circle"></i> Clean & Ventilated</li>
                        </ul>
                        <a href="ConnectWithUs1.aspx" class="brh-btn">Book Private Room</a>
                    </div>
                </div>

                <div class="brh-room-card">
                    <img src="https://images.unsplash.com/photo-1555854877-bab0e564b8d5?auto=format&fit=crop&w=600&q=80" alt="Sharing Room in Hajipur" />
                    <div class="brh-card-content">
                        <h3>Shared Accommodation</h3>
                        <p>Budget-friendly comfortable stay ideal for job seekers and groups.</p>
                        <ul class="feature-list">
                            <li><i class="fas fa-check-circle"></i> Most Affordable Rent</li>
                            <li><i class="fas fa-check-circle"></i> Safe & Secure Living</li>
                            <li><i class="fas fa-check-circle"></i> High-Speed Connectivity</li>
                        </ul>
                        <a href="ConnectWithUs1.aspx" class="brh-btn">Book Sharing Room</a>
                    </div>
                </div>
            </div>
        </section>

        <section class="brh-section" style="background:white;">
            <h2>Who Should Stay With Us?</h2>
            <div class="brh-feature-grid">
                <div class="brh-feature-card">
                    <i class="fas fa-user-graduate"></i>
                    <strong>Exam Aspirants</strong>
                    <p>Peaceful study environment.</p>
                </div>
                <div class="brh-feature-card">
                    <i class="fas fa-user-tie"></i>
                    <strong>Job Seekers</strong>
                    <p>Short & long term flexibility.</p>
                </div>
                <div class="brh-feature-card">
                    <i class="fas fa-briefcase"></i>
                    <strong>Working Pros</strong>
                    <p>Clean and secure private spaces.</p>
                </div>
                <div class="brh-feature-card">
                    <i class="fas fa-train"></i>
                    <strong>Travelers</strong>
                    <p>Near transport & railway station.</p>
                </div>
            </div>
        </section>

        <section class="brh-section">
            <h2>Frequently Asked Questions</h2>
            <div class="faq-container">
                <div class="faq-item">
                    <input type="checkbox" id="faq1" class="faq-input">
                    <label for="faq1" class="faq-label">1. Is a lodge suitable for long-term stay in Hajipur?</label>
                    <div class="faq-answer">
                        <p>Yes. Lodges are designed for both short and long-term stays, making them ideal for students, job seekers, and professionals.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <input type="checkbox" id="faq2" class="faq-input">
                    <label for="faq2" class="faq-label">2. Are private rooms available?</label>
                    <div class="faq-answer">
                        <p>Most lodges offer both shared and private rooms in Hajipur, depending on availability and budget.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <input type="checkbox" id="faq3" class="faq-input">
                    <label for="faq3" class="faq-label">3. How is a lodge different from a hotel?</label>
                    <div class="faq-answer">
                        <p>Hotels focus on luxury and short stays, while lodges focus on affordability, safety, and daily living needs—making them a better option than the best hotel in hajipur for long stays.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <input type="checkbox" id="faq4" class="faq-input">
                    <label for="faq4" class="faq-label">4. Is staying near the railway station beneficial?</label>
                    <div class="faq-answer">
                        <p>Yes. Staying near a hotel in hajipur near railway station area improves connectivity and saves travel time for commuters.</p>
                    </div>
                </div>

                <div class="faq-item">
                    <input type="checkbox" id="faq5" class="faq-input">
                    <label for="faq5" class="faq-label">5. Is food a problem if the lodge doesn’t provide it?</label>
                    <div class="faq-answer">
                        <p>Not really. Nearby mess services, tiffin providers, and restaurants usually cover daily food needs easily.</p>
                    </div>
                </div>
            </div>
        </section>

    </div>
</asp:Content>