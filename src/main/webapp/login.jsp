<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relx - Login</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            background-image: url('img\relx.jpg');
            background-size: cover;
            background-position: center;
            z-index: -2;
        }

        body::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        .container {
            text-align: center;
            animation: fadeIn 1s ease-in;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h1 {
            color: white;
            font-size: 4rem;
            font-weight: 300;
            letter-spacing: 0.1em;
            margin-bottom: 2rem;
            text-transform: uppercase;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .login-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 3rem 3.5rem;
            border-radius: 20px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            max-width: 450px;
            width: 90%;
            margin: 0 auto;
        }

        h2 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 2rem;
            font-weight: 400;
            letter-spacing: 0.05em;
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        label {
            display: block;
            font-size: 1.1rem;
            color: #333;
            margin-bottom: 0.5rem;
            font-weight: 300;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 1rem 1.5rem;
            border: none;
            border-radius: 50px;
            background: #e8e8e8;
            font-size: 1rem;
            transition: all 0.3s ease;
            outline: none;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            background: #ddd;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.3);
        }

        button {
            width: 100%;
            padding: 1rem;
            border: none;
            border-radius: 50px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-size: 1.1rem;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 0.1em;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 1rem;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.4);
        }

        button:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        button:active {
            transform: translateY(0);
        }

        .error-message {
            color: #d32f2f;
            background: #ffebee;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 0.9rem;
        }

        .back-link {
            margin-top: 1.5rem;
            color: #666;
            font-size: 0.9rem;
        }

        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">  
        <div class="login-card">
            <h2>Sign In</h2>

            <% 
                String error = (String) request.getAttribute("error");
                if (error != null) { 
            %>
                <div class="error-message"><%= error %></div>
            <% } %>

            <!-- Login Form -->
            <form action="<%= request.getContextPath() %>/login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" required>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <button type="submit">LOGIN</button>
            </form>

            <div class="back-link">
                <a href="<%= request.getContextPath() %>/index.jsp">← Back to Home</a>
                <br>
                <a href="https://docs.google.com/forms/d/e/1FAIpQLSdfX4gqpxZvqlgNucE29UTWfzuv9cRuODFXtI7jDjM_2VPtoA/viewform">Request a Account</a>
            </div>
        </div>
    </div>
</body>
</html>