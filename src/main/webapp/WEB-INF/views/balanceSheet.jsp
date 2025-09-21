<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Balance Items</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>Balance Sheet Items - ${branch.name}</h1>
    <a class="btn" href="${pageContext.request.contextPath}/balances?action=new&branchId=${branch.id}">Add Item</a>
    <table class="table">
      <tr><th>ID</th><th>Category</th><th>Description</th><th>Amount</th><th>Date</th><th>Action</th></tr>
      <c:forEach var="b" items="${balances}">
        <tr>
          <td>${b.id}</td>
          <td>${b.category}</td>
          <td>${b.description}</td>
          <td>${b.amount}</td>
          <td>${b.txnDate}</td>
          <td>
            <a href="${pageContext.request.contextPath}/balances?action=delete&id=${b.id}&branchId=${branch.id}" onclick="return confirm('Delete?')">Delete</a>
          </td>
        </tr>
      </c:forEach>
    </table>
    <p><a class="btn" href="${pageContext.request.contextPath}/branches">Back to Branches</a></p>
  </div>
</body>
</html>
