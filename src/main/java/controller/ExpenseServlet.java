package controller;

import dao.ExpenseDAO;
import dao.BranchDAO;
import model.Expense;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.math.BigDecimal;

public class ExpenseServlet extends HttpServlet {
    private ExpenseDAO dao = new ExpenseDAO();
    private BranchDAO branchDao = new BranchDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");
        String bid = req.getParameter("branchId");

        try {
            int branchId = (bid != null) ? Integer.parseInt(bid) : 0;

            if ("edit".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                Expense expense = dao.findById(id);
                req.setAttribute("expense", expense);
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/expenses?branchId=" + branchId);
                return;
            }

            // Load branch and expenses for display
            req.setAttribute("branch", branchDao.findById(branchId));
            req.setAttribute("expenses", dao.findByBranch(branchId));

            // ✅ Forward to one JSP only
            req.getRequestDispatcher("/WEB-INF/views/expenses.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
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
