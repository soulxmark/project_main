package dao;

import model.BalanceSheet;
import util.DBConnection;

import java.sql.*;
//import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class BalanceSheetDAO {

    public List<BalanceSheet> findByBranch(int branchId) {
        String sql = "SELECT id, branch_id, category, description, amount, txn_date FROM balance_sheet WHERE branch_id = ? ORDER BY txn_date DESC";
        List<BalanceSheet> list = new ArrayList<>();
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, branchId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    BalanceSheet b = new BalanceSheet(rs.getInt("id"), rs.getInt("branch_id"), rs.getString("category"),
                            rs.getString("description"), rs.getBigDecimal("amount"), rs.getDate("txn_date").toLocalDate());
                    list.add(b);
                }
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return list;
    }

    public void save(BalanceSheet b) {
        if (b.getId() > 0) {
            String sql = "UPDATE balance_sheet SET branch_id=?, category=?, description=?, amount=?, txn_date=? WHERE id=?";
            try (Connection c = DBConnection.getConnection();
                 PreparedStatement ps = c.prepareStatement(sql)) {
                ps.setInt(1, b.getBranchId());
                ps.setString(2, b.getCategory());
                ps.setString(3, b.getDescription());
                ps.setBigDecimal(4, b.getAmount());
                ps.setDate(5, Date.valueOf(b.getTxnDate()));
                ps.setInt(6, b.getId());
                ps.executeUpdate();
            } catch (SQLException e) { throw new RuntimeException(e); }
        } else {
            String sql = "INSERT INTO balance_sheet (branch_id, category, description, amount, txn_date) VALUES (?, ?, ?, ?, ?)";
            try (Connection c = DBConnection.getConnection();
                 PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, b.getBranchId());
                ps.setString(2, b.getCategory());
                ps.setString(3, b.getDescription());
                ps.setBigDecimal(4, b.getAmount());
                ps.setDate(5, Date.valueOf(b.getTxnDate()));
                ps.executeUpdate();
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) b.setId(rs.getInt(1));
                }
            } catch (SQLException e) { throw new RuntimeException(e); }
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM balance_sheet WHERE id=?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }

    public BigDecimal getTotalByCategory(String category) {
        String sql = "SELECT COALESCE(SUM(amount),0) as total FROM balance_sheet WHERE category = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, category);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getBigDecimal("total");
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return BigDecimal.ZERO;
    }
}
