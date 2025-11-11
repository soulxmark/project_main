package controller;

import dao.BalanceSheetDAO;
import dao.BranchDAO;
import dao.ReportDAO;
import model.Branch;
import model.BranchPerformance;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

public class ReportServlet extends HttpServlet {

    private ReportDAO reportDAO = new ReportDAO();
    private BalanceSheetDAO bsDao = new BalanceSheetDAO();
    private BranchDAO branchDao = new BranchDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        String role = (user != null) ? user.getRole() : null;

        // If user is not logged in, show landing page
        if (user == null) {
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        // Only logged-in users continue
        BigDecimal totalIncome = reportDAO.getTotalIncome();
        BigDecimal totalExpense = reportDAO.getTotalExpense();
        BigDecimal netProfit = totalIncome.subtract(totalExpense);

        List<BranchPerformance> performance = reportDAO.getBranchPerformance();

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

        // set attributes
        req.setAttribute("totalIncome", totalIncome);
        req.setAttribute("totalExpense", totalExpense);
        req.setAttribute("netProfit", netProfit);
        req.setAttribute("performance", performance);
        req.setAttribute("assets", assets);
        req.setAttribute("liabilities", liabilities);
        req.setAttribute("equity", equity);
        req.setAttribute("branches", branches);

        // Forward based on role
        String dashboardJSP;
        switch (role.toLowerCase()) {
            case "admin":
                dashboardJSP = "/WEB-INF/views/adminDashboard.jsp";
                break;
            case "manager":
                dashboardJSP = "/WEB-INF/views/managerDashboard.jsp";
                break;
            case "staff":
                dashboardJSP = "/WEB-INF/views/staffDashboard.jsp";
                break;
            default:
                resp.sendRedirect(req.getContextPath() + "/login.jsp");
                return;
        }

        req.getRequestDispatcher(dashboardJSP).forward(req, resp);
    }
}
