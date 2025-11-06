package dao;

import model.Branch;
import util.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BranchDAO {

    public List<Branch> findAll() {
        String sql = "SELECT id, name, location, role, name_manager FROM branch ORDER BY id";
        List<Branch> list = new ArrayList<>();
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Branch b = new Branch(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("location"),
                    rs.getString("role"),
                    rs.getString("name_manager")
                );
                list.add(b);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public Branch findById(int id) {
        String sql = "SELECT id, name, location, role, name_manager FROM branch WHERE id=?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Branch(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("location"),
                        rs.getString("role"),
                        rs.getString("name_manager")
                    );
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public void save(Branch b) {
        String sql;
        if (b.getId() > 0) {
            sql = "UPDATE branch SET name=?, location=?, role=?, name_manager=? WHERE id=?";
        } else {
            sql = "INSERT INTO branch (name, location, role, name_manager) VALUES (?, ?, ?, ?)";
        }

        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, b.getName());
            ps.setString(2, b.getLocation());
            ps.setString(3, b.getRole());
            ps.setString(4, b.getNameManager());

            if (b.getId() > 0) ps.setInt(5, b.getId());
            ps.executeUpdate();

            if (b.getId() <= 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) b.setId(rs.getInt(1));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void delete(int id) {
        String sql = "DELETE FROM branch WHERE id=?";
        try (Connection c = DBConnection.getConnection();
             PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) { throw new RuntimeException(e); }
    }
}
