package controller;
import dao.BranchDAO;
import model.Branch;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class BranchController extends HttpServlet {
    private BranchDAO dao = new BranchDAO();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("add".equals(action)) {
            Branch b = new Branch();
            b.setName(req.getParameter("name"));
            b.setLocation(req.getParameter("location"));
            dao.insertBranch(b);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.deleteBranch(id);
        }
        resp.sendRedirect("branch.jsp");
    }
}
