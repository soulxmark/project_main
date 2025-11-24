package util;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class RoleFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // no init needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("role") == null) {
            // Not logged in, redirect to login
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String role = (String) session.getAttribute("role");
        String uri = req.getRequestURI();

        // Check access for dashboards
        if (uri.endsWith("/adminDashboard") && !"admin".equalsIgnoreCase(role)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        if (uri.endsWith("/managerDashboard") && !"manager".equalsIgnoreCase(role)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        if (uri.endsWith("/staffDashboard") && !"staff".equalsIgnoreCase(role)) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        // For other protected pages (/branches, /incomes, /expenses, etc.), allow all logged-in users
        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // no destroy needed
    }
}