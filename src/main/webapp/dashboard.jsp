<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Dashboard</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>Multi-Branch Financial Dashboard</h1>

    <div class="summary">
      <div class="card income">
        <h3>Total Income</h3>
        <p class="amount">${totalIncome}</p>
      </div>
      <div class="card expense">
        <h3>Total Expense</h3>
        <p class="amount">${totalExpense}</p>
      </div>
      <div class="card profit">
        <h3>Net Profit</h3>
        <p class="amount">${netProfit}</p>
      </div>
    </div>

    <h2>Branch Performance (comparative)</h2>
    <table class="perf-table">
      <thead><tr><th>Branch</th><th>Income</th><th>Expense</th><th>Profit</th></tr></thead>
      <tbody>
        <c:forEach var="bp" items="${performance}">
          <tr>
            <td>${bp.branchName}</td>
            <td>
              <div class="bar-wrap">
                <div class="bar income-bar" style="width:${bp.incomePct}%;">
                  <span class="bar-label">${bp.income}</span>
                </div>
              </div>
            </td>
            <td>
              <div class="bar-wrap">
                <div class="bar expense-bar" style="width:${bp.expensePct}%;">
                  <span class="bar-label">${bp.expense}</span>
                </div>
              </div>
            </td>
            <td>
              <div class="bar-wrap">
                <div class="bar profit-bar" style="width:${bp.profitPct}%;">
                  <span class="bar-label">${bp.profit}</span>
                </div>
              </div>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <h2>Balance Sheet Overview</h2>
    <div class="summary">
      <div class="card asset"><h4>Assets</h4><p class="amount">${assets}</p></div>
      <div class="card liability"><h4>Liabilities</h4><p class="amount">${liabilities}</p></div>
      <div class="card equity"><h4>Equity</h4><p class="amount">${equity}</p></div>
    </div>

    <div class="links">
      <a class="btn" href="${pageContext.request.contextPath}/branches">Manage Branches</a>
      <a class="btn" href="${pageContext.request.contextPath}/report?view=master">Master Financial Statement</a>
    </div>
  </div>
</body>
</html>
