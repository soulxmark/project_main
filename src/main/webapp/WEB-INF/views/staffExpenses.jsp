<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Expenses</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
<div class="container">
    <h1>Expenses - ${branch.name}</h1>
    <!-- ✅ Expense Table -->
    <table class="table">
        <tr><th>ID</th><th>Description</th><th>Amount</th><th>Date</th><th>Action</th></tr>
        <c:forEach var="e" items="${expenses}">
            <tr>
                <td>${e.id}</td>
                <td>${e.description}</td>
                <td>${e.amount}</td>
                <td>${e.txnDate}</td>
            </tr>
        </c:forEach>
    </table>

    <p><a class="btn" href="${pageContext.request.contextPath}/branches">Back to Branches</a></p>
</div>
</body>
</html>
