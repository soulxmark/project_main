package dao;

import model.Income;
import util.DBConnection;

import java.sql.*;
//import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.math.BigDecimal;

public class IncomeDAO {

    public List<Income> findByBranch(int branchId) {
        String sql = "SELECT id, branch_id, description, amount, txn_date FROM income WHERE branch_id = ? ORDER BY txn_date DESC";
        List<Income> list = new ArrayList<>();
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, branchId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Income i = new Income(rs.getInt("id"), rs.getInt("branch_id"), rs.getString("description"),
                            rs.getBigDecimal("amount"), rs.getDate("txn_date").toLocalDate());
                    list.add(i);
                }
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return list;
    }

    public Income findById(int id) {
        String sql = "SELECT id, branch_id, description, amount, txn_date FROM income WHERE id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Income(rs.getInt("id"), rs.getInt("branch_id"), rs.getString("description"),
                            rs.getBigDecimal("amount"), rs.getDate("txn_date").toLocalDate());
                }
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return null;
    }

    public void save(Income i) {
        if (i.getId() > 0) {
            String sql = "UPDATE income SET branch_id=?, description=?, amount=?, txn_date=? WHERE id=?";
            try (Connection c = DBConnection.getConnection();
                 PreparedStatement ps = c.prepareStatement(sql)) {
                ps.setInt(1, i.getBranchId());
                ps.setString(2, i.getDescription());
                ps.setBigDecimal(3, i.getAmount());
                ps.setDate(4, Date.valueOf(i.getTxnDate()));
                ps.setInt(5, i.getId());
                ps.executeUpdate();
            } catch (SQLException e) { throw new RuntimeException(e); }
        } else {
            String sql = "INSERT INTO income (branch_id, description, amount, txn_date) VALUES (?, ?, ?, ?)";
            try (Connection c = DBConnection.getConnection();
                 PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, i.getBranchId());
                ps.setString(2, i.getDescription());
                ps.setBigDecimal(3, i.getAmount());
                ps.setDate(4, Date.valueOf(i.getTxnDate()));
                ps.executeUpdate();
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) i.setId(rs.getInt(1));
                }
            } catch (SQLException e) { throw new RuntimeException(e); }
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM income WHERE id=?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }

    public BigDecimal getTotalIncome() {
        String sql = "SELECT COALESCE(SUM(amount),0) as total FROM income";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) return rs.getBigDecimal("total");
        } catch (SQLException e) { throw new RuntimeException(e); }
        return BigDecimal.ZERO;
    }
}
