<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Expenses</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
<div class="container">
    <h1>Expenses - ${branch.name}</h1>

    <!-- ✅ Add/Edit Form -->
    <h2>
        <c:choose>
            <c:when test="${not empty expense}">Edit Expense</c:when>
            <c:otherwise>Add Expense</c:otherwise>
        </c:choose>
    </h2>

    <form method="post" action="${pageContext.request.contextPath}/expenses">
        <input type="hidden" name="id" value="${expense.id}" />
        <input type="hidden" name="branchId" value="${branch.id}" />

        <label>Description:</label>
        <input type="text" name="description" value="${expense.description}" required />

        <label>Amount:</label>
        <input type="number" step="0.01" name="amount" value="${expense.amount}" required />

        <label>Date:</label>
        <input type="date" name="txnDate" value="${expense.txnDate}" required />

        <button type="submit" class="btn">
            <c:choose>
                <c:when test="${not empty expense}">Update</c:when>
                <c:otherwise>Add</c:otherwise>
            </c:choose>
        </button>
        <a class="btn" href="${pageContext.request.contextPath}/expenses?branchId=${branch.id}">Cancel</a>
    </form>

    <hr/>

    <!-- ✅ Expense Table -->
    <table class="table">
        <tr><th>ID</th><th>Description</th><th>Amount</th><th>Date</th><th>Action</th></tr>
        <c:forEach var="e" items="${expenses}">
            <tr>
                <td>${e.id}</td>
                <td>${e.description}</td>
                <td>${e.amount}</td>
                <td>${e.txnDate}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/expenses?action=edit&id=${e.id}&branchId=${branch.id}">Edit</a> |
                    <a href="${pageContext.request.contextPath}/expenses?action=delete&id=${e.id}&branchId=${branch.id}" onclick="return confirm('Delete this expense?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <p><a class="btn" href="${pageContext.request.contextPath}/branches">Back to Branches</a></p>
</div>
</body>
</html>
