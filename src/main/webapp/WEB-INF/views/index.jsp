<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OneView - Financial Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #fff 0%, #fff 100%);
            color: #000;
        }

        /* Navigation Bar */
        .navbar {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #000;
            text-decoration: none;
        }

        .navbar-menu {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .navbar-menu a {
            color: #ffffff;
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s;
        }

        .navbar-menu a:hover {
            color: #3498db;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 3rem 2rem;
        }

        /* Hero Section */
        .hero-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
            margin-bottom: 4rem;
        }

        .hero-content h3 {
            font-size: 0.9rem;
            font-weight: 300;
            margin-bottom: 0.5rem;
            letter-spacing: 2px;
        }

        .hero-content h1 {
            font-size: 4rem;
            font-weight: 300;
            margin-bottom: 1.5rem;
            letter-spacing: 3px;
        }

        .hero-content p {
            font-size: 0.95rem;
            line-height: 1.8;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .dashboard-btn {
            background: #ffffff;
            color: #2c3e50;
            padding: 0.8rem 2.5rem;
            border: none;
            border-radius: 25px;
            font-size: 0.9rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-transform: uppercase;
            letter-spacing: 1px;
            text-decoration: none;
            display: inline-block;
        }

        .dashboard-btn:hover {
            background: #3498db;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        .hero-image {
            padding: 1rem;
            border-radius: 5px;
        }

       .hero-image img {
            width: 100%;
            height: auto;
            display: block;
            transform: rotate(30deg); /* rotates 30 degrees */
            background: transparent;  /* ensures no background color */
            }


        /* About Section */
        .about-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: start;
            background: rgba(0, 0, 0, 0.2);
            padding: 3rem;
            border-radius: 10px;
        }

        .dashboard-visual {
            background: #ffffff;
            padding: 2rem;
            border-radius: 5px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 300px;
        }

        .metrics-display {
            text-align: center;
        }

        .metric-icon {
            width: 80px;
            height: 80px;
            background: #2c3e50;
            border-radius: 50%;
            margin: 0 auto 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
        }

        .connecting-line {
            width: 2px;
            height: 60px;
            background: repeating-linear-gradient(
                to bottom,
                #2c3e50,
                #2c3e50 5px,
                transparent 5px,
                transparent 10px
            );
            margin: 0 auto;
        }

        .about-content h2 {
            font-size: 2rem;
            font-weight: 300;
            margin-bottom: 1.5rem;
            letter-spacing: 3px;
            text-transform: uppercase;
        }

        .about-content p {
            font-size: 0.95rem;
            line-height: 1.8;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        /* Feature Icons */
        .feature-icons {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .feature-item {
            text-align: center;
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            margin: 0 auto 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s;
        }

        .feature-icon:hover {
            background: rgba(52, 152, 219, 0.3);
            transform: translateY(-5px);
        }

        .feature-icon img {
            width: 30px;
            height: 30px;
            filter: invert(1);
        }

        .feature-label {
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            opacity: 0.8;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-section,
            .about-section {
                grid-template-columns: 1fr;
            }

            .hero-content h1 {
                font-size: 2.5rem;
            }

            .navbar-menu {
                gap: 1rem;
                font-size: 0.9rem;
            }

            .feature-icons {
                grid-template-columns: repeat(2, 1fr);
            }
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <a href="<%= request.getContextPath() %>/home" class="navbar-brand">Relx</a>
        <ul class="navbar-menu">
            <li><a href="<%= request.getContextPath() %>/home">Home</a></li>
            <li><a href="<%= request.getContextPath() %>/report">Products</a></li>
            <li><a href="<%= request.getContextPath() %>/branches">Locations</a></li>
            <li><a href="<%= request.getContextPath() %>/incomes">Incomes</a></li>
            <li><a href="<%= request.getContextPath() %>/expenses">Expenses</a></li>
            <li><a href="<%= request.getContextPath() %>/balances">-Sign In-</a></li>
        </ul>
    </nav>

    <!-- Main Container -->
    <div class="container">
        <!-- Hero Section -->
         <!-- Hero Section -->
        <section class="hero-section" id="home">
            <div class="hero-content">
                <h3>See More, Do More, Own More</h3>
                <h1>Lunar Dust </h1>
                <p>
                    OneView is a powerful financial dashboard platform designed to bring all your data and metrics into one place. Transform complex financial data into simple, intuitive visualizations, and make smarter decisions faster and stay on top of what matters most.
                </p>
                <a href="<%= request.getContextPath() %>/report" class="dashboard-btn">GO TO DASHBOARD</a>
            </div>
            <div class="hero-image">
                <img src="<%= request.getContextPath() %>/style/img/lunardust1_1500x.png" alt="Relx Image">
            </div>
        </section>

        <!-- About Section -->
        <section class="about-section" id="about">
            <div class="dashboard-visual">
                <div class="metrics-display">
                    <div class="metric-icon">💰</div>
                    <div class="connecting-line"></div>
                    <div class="metric-icon">📊</div>
                </div>
            </div>
            <div class="about-content">
                <h2>ABOUT</h2>
                <p>
                    OneView centralizes all your financial data into a single, intuitive dashboard, providing real-time insights at a glance. Track income, expenses, branch performance, and balance sheets with ease. Monitor trends and simplify complex financial datasets by streamlining metrics and offering a clear view of your financial performance. OneView enables you to monitor, analyze, and act with confidence—all from one convenient platform.
                </p>
                <div class="feature-icons">
                    <div class="feature-item">
                        <div class="feature-icon">
                            <span>🏢</span>
                        </div>
                        <div class="feature-label">Branches</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <span>💵</span>
                        </div>
                        <div class="feature-label">Income</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <span>💸</span>
                        </div>
                        <div class="feature-label">Expenses</div>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <span>📈</span>
                        </div>
                        <div class="feature-label">Balance</div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
</html>