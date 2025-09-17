package com.example.controller;

import com.example.dao.ReportDAO;
import com.example.model.BranchPerformance;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private final ReportDAO dao = new ReportDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        BigDecimal totalIncome = dao.getTotalIncome();
        BigDecimal totalExpense = dao.getTotalExpense();
        BigDecimal netProfit = totalIncome.subtract(totalExpense);

        List<BranchPerformance> performance = dao.getBranchPerformance();

        req.setAttribute("totalIncome", totalIncome);
        req.setAttribute("totalExpense", totalExpense);
        req.setAttribute("netProfit", netProfit);
        req.setAttribute("performance", performance);

        // temporary placeholders so JSP won't break
        req.setAttribute("assets", BigDecimal.ZERO);
        req.setAttribute("liabilities", BigDecimal.ZERO);
        req.setAttribute("equity", BigDecimal.ZERO);

        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
    }
}
