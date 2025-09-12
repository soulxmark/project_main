package dao;
import model.Branch;
import util.DBConnection;
import java.sql.*;
import java.util.*;

public class BranchDAO {
    public void insertBranch(Branch branch) {
        String sql = "INSERT INTO branch (name, location) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, branch.getName());
            ps.setString(2, branch.getLocation());
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    public List<Branch> getAllBranches() {
        List<Branch> list = new ArrayList<>();
        String sql = "SELECT * FROM branch";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new Branch(rs.getInt("branch_id"), rs.getString("name"), rs.getString("location")));
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public void deleteBranch(int id) {
        String sql = "DELETE FROM branch WHERE branch_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }
}
