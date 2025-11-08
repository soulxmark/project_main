<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Expense Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
<div class="container">
    <h1>
        <c:choose>
            <c:when test="${not empty expense}">Edit Expense</c:when>
            <c:otherwise>New Expense</c:otherwise>
        </c:choose>
    </h1>

    <form method="post" action="${pageContext.request.contextPath}/expenses">
        <input type="hidden" name="id" value="${expense.id}" />
        <input type="hidden" name="branchId" value="${branchId}" />

        <label>Description</label><br/>
        <input type="text" name="description" value="${expense.description}" required /><br/>

        <label>Amount</label><br/>
        <input type="number" step="0.01" name="amount" value="${expense.amount}" required /><br/>

        <label>Date</label><br/>
        <input type="date" name="txnDate" value="${expense.txnDate}" required /><br/><br/>

        <button type="submit" class="btn">Save</button>
        <a class="btn" href="${pageContext.request.contextPath}/expenses?branchId=${branchId}">Cancel</a>
    </form>
</div>
</body>
</html>
