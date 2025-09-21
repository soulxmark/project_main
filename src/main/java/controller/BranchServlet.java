package controller;

import dao.BranchDAO;
import model.Branch;

import javax.servlet.ServletException;
import javax.servlet.http.*;
//import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

public class BranchServlet extends HttpServlet {
    private BranchDAO dao = new BranchDAO();

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        try {
            if ("new".equals(action)) {
                req.getRequestDispatcher("/WEB-INF/views/branch-form.jsp").forward(req, resp);
                return;
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Branch b = dao.findById(id);
                req.setAttribute("branch", b);
                req.getRequestDispatcher("/WEB-INF/views/branch-form.jsp").forward(req, resp);
                return;
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/branches");
                return;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        List<Branch> list = dao.findAll();
        req.setAttribute("branches", list);
        req.getRequestDispatcher("/WEB-INF/views/branches.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String location = req.getParameter("location");
        Branch b = new Branch();
        if (idStr != null && !idStr.isEmpty()) b.setId(Integer.parseInt(idStr));
        b.setName(name);
        b.setLocation(location);
        dao.save(b);
        resp.sendRedirect(req.getContextPath() + "/branches");
    }
}
