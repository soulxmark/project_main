package model;

import java.util.Date;

public class Report {
     private int id;
    private int branchId;
    private double income;
    private double expense;
    private Date reportDate;

    // Constructors
    public Report() {}

    public Report(int id, int branchId, double income, double expense, Date reportDate) {
        this.id = id;
        this.branchId = branchId;
        this.income = income;
        this.expense = expense;
        this.reportDate = reportDate;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getBranchId() { return branchId; }
    public void setBranchId(int branchId) { this.branchId = branchId; }

    public double getIncome() { return income; }
    public void setIncome(double income) { this.income = income; }

    public double getExpense() { return expense; }
    public void setExpense(double expense) { this.expense = expense; }

    public Date getReportDate() { return reportDate; }
    public void setReportDate(Date reportDate) { this.reportDate = reportDate; }
}
