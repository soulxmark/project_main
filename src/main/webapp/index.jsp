<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>M.B.F.C.</title>
    <!-- Import CSS -->
    <link rel="stylesheet" type="text/css" href="style/style.css">
</head>
<body>
    <div class="login-box">
        <h1>Login</h1>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <input type="password" name="password" placeholder="Password" required><br>
            <input type="submit" value="Login">
        </form>
        <% // JSP code to handle session management %>
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
