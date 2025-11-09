package dao;

import model.Expense;
import util.DBConnection;

import java.sql.*;

import java.util.ArrayList;
import java.util.List;

public class ExpenseDAO {

    public List<Expense> findByBranch(int branchId) {
        String sql = "SELECT id, branch_id, description, amount, txn_date FROM expense WHERE branch_id = ? ORDER BY txn_date DESC";
        List<Expense> list = new ArrayList<>();
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, branchId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new Expense(
                        rs.getInt("id"),
                        rs.getInt("branch_id"),
                        rs.getString("description"),
                        rs.getBigDecimal("amount"),
                        rs.getDate("txn_date").toLocalDate()
                    ));
                }
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return list;
    }

    public Expense findById(int id) {
        String sql = "SELECT id, branch_id, description, amount, txn_date FROM expense WHERE id = ?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Expense(
                        rs.getInt("id"),
                        rs.getInt("branch_id"),
                        rs.getString("description"),
                        rs.getBigDecimal("amount"),
                        rs.getDate("txn_date").toLocalDate()
                    );
                }
            }
        } catch (SQLException e) { throw new RuntimeException(e); }
        return null;
    }

    public void save(Expense e) {
        if (e.getId() > 0) {
            String sql = "UPDATE expense SET branch_id=?, description=?, amount=?, txn_date=? WHERE id=?";
            try (Connection c = DBConnection.getConnection();
                 PreparedStatement ps = c.prepareStatement(sql)) {
                ps.setInt(1, e.getBranchId());
                ps.setString(2, e.getDescription());
                ps.setBigDecimal(3, e.getAmount());
                ps.setDate(4, Date.valueOf(e.getTxnDate()));
                ps.setInt(5, e.getId());
                ps.executeUpdate();
            } catch (SQLException ex) { throw new RuntimeException(ex); }
        } else {
            String sql = "INSERT INTO expense (branch_id, description, amount, txn_date) VALUES (?, ?, ?, ?)";
            try (Connection c = DBConnection.getConnection();
                 PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                ps.setInt(1, e.getBranchId());
                ps.setString(2, e.getDescription());
                ps.setBigDecimal(3, e.getAmount());
                ps.setDate(4, Date.valueOf(e.getTxnDate()));
                ps.executeUpdate();
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) e.setId(rs.getInt(1));
                }
            } catch (SQLException ex) { throw new RuntimeException(ex); }
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM expense WHERE id=?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }
}
