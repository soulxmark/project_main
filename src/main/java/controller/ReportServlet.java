    package com.example.controller;

    import com.example.dao.ReportDAO;
    import com.example.model.BranchPerformance;

    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.*;
    import java.io.IOException;
    import java.math.BigDecimal;
    import java.util.List;

    @WebServlet("/report")
    public class ReportServlet extends HttpServlet {
        private final ReportDAO dao = new ReportDAO();

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
                throws ServletException, IOException {

            BigDecimal totalIncome = dao.getTotalIncome();
            BigDecimal totalExpense = dao.getTotalExpense();
            List<BranchPerformance> branches = dao.getBranchPerformance();

            req.setAttribute("totalIncome", totalIncome);
            req.setAttribute("totalExpense", totalExpense);
            req.setAttribute("branches", branches);

            req.getRequestDispatcher("/report.jsp").forward(req, resp);
        }
    }
