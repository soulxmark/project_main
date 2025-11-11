package controller;

import dao.UserDAO;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User user = userDAO.login(username, password);

        if (user != null) {
            // Save user in session
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("role", user.getRole());

            // Redirect to dashboard based on role
            switch (user.getRole().toLowerCase()) {
                case "admin":
                    resp.sendRedirect(req.getContextPath() + "/adminDashboard");
                    break;
                case "manager":
                    resp.sendRedirect(req.getContextPath() + "/managerDashboard");
                    break;
                case "staff":
                    resp.sendRedirect(req.getContextPath() + "/staffDashboard");
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/login.jsp");
            }

        } else {
            // Invalid login
            req.setAttribute("error", "Invalid username or password!");
            req.getRequestDispatcher("/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}
