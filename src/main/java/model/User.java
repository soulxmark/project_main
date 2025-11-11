package model;

public class User {
    private int id;
    private String username;
    private String password;
    private String role;
    private String nameManager;

    // Full-arg constructor
    public User(int id, String username, String password, String role, String nameManager) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.nameManager = nameManager;
    }

    // No-arg constructor
    public User() {}

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getNameManager() { return nameManager; }
    public void setNameManager(String nameManager) { this.nameManager = nameManager; }
}
