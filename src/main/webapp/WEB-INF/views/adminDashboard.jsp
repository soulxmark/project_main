<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<html>
<head>
  <title>Dashboard Admin</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
  <!-- Top right user dropdown -->
  <div style="position:absolute; top:10px; right:20px;">
    <div style="position: relative; display: inline-block;">
      <button style="background-color: #333; color: white; border: none; padding: 8px 12px; cursor: pointer;">
        <%= user.getNameManager() %> ▼
      </button>
      <div style="display: none; position: absolute; right: 0; background: #f1f1f1; border-radius: 5px;">
        <a href="#" style="display: block; padding: 5px 10px;">Login Info</a>
        <a href="<%= request.getContextPath() %>/logout" style="display: block; padding: 5px 10px;">Sign Out</a>
      </div>
    </div>
  </div>

  <div class="container">
    <h1>Relx Admin Dashboard</h1>
    <h2>Welcome, <%= user.getNameManager() != null ? user.getNameManager() : user.getUsername() %>!</h2>

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

    <!-- Branch Performance Table -->
    <h2>Branch Performance (comparative)</h2>
    <table class="perf-table">
      <thead>
        <tr>
          <th>Branch</th><th>Income</th><th>Expense</th><th>Profit</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="bp" items="${performance}">
          <tr>
            <td>${bp.branchName}</td>
            <td>
              <div class="bar-wrap">
                <div class="bar income-bar w-${bp.incomePct}">
                  <span class="bar-label">${bp.income}</span>
                </div>
              </div>
            </td>
            <td>
              <div class="bar-wrap">
                <div class="bar expense-bar w-${bp.expensePct}">
                  <span class="bar-label">${bp.expense}</span>
                </div>
              </div>
            </td>
            <td>
              <div class="bar-wrap">
                <div class="bar profit-bar w-${bp.profitPct}">
                  <span class="bar-label">${bp.profit}</span>
                </div>
              </div>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <!-- Balance Sheet Overview -->
    <h2>Balance Sheet Overview</h2>
    <div class="summary">
      <div class="card asset"><h4>Assets</h4><p class="amount">${assets}</p></div>
      <div class="card liability"><h4>Liabilities</h4><p class="amount">${liabilities}</p></div>
      <div class="card equity"><h4>Equity</h4><p class="amount">${equity}</p></div>
    </div>
  </div>
</body>
</html>
