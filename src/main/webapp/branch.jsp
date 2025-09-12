<%@ page import="dao.BranchDAO,model.Branch,java.util.*" %>
<%
    BranchDAO dao = new BranchDAO();
    List<Branch> list = dao.getAllBranches();
%>
<html>
<head>
  <title>Branches</title>
  <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>
  <h1>Branch Management</h1>
  <form action="BranchController" method="post">
    <input type="hidden" name="action" value="add"/>
    Name: <input type="text" name="name"/>
    Location: <input type="text" name="location"/>
    <button type="submit">Add Branch</button>
  </form>

  <table>
    <tr><th>ID</th><th>Name</th><th>Location</th><th>Action</th></tr>
    <% for (Branch b : list) { %>
      <tr>
        <td><%= b.getBranchId() %></td>
        <td><%= b.getName() %></td>
        <td><%= b.getLocation() %></td>
        <td>
          <form action="BranchController" method="post" style="display:inline">
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="id" value="<%= b.getBranchId() %>"/>
            <button type="submit">Delete</button>
          </form>
        </td>
      </tr>
    <% } %>
  </table>
</body>
</html>
