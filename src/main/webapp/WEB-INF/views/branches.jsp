<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Branches</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>Branches</h1>

    <!-- Branch Form (Create / Edit) -->
    <div style="background: #f5f5f5; padding: 20px; margin-bottom: 20px; border-radius: 5px;">
        <h2>
            <c:choose>
                <c:when test="${not empty branch}">Edit Branch</c:when>
                <c:otherwise>Create New Branch</c:otherwise>
            </c:choose>
        </h2>
        <form method="post" action="${pageContext.request.contextPath}/branches">
            <c:if test="${branch.id > 0}">
                <input type="hidden" name="id" value="${branch.id}">
            </c:if>

            <label>Name:</label>
            <input type="text" name="name" value="${branch.name}" required style="margin-right: 10px;">

            <label>Location:</label>
            <input type="text" name="location" value="${branch.location}" required style="margin-right: 10px;">

            <label>Role:</label>
            <select name="role" required style="margin-right: 10px;">
                <option value="Admin" <c:if test="${branch.role=='Admin'}">selected</c:if>>Admin</option>
                <option value="Manager" <c:if test="${branch.role=='Manager'}">selected</c:if>>Manager</option>
                <option value="Staff" <c:if test="${branch.role=='Staff'}">selected</c:if>>Staff</option>
            </select>

            <label>Manager Name:</label>
            <input type="text" name="nameManager" value="${branch.nameManager}" 
       style="margin-right: 10px;">

            <button type="submit" class="btn">
                <c:choose>
                    <c:when test="${not empty branch}">Update Branch</c:when>
                    <c:otherwise>Create Branch</c:otherwise>
                </c:choose>
            </button>
        </form>
    </div>

    <!-- Branches Table -->
    <h2>All Branches</h2>
    <table class="table">
        <tr>
            <th>ID</th><th>Name</th><th>Location</th><th>Role</th><th>Manager</th><th>Actions</th>
        </tr>
        <c:forEach var="b" items="${branches}">
            <tr>
                <td>${b.id}</td>
                <td>${b.name}</td>
                <td>${b.location}</td>
                <td>${b.role}</td>
                <td>${b.nameManager}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/branches?action=edit&id=${b.id}">Edit</a> |
                    <a href="${pageContext.request.contextPath}/branches?action=delete&id=${b.id}" onclick="return confirm('Delete branch?')">Delete</a> |
                    <a href="${pageContext.request.contextPath}/incomes?branchId=${b.id}">Incomes</a> |
                    <a href="${pageContext.request.contextPath}/expenses?branchId=${b.id}">Expenses</a> |
                    <a href="${pageContext.request.contextPath}/balances?branchId=${b.id}">Balance Items</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <p><a class="btn" href="${pageContext.request.contextPath}/report">Back to Dashboard</a></p>
  </div>
</body>
</html>
