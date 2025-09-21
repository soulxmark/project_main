<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Master Financial Statement</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>Master Financial Statement</h1>

    <h2>Profit & Loss</h2>
    <table class="table">
      <tr><th>Category</th><th>Amount</th></tr>
      <tr><td>Total Income</td><td>${totalIncome}</td></tr>
      <tr><td>Total Expense</td><td>${totalExpense}</td></tr>
      <tr><td>Net Profit</td><td>${netProfit}</td></tr>
    </table>

    <h2>Balance Sheet</h2>
    <table class="table">
      <tr><th>Category</th><th>Amount</th></tr>
      <tr><td>Assets</td><td>${assets}</td></tr>
      <tr><td>Liabilities</td><td>${liabilities}</td></tr>
      <tr><td>Equity</td><td>${equity}</td></tr>
    </table>

    <p><a class="btn" href="${pageContext.request.contextPath}/report">Back to Dashboard</a></p>
  </div>
</body>
</html>
