<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Balance Item Form</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>New Balance Item</h1>
    <form method="post" action="${pageContext.request.contextPath}/balances">
      <input type="hidden" name="branchId" value="${param.branchId}" />
      <label>Category</label><br/>
      <select name="category">
        <option value="Asset">Asset</option>
        <option value="Liability">Liability</option>
        <option value="Equity">Equity</option>
      </select><br/>
      <label>Description</label><br/>
      <input type="text" name="description" /><br/>
      <label>Amount</label><br/>
      <input type="number" step="0.01" name="amount" /><br/>
      <label>Date</label><br/>
      <input type="date" name="txnDate" value="${pageContext.request.focus}" /><br/><br/>
      <button type="submit" class="btn">Save</button>
      <a class="btn" href="${pageContext.request.contextPath}/balances?branchId=${param.branchId}">Cancel</a>
    </form>
  </div>
</body>
</html>
