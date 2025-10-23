<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Financial Report</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>Financial Report</h1>

    <div class="summary">
      <div class="card income">
        <h3>Total Income</h3>
        <p class="amount">${totalIncome}</p>
      </div>
      <div class="card expense">
        <h3>Total Expense</h3>
        <p class="amount">${totalExpense}</p>
      </div>
    </div>

    <h2>Branch Performance</h2>
    <table class="perf-table">
      <thead>
        <tr>
          <th>Branch</th>
          <th>Income</th>
          <th>Expense</th>
          <th>Profit</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="bp" items="${branches}">
          <tr>
            <td>${bp.branchName}</td>
            <td>${bp.income}</td>
            <td>${bp.expense}</td>
            <td>${bp.profit}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <div class="links">
      <a class="btn" href="${pageContext.request.contextPath}/dashboard.jsp">Back to Dashboard</a>
    </div>
  </div>
</body>
</html>
