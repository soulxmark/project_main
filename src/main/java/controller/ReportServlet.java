package controller;

import dao.ReportDAO;
import dao.BalanceSheetDAO;
import dao.BranchDAO;
import model.Branch;
import model.BranchPerformance;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;
import java.math.BigDecimal;

public class ReportServlet extends HttpServlet {
    private ReportDAO reportDAO = new ReportDAO();
    private BalanceSheetDAO bsDao = new BalanceSheetDAO();
    private BranchDAO branchDao = new BranchDAO();

    @Override
    protected void doGet(javax.servlet.http.HttpServletRequest req, javax.servlet.http.HttpServletResponse resp) throws ServletException, IOException {
        BigDecimal totalIncome = reportDAO.getTotalIncome();
        BigDecimal totalExpense = reportDAO.getTotalExpense();
        BigDecimal netProfit = totalIncome.subtract(totalExpense);

        List<BranchPerformance> performance = reportDAO.getBranchPerformance();

        // compute percentages for bar widths
        for (BranchPerformance bp : performance) {
            double incPct = totalIncome.compareTo(BigDecimal.ZERO) == 0 ? 0.0
                    : bp.getIncome().doubleValue() * 100.0 / totalIncome.doubleValue();
            double expPct = totalExpense.compareTo(BigDecimal.ZERO) == 0 ? 0.0
                    : bp.getExpense().doubleValue() * 100.0 / totalExpense.doubleValue();
            double profPct = netProfit.compareTo(BigDecimal.ZERO) == 0 ? 0.0
                    : bp.getProfit().doubleValue() * 100.0 / (Math.abs(netProfit.doubleValue()) < 1e-9 ? 1 : netProfit.doubleValue());
            bp.setIncomePct(incPct);
            bp.setExpensePct(expPct);
            bp.setProfitPct(profPct);
        }

        // balance sheet totals
        BigDecimal assets = bsDao.getTotalByCategory("Asset");
        BigDecimal liabilities = bsDao.getTotalByCategory("Liability");
        BigDecimal equity = bsDao.getTotalByCategory("Equity");

        List<Branch> branches = branchDao.findAll();

        req.setAttribute("totalIncome", totalIncome);
        req.setAttribute("totalExpense", totalExpense);
        req.setAttribute("netProfit", netProfit);
        req.setAttribute("performance", performance);
        req.setAttribute("assets", assets);
        req.setAttribute("liabilities", liabilities);
        req.setAttribute("equity", equity);
        req.setAttribute("branches", branches);

        req.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(req, resp);
    }
}
