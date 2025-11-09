<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneView - Financial Dashboard</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/style/landingpage/products.css">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/home" class="navbar-brand">
            <img src="<%= request.getContextPath() %>/style/img/relx_logo.jpg" alt="Relx Logo" class="logoR">
        </a>
        <ul class="navbar-menu">
           <ul class="navbar-menu">
            <li><a href="<%= request.getContextPath() %>/index">Home</a></li>
            <li><a href="<%= request.getContextPath() %>/products">Products</a></li>
            <li><a href="<%= request.getContextPath() %>/about">About</a></li>
            <li><a href="<%= request.getContextPath() %>/login">Sign In👤</a></li>
        </ul>
        </ul>
    </nav>

    <!-- Main Container -->
     <!-- Products Section -->
    <section class="products-section" id="products">
        <div class="section-header">
            <h2>Our Products</h2>
            <p>Premium pods crafted for the ultimate vaping experience</p>
        </div>

        <!-- Fruit Series -->
        <div class="series-container">
            <h3 class="series-title">🍓 FRUIT SERIES</h3>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">🍊</div>
                    <div class="product-name">Iced Orangeade</div>
                    <div class="product-description">Fizzy orange vibes with a cool, zesty kick!</div>
                </div>
                <div class="product-card">
                    <div class="product-image">🍍</div>
                    <div class="product-name">Iced Tropical Pineapple</div>
                    <div class="product-description">Sweet pineapple chill — it's sunshine in every puff!</div>
                </div>
                <div class="product-card">
                    <div class="product-image">🍎</div>
                    <div class="product-name">Green Apple Ice</div>
                    <div class="product-description">Crisp green apple with an icy bite that hits just right.</div>
                </div>
                <div class="product-card">
                    <div class="product-image">🍉</div>
                    <div class="product-name">Watermelon Ice</div>
                    <div class="product-description">Juicy summer watermelon with a smooth, cool exhale.</div>
                </div>
                <div class="product-card">
                    <div class="product-image">🥭</div>
                    <div class="product-name">Mango Ice</div>
                    <div class="product-description">Tropical mango magic with a burst of chill!</div>
                </div>
                <div class="product-card">
                    <div class="product-image">🍑</div>
                    <div class="product-name">Fresh Peach</div>
                    <div class="product-description">Juicy peach perfection — smooth, sweet, and so refreshing.</div>
                </div>
                <div class="product-card">
                    <div class="product-image">🍓</div>
                    <div class="product-name">Strawberry Burst</div>
                    <div class="product-description">Candy-sweet strawberry flavor that pops with every puff!</div>
                </div>
                <div class="product-card">
                    <div class="product-image">🍇</div>
                    <div class="product-name">Tangy Grape</div>
                    <div class="product-description">Juicy grape explosion with a tangy, fruity twist.</div>
                </div>
                <div class="product-card">
                    <div class="product-image">🫐</div>
                    <div class="product-name">Blueberry Splash</div>
                    <div class="product-description">Sweet blueberries and frosty freshness in every puff.</div>
                </div>
            </div>
        </div>

        <!-- Tea Series -->
        <div class="series-container">
            <h3 class="series-title">🍵 TEA SERIES</h3>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">🍵</div>
                    <div class="product-name">Jasmine Green Tea</div>
                    <div class="product-description">Smooth green tea with a floral jasmine twist.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
                <div class="product-card">
                    <div class="product-image">🌺</div>
                    <div class="product-name">Hibiscus Ice Tea</div>
                    <div class="product-description">Tangy hibiscus meets icy freshness — bold and breezy!</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
                <div class="product-card">
                    <div class="product-image">🍃</div>
                    <div class="product-name">Oolong Ice Tea</div>
                    <div class="product-description">Classic oolong flavor with a cool, crisp edge.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
                <div class="product-card">
                    <div class="product-image">🍋</div>
                    <div class="product-name">Lemon Ice Tea</div>
                    <div class="product-description">Fresh lemon tea that's bright, cool, and totally thirst-quenching.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
                <div class="product-card">
                    <div class="product-image">🍵</div>
                    <div class="product-name">Matcha Frappe</div>
                    <div class="product-description">Creamy matcha goodness blended with an icy smooth vibe.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
            </div>
        </div>

        <!-- Mint Series -->
        <div class="series-container">
            <h3 class="series-title">❄️ MINT SERIES</h3>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">❄️</div>
                    <div class="product-name">Menthol Plus</div>
                    <div class="product-description">Cool, clean, and super refreshing — the ultimate mint chill.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
            </div>
        </div>

        <!-- Dessert Series -->
        <div class="series-container">
            <h3 class="series-title">🍨 DESSERT SERIES</h3>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">🥥</div>
                    <div class="product-name">Taro Scoop</div>
                    <div class="product-description">Sweet, creamy taro that's smooth and oh-so-satisfying.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
                <div class="product-card">
                    <div class="product-image">🍌</div>
                    <div class="product-name">Banana Freeze</div>
                    <div class="product-description">Ripe banana flavor with an icy cool twist.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
            </div>
        </div>

        <!-- Beverage Series -->
        <div class="series-container">
            <h3 class="series-title">🥤 BEVERAGE SERIES</h3>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">🥥</div>
                    <div class="product-name">Icy Coconut Water</div>
                    <div class="product-description">Light, cool, and hydrating — your tropical chill in a pod.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
                <div class="product-card">
                    <div class="product-image">🥒</div>
                    <div class="product-name">Cucumber Lemonade</div>
                    <div class="product-description">Fresh cucumber and zesty lemon — crisp, clean, and cool!</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
                <div class="product-card">
                    <div class="product-image">🥤</div>
                    <div class="product-name">Dark Sparkle</div>
                    <div class="product-description">Classic cola flavor with an icy twist and bubbly finish.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
            </div>
        </div>

        <!-- Tobacco Series -->
        <div class="series-container">
            <h3 class="series-title">🚬 TOBACCO SERIES</h3>
            <div class="products-grid">
                <div class="product-card">
                    <div class="product-image">🍂</div>
                    <div class="product-name">Classic Tobacco</div>
                    <div class="product-description">Smooth, rich, and timeless — the real tobacco experience.</div>
                    <span class="nicotine-badge">18 mg/ml</span>
                </div>
            </div>
        </div>
    </section>

       
        
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
                    <li><a href="<%= request.getContextPath() %>/branches">About</a></li>
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