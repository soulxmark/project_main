<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Expense Form</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
<div class="container">
    <c:choose>
        <c:when test="${not empty expense}">
            <h1>Edit Expense</h1>
        </c:when>
        <c:otherwise>
            <h1>New Expense</h1>
        </c:otherwise>
    </c:choose>

    <form method="post" action="${pageContext.request.contextPath}/expenses">
        <input type="hidden" name="branchId" value="${expense != null ? expense.branchId : branchId}" />
        <c:if test="${not empty expense}">
            <input type="hidden" name="id" value="${expense.id}" />
        </c:if>

        <label>Description</label><br/>
        <input type="text" name="description" value="${expense != null ? expense.description : ''}" required /><br/>

        <label>Amount</label><br/>
        <input type="number" step="0.01" name="amount" value="${expense != null ? expense.amount : ''}" required /><br/>

        <label>Date</label><br/>
        <input type="date" name="txnDate" value="${expense != null ? expense.txnDate : ''}" required /><br/><br/>

        <button type="submit" class="btn">Save</button>
        <a class="btn" href="${pageContext.request.contextPath}/expenses?branchId=${expense != null ? expense.branchId : branchId}">Cancel</a>
    </form>
</div>
</body>
</html>
