<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Branches</title>
  <meta charset="utf-8" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1>Branch Management</h1>

    <h2>All Branches</h2>
    <table class="branch-table">
      <thead>
        <tr><th>ID</th><th>Name</th><th>Actions</th></tr>
      </thead>
      <tbody>
        <c:forEach var="branch" items="${branches}">
          <tr>
            <td>${branch.id}</td>
            <td>${branch.name}</td>
            <td>
              <a class="btn" href="${pageContext.request.contextPath}/branches?action=edit&id=${branch.id}">Edit</a>
              <a class="btn delete" href="${pageContext.request.contextPath}/branches?action=delete&id=${branch.id}">Delete</a>
            </td>
          </tr>
        </c:forEach>
      </tbody>
    </table>

    <h2>Add New Branch</h2>
    <form method="post" action="${pageContext.request.contextPath}/branches">
      <input type="hidden" name="action" value="add" />
      <label for="name">Branch Name:</label>
      <input type="text" id="name" name="name" required />
      <button type="submit">Add Branch</button>
    </form>

    <div class="links">
      <a class="btn" href="${pageContext.request.contextPath}/report">Back to Dashboard</a>
    </div>
  </div>
</body>
</html>
