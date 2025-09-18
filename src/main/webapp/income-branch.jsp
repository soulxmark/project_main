<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Branch Form</title>
  <link rel="stylesheet" href="$style/dashboard.css">
</head>
<body>
  <div class="container">
    <h1><c:choose><c:when test="${not empty branch}">Edit Branch</c:when><c:otherwise>New Branch</c:otherwise></c:choose></h1>
    <form action="${pageContext.request.contextPath}/branches" method="post">
      <input type="hidden" name="id" value="${branch.id}" />
      <label>Name</label><br/>
      <input type="text" name="name" value="${branch.name}" required/><br/>
      <label>Location</label><br/>
      <input type="text" name="location" value="${branch.location}" /><br/><br/>
      <button type="submit" class="btn">Save</button>
      <a class="btn" href="${pageContext.request.contextPath}/branches">Cancel</a>
    </form>
  </div>
</body>
</html>
