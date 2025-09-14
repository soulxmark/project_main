package com.example.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class BalanceSheet {
    private int id;
    private int branchId;
    private String category; // Asset | Liability | Equity
    private String description;
    private BigDecimal amount;
    private LocalDate txnDate;

    public BalanceSheet() {}

    public BalanceSheet(int id, int branchId, String category, String description, BigDecimal amount, LocalDate txnDate) {
        this.id = id; this.branchId = branchId; this.category = category;
        this.description = description; this.amount = amount; this.txnDate = txnDate;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getBranchId() { return branchId; }
    public void setBranchId(int branchId) { this.branchId = branchId; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public BigDecimal getAmount() { return amount; }
    public void setAmount(BigDecimal amount) { this.amount = amount; }

    public java.time.LocalDate getTxnDate() { return txnDate; }
    public void setTxnDate(java.time.LocalDate txnDate) { this.txnDate = txnDate; }
}
