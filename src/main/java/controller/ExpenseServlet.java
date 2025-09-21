package controller;

import dao.ExpenseDAO;
import dao.BranchDAO;
import model.Expense;
import model.Branch;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.math.BigDecimal;

public class ExpenseServlet extends HttpServlet {
    private ExpenseDAO dao = new ExpenseDAO();
    private BranchDAO branchDao = new BranchDAO();

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String bid = req.getParameter("branchId");
        try {
            if ("new".equals(action)) {
                int branchId = Integer.parseInt(bid);
                req.setAttribute("branchId", branchId);
                req.getRequestDispatcher("/WEB-INF/views/expense-form.jsp").forward(req, resp);
                return;
            } else if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Expense t = dao.findById(id);
                req.setAttribute("expense", t);
                req.getRequestDispatcher("/WEB-INF/views/expense-form.jsp").forward(req, resp);
                return;
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/expenses?branchId=" + req.getParameter("branchId"));
                return;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        int branchId = bid != null ? Integer.parseInt(bid) : 0;
        req.setAttribute("expenses", dao.findByBranch(branchId));
        if (branchId != 0) req.setAttribute("branch", branchDao.findById(branchId));
        req.getRequestDispatcher("/WEB-INF/views/expenses.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        int branchId = Integer.parseInt(req.getParameter("branchId"));
        String desc = req.getParameter("description");
        BigDecimal amount = new BigDecimal(req.getParameter("amount"));
        LocalDate txnDate = LocalDate.parse(req.getParameter("txnDate"));

        Expense e = new Expense();
        if (idStr != null && !idStr.isEmpty()) e.setId(Integer.parseInt(idStr));
        e.setBranchId(branchId);
        e.setDescription(desc);
        e.setAmount(amount);
        e.setTxnDate(txnDate);
        dao.save(e);
        resp.sendRedirect(req.getContextPath() + "/expenses?branchId=" + branchId);
    }
}
