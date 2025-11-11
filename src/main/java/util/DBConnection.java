package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
    private static final String URL = "jdbc:postgresql://localhost:5432/financialdb";
    private static final String USER = "postgres";
    private static final String PASS = "admin45";

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Postgres JDBC Driver not found!", e);
        }
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = DriverManager.getConnection(URL, USER, PASS);
        try (Statement stmt = conn.createStatement()) {
            stmt.execute("SET search_path TO public");
        }
        return conn;
    }
}
