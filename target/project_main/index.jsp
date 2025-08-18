<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Import CSS -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="login-box">
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Login">
        </form>
        // JSP Section for displaying errors
        <%-- Placeholder for errors (later backend will pass ?error=true) --%>
        <%
            String error = request.getParameter("error");
            if (error != null) {
        %>
            <div class="error">Invalid username or password</div>
        <%
            }
        %>
    </div>
</body>
</html>
