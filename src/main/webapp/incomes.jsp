<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Incomes</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>Incomes - ${branch.name}</h1>
    <a class="btn" href="${pageContext.request.contextPath}/incomes?action=new&branchId=${branch.id}">New Income</a>
    <table class="table">
      <tr><th>ID</th><th>Description</th><th>Amount</th><th>Date</th><th>Action</th></tr>
      <c:forEach var="t" items="${incomes}">
        <tr>
          <td>${t.id}</td>
          <td>${t.description}</td>
          <td>${t.amount}</td>
          <td>${t.txnDate}</td>
          <td>
            <a href="${pageContext.request.contextPath}/incomes?action=edit&id=${t.id}">Edit</a> |
            <a href="${pageContext.request.contextPath}/incomes?action=delete&id=${t.id}&branchId=${branch.id}" onclick="return confirm('Delete income?')">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </table>
    <p><a class="btn" href="${pageContext.request.contextPath}/branches">Back to Branches</a></p>
  </div>
</body>
</html>
