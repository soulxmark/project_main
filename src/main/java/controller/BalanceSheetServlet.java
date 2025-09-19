package com.example.controller;

import com.example.dao.BalanceSheetDAO;
import com.example.dao.BranchDAO;
import com.example.model.BalanceSheet;
import com.example.model.Branch;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.math.BigDecimal;

public class BalanceSheetServlet extends HttpServlet {
    private BalanceSheetDAO dao = new BalanceSheetDAO();
    private BranchDAO branchDao = new BranchDAO();

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        String bid = req.getParameter("branchId");
        try {
            if ("new".equals(action)) {
                int branchId = Integer.parseInt(bid);
                req.setAttribute("branchId", branchId);
                req.getRequestDispatcher("/WEB-INF/views/balance-form.jsp").forward(req, resp);
                return;
            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(req.getParameter("id"));
                dao.delete(id);
                resp.sendRedirect(req.getContextPath() + "/balances?branchId=" + req.getParameter("branchId"));
                return;
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        int branchId = bid != null ? Integer.parseInt(bid) : 0;
        req.setAttribute("balances", dao.findByBranch(branchId));
        if (branchId != 0) req.setAttribute("branch", branchDao.findById(branchId));
        req.getRequestDispatcher("/WEB-INF/views/balanceSheet.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        int branchId = Integer.parseInt(req.getParameter("branchId"));
        String category = req.getParameter("category");
        String desc = req.getParameter("description");
        BigDecimal amount = new BigDecimal(req.getParameter("amount"));
        LocalDate txnDate = LocalDate.parse(req.getParameter("txnDate"));

        BalanceSheet b = new BalanceSheet();
        if (idStr != null && !idStr.isEmpty()) b.setId(Integer.parseInt(idStr));
        b.setBranchId(branchId);
        b.setCategory(category);
        b.setDescription(desc);
        b.setAmount(amount);
        b.setTxnDate(txnDate);
        dao.save(b);
        resp.sendRedirect(req.getContextPath() + "/balances?branchId=" + branchId);
    }
}
