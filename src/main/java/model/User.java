package model;

import java.util.Objects;

public class User {
    private int id;
    private String username;
    private String password;
    private String role;
    private String nameManager; // if you have this in your table

    // Constructors
    public User() {}

    public User(int id, String username, String password, String role, String nameManager) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.role = role;
        this.nameManager = nameManager;
    }

    // Getters and Setters
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

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", role='" + role + '\'' +
                ", nameManager='" + nameManager + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof User)) return false;
        User user = (User) o;
        return id == user.id &&
               Objects.equals(username, user.username);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, username);
    }
}
