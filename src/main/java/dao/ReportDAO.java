package dao;

import model.BranchPerformance;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class ReportDAO {
    // returns total income across all branches
    public BigDecimal getTotalIncome() {
        String sql = "SELECT COALESCE(SUM(amount),0) as total FROM income";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getBigDecimal("total");
        } catch (SQLException e) { throw new RuntimeException(e); }
        return BigDecimal.ZERO;
    }

    // returns total expense across all branches
    public BigDecimal getTotalExpense() {
        String sql = "SELECT COALESCE(SUM(amount),0) as total FROM expense";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getBigDecimal("total");
        } catch (SQLException e) { throw new RuntimeException(e); }
        return BigDecimal.ZERO;
    }

    // branch-level performance (income, expense, profit)
    public List<BranchPerformance> getBranchPerformance() {
        String sql = "SELECT b.id, b.name, COALESCE(SUM(i.amount),0) as total_income, COALESCE(SUM(e.amount),0) as total_expense " +
                "FROM branch b " +
                "LEFT JOIN income i ON b.id = i.branch_id " +
                "LEFT JOIN expense e ON b.id = e.branch_id " +
                "GROUP BY b.id, b.name " +
                "ORDER BY b.id";
        List<BranchPerformance> list = new ArrayList<>();
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                BranchPerformance bp = new BranchPerformance();
                bp.setBranchName(rs.getString("name"));
                BigDecimal inc = rs.getBigDecimal("total_income") == null ? BigDecimal.ZERO : rs.getBigDecimal("total_income");
                BigDecimal exp = rs.getBigDecimal("total_expense") == null ? BigDecimal.ZERO : rs.getBigDecimal("total_expense");
                bp.setIncome(inc);
                bp.setExpense(exp);
                bp.setProfit(inc.subtract(exp));
                list.add(bp);
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return list;
    }
}
