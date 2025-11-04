package controller;

import dao.UserDAO;
import model.User;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve login credentials
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create DAO and check credentials
        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(username, password); // use "login" method from UserDAO

        if (user != null) {
            // Create session for logged-in user
            HttpSession session = request.getSession();
            session.setAttribute("username", user.getUsername());
            session.setAttribute("role", user.getRole());
            session.setAttribute("nameManager", user.getNameManager());

            // Redirect by role
            switch (user.getRole().toLowerCase()) {
                case "admin":
                    response.sendRedirect("dashboard.jsp");
                    break;
                case "manager":
                    response.sendRedirect("manager.jsp");
                    break;
                case "staff":
                    response.sendRedirect("staff.jsp");
                    break;
                default:
                    response.sendRedirect("error.jsp");
                    break;
            }
        } else {
            // Invalid credentials — back to login
            request.setAttribute("error", "Invalid username or password");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
    }
}
