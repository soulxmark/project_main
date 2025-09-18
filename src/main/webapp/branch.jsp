<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Branches</title>
  <link rel="stylesheet" href="style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>Branches</h1>
    <a class="btn" href="${pageContext.request.contextPath}/branches?action=new">Create Branch</a>
    <table class="table">
      <tr><th>ID</th><th>Name</th><th>Location</th><th>Actions</th></tr>
      <c:forEach var="b" items="${branch}">
        <tr>
          <td>${b.id}</td>
          <td>${b.name}</td>
          <td>${b.location}</td>
          <td>
            <a href="${pageContext.request.contextPath}/branches?action=edit&id=${b.id}">Edit</a> |
            <a href="${pageContext.request.contextPath}/branches?action=delete&id=${b.id}" onclick="return confirm('Delete branch?')">Delete</a> |
            <a href="${pageContext.request.contextPath}/incomes?branchId=${b.id}">Incomes</a> |
            <a href="${pageContext.request.contextPath}/expenses?branchId=${b.id}">Expenses</a> |
            <a href="${pageContext.request.contextPath}/balances?branchId=${b.id}">Balance Items</a>
          </td>
        </tr>
      </c:forEach>
    </table>
    <p><a class="btn" href="${pageContext.request.contextPath}/report">Back to Dashboard</a></p>
  </div>
</body>
</html>
