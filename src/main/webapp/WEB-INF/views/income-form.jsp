<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Income Form</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1><c:choose><c:when test="${not empty income}">Edit Income</c:when><c:otherwise>New Income</c:otherwise></c:choose></h1>
    <form method="post" action="${pageContext.request.contextPath}/incomes">
      <c:if test="${income.id > 0}"><input type="hidden" name="id" value="${income.id}" /></c:if>
      <input type="hidden" name="branchId" value="${param.branchId != null ? param.branchId : income.branchId}" />
      <label>Description</label><br/>
      <input type="text" name="description" value="${income.description}" required/><br/>
      <label>Amount</label><br/>
      <input type="number" step="0.01" name="amount" value="${income.amount}" required/><br/>
      <label>Date</label><br/>
      <input type="date" name="txnDate" value="${income.txnDate}" required/><br/><br/>
      <button type="submit" class="btn">Save</button>
      <a class="btn" href="${pageContext.request.contextPath}/incomes?branchId=${param.branchId != null ? param.branchId : income.branchId}">Cancel</a>
    </form>
  </div>
</body>
</html>