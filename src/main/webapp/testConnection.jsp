<%@ page import="java.sql.*, utils.DBConnection" %>
<html>
<head><title>DB Test</title></head>
<body>
<%
    try (Connection conn = DBConnection.getConnection()) {
        out.println("<h3>✅ Connection successful to Oracle Database!</h3>");
        
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT name, open_mode FROM v$pdbs");
        while (rs.next()) {
            out.println("<p>" + rs.getString("name") + " - " + rs.getString("open_mode") + "</p>");
        }
    } catch (Exception e) {
        out.println("<h3>❌ Connection failed: " + e.getMessage() + "</h3>");
        e.printStackTrace(out);
    }
%>
</body>
</html>
