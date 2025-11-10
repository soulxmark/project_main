<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relx - Home</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/style/landingpage/landingpage.css">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/home" class="navbar-brand">
            <img src="<%= request.getContextPath() %>/style/img/relx_logo.jpg" alt="Relx Logo" class="logoR">
        </a>
        <ul class="navbar-menu">
            <li><a href="<%= request.getContextPath() %>/index">Home</a></li>
            <li><a href="<%= request.getContextPath() %>/products">Products</a></li>
            <li><a href="<%= request.getContextPath() %>/about">About</a></li>
            <li><a href="<%= request.getContextPath() %>/login">Sign In👤</a></li>
        </ul>
    </nav>

    <!-- Main Container -->
    <div class="container">
         <!-- Hero Section -->
        <section class="hero-section" id="home">
            <div class="hero-content">
                <h3>See More, Do More, Own More.</h3>
                <h1>Lunar Dust </h1>
                <p>
                  <b>RELX Infinity Plus</b> is the culmination of groundbreaking vaping technology and sophisticated, award-winning design. In the striking Lunar Dust finish, it is more than just an e-cigarette. It's an experience engineered for a better alternative.
                </p>
                <a href="<%= request.getContextPath() %>/report" class="dashboard-btn">See More</a>
            </div>
            <div class="hero-image">
                <img src="<%= request.getContextPath() %>/style/img/lunardust1_1500x.png" alt="Relx Image">
            </div>
        </section>

        <!-- About Section -->
        <section class="about-section" id="about">
            <div class="dashboard-visual">
                <div class="metrics-display">
                     <img src="<%= request.getContextPath() %>/style/img/discount.jpg" alt="Relx Image">
                </div>
            </div>
            <div class="about-content">
                <h2>Hot Sale</h2>
                <p>
                  <b>The RELX Infinity Plus Device</b> is a 5th Generation, closed-pod system electronic cigarette known for combining a sleek, award-winning design with advanced vaping technology. The Lunar Dust color variant provides a sophisticated, cosmic aesthetic.
                </p>
                <div class="feature-icons">
                    <div class="feature-item">
                        <div class="feature-icon">
                            <span>🏢</span>
                        </div>
                        <div class="feature-label">Iced Orangeade</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <span>💵</span>
                        </div>
                        <div class="feature-label">Iced Tropical Pineapple</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <span>💸</span>
                        </div>
                        <div class="feature-label">Watermelon Ice</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <span>📈</span>
                        </div>
                        <div class="feature-label">Taro Scoop</div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <!-- About Section -->
            

            <!-- Quick Links -->
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/home">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/report">Products</a></li>
                    <li><a href="<%= request.getContextPath() %>/about">About</a></li>
                    <li><a href="#about">About Us</a></li>
                </ul>
            </div>

            <!-- Services -->
            <div class="footer-section">
                <h3>Mission Description</h3>
                <ul>
                    <h3>To provide high-quality RELX filters that ensure a cleaner, safer, 
                        and more satisfying vaping experience through innovation, safety, 
                        and sustainability.
                    </h3>
                </ul>
            </div>

            <!-- Contact Info -->
            <div class="footer-section">
                <h3>Contact Us</h3>
                <ul>
                    <li><a href="mailto:info@oneview.com">📧 info@oneview.com</a></li>
                    <li><a href="tel:+1234567890">📞 +1 (234) 567-890</a></li>
                    <li><a href="#">📍 Metro Manila, Philippines</a></li>
                    <li><a href="#">⏰ Mon-Fri: 9AM - 6PM</a></li>
                </ul>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom">
            <p>&copy; 2025 Relx inc. All rights reserved.</p>
            <p>Designed for Multi Branch Financial Consolidation</p>
        </div>
    </footer>
</body>
</html>