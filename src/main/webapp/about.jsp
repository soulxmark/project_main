<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relx - About</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/landingpage/landingpage.css">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/" class="navbar-brand">
            <img src="<%= request.getContextPath() %>/style/img/relx_logo.jpg" alt="Relx Logo" class="logoR">
        </a>
        <ul class="navbar-menu">
            <li><a href="<%= request.getContextPath() %>/home">Home</a></li>
            <li><a href="<%= request.getContextPath() %>/products.jsp">Products</a></li>
            <li><a href="<%= request.getContextPath() %>/about.jsp" class="active">About</a></li>
            <li><a href="<%= request.getContextPath() %>/login.jsp">Sign In👤</a></li>
        </ul>
    </nav>

    <!-- About Section -->
    <section class="about-page">
        <div class="about-header">
            <h1>About RELX</h1>
            <p>Innovating Vaping Experiences with Style, Technology, and Responsibility.</p>
        </div>

        <div class="about-container">
            <div class="about-text">
                <h2>Our Story</h2>
                <p>
                    RELX is a global leader in <b>electronic vaping technology</b>. Our mission is to provide adult smokers with a high-quality alternative through sleek devices, flavorful pods, and cutting-edge safety features. Since 2018, RELX has delivered award-winning designs like the <b>RELX Infinity Plus</b> and popular flavors such as <b>Iced Orangeade</b>, <b>Watermelon Ice</b>, and <b>Taro Scoop</b>.
                </p>

                <h2>Our Mission</h2>
                <p>
                    To create <b>safe, reliable, and enjoyable vaping experiences</b> while reducing harm compared to traditional smoking. Every RELX device and pod undergoes rigorous testing for quality and performance.
                </p>

                <h2>Our Vision</h2>
                <p>
                    To lead the shift toward a <b>smoke-free world</b>, combining innovation, elegance, and responsibility in every product we deliver.
                </p>
            </div>

            <div class="about-image">
                <img src="<%= request.getContextPath() %>/style/img/lunardust1_1500x.png" alt="RELX Device">
            </div>
        </div>

        <!-- RELX Values Grid -->
        <div class="values-section">
            <h2>Why Choose RELX?</h2>
            <div class="values-grid">
                <div class="value-item">
                    <span>💡</span>
                    <h3>Innovation</h3>
                    <p>Advanced devices like the <b>Infinity Plus</b> redefine the vaping experience.</p>
                </div>
                <div class="value-item">
                    <span>🌍</span>
                    <h3>Responsibility</h3>
                    <p>We focus on adult use only, safety, and sustainable practices.</p>
                </div>
                <div class="value-item">
                    <span>🎨</span>
                    <h3>Design</h3>
                    <p>Elegant finishes like Lunar Dust make each device a statement piece.</p>
                </div>
                <div class="value-item">
                    <span>🍓</span>
                    <h3>Flavors</h3>
                    <p>Delicious and varied pods: Iced Orangeade, Watermelon Ice, Taro Scoop, and more.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul>
                    <li><a href="<%= request.getContextPath() %>/home">Home</a></li>
                    <li><a href="<%= request.getContextPath() %>/products.jsp">Products</a></li>
                    <li><a href="<%= request.getContextPath() %>/about.jsp">About</a></li>
                </ul>
            </div>

            <div class="footer-section">
                <h3>Mission Description</h3>
                <ul>
                    <h3>
                        To provide high-quality RELX devices and pods that ensure a cleaner, safer, and more satisfying vaping experience through innovation, safety, and style.
                    </h3>
                </ul>
            </div>

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

        <div class="footer-bottom">
            <p>&copy; 2025 Relx inc. All rights reserved.</p>
            <p>Designed for Multi Branch Financial Consolidation</p>
        </div>
    </footer>
</body>
</html>
