<%@ page isErrorPage="true" contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .error-box {
            background-color: #f5c6cb;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
            text-align: center;
        }
        h1 { margin-bottom: 10px; }
        a {
            display: inline-block;
            margin-top: 15px;
            text-decoration: none;
            background-color: #721c24;
            color: white;
            padding: 10px 20px;
            border-radius: 5px;
        }
        a:hover { background-color: #501418; }
    </style>
</head>
<body>
    <div class="error-box">
        <h1>Oops! Something went wrong.</h1>
        <p>
            <%-- Display servlet message if available, else show exception message --%>
            <%= request.getAttribute("errorMessage") != null 
                    ? request.getAttribute("errorMessage") 
                    : (exception == null ? "Unknown error occurred." : exception.getMessage()) %>
        </p>
        <a href="login.jsp">Go Back to Login</a>
    </div>
</body>
</html>
