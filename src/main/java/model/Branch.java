package model;

public class Branch {
    private int id;
    private String name;
    private String location;
    private String role;
    private String nameManager;

    public Branch() {} // default

    public Branch(int id, String name, String location, String role, String nameManager) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.role = role;
        this.nameManager = nameManager;
    }

    // getters & setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public String getNameManager() { return nameManager; }
    public void setNameManager(String nameManager) { this.nameManager = nameManager; }
}
