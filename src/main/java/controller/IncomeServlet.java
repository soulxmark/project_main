package controller;
// Make this case Method
import dao.IncomeDAO;
import dao.BranchDAO;
import model.Income;
import model.Branch;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
//import java.util.List;
import java.math.BigDecimal;

public class IncomeServlet extends HttpServlet {
    private IncomeDAO dao = new IncomeDAO();
    private BranchDAO branchDao = new BranchDAO();

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String bid = req.getParameter("branchId");
        try {
            if ("new".equals(action)) {
                int branchId = Integer.parseInt(bid);
                req.setAttribute("branchId", branchId);
                req.getRequestDispatcher("/WEB-INF/views/income-form.jsp").forward(req, resp);
                return;
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Income t = dao.findById(id);
                req.setAttribute("income", t);
                req.getRequestDispatcher("/WEB-INF/views/income-form.jsp").forward(req, resp);
                return;
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/incomes?branchId=" + req.getParameter("branchId"));
                return;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        int branchId = bid != null ? Integer.parseInt(bid) : 0;
        if (branchId == 0) {
            // show incomes across all branches (optional)
            req.setAttribute("incomes", dao.findByBranch(0)); // returns empty; you can add findAll later
        } else {
            req.setAttribute("incomes", dao.findByBranch(branchId));
            Branch branch = branchDao.findById(branchId);
            req.setAttribute("branch", branch);
        }
        req.getRequestDispatcher("/WEB-INF/views/incomes.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        int branchId = Integer.parseInt(req.getParameter("branchId"));
        String desc = req.getParameter("description");
        BigDecimal amount = new BigDecimal(req.getParameter("amount"));
        LocalDate txnDate = LocalDate.parse(req.getParameter("txnDate"));

        Income i = new Income();
        if (idStr != null && !idStr.isEmpty()) i.setId(Integer.parseInt(idStr));
        i.setBranchId(branchId);
        i.setDescription(desc);
        i.setAmount(amount);
        i.setTxnDate(txnDate);
        dao.save(i);
        resp.sendRedirect(req.getContextPath() + "/incomes?branchId=" + branchId);
    }
}