package com.example.model;

import java.math.BigDecimal;

public class BranchPerformance {
    private String branchName;
    private BigDecimal income = BigDecimal.ZERO;
    private BigDecimal expense = BigDecimal.ZERO;
    private BigDecimal profit = BigDecimal.ZERO;
    private double incomePct;
    private double expensePct;
    private double profitPct;

    public BranchPerformance() {}

    public String getBranchName() { return branchName; }
    public void setBranchName(String branchName) { this.branchName = branchName; }

    public BigDecimal getIncome() { return income; }
    public void setIncome(BigDecimal income) { this.income = income; }

    public BigDecimal getExpense() { return expense; }
    public void setExpense(BigDecimal expense) { this.expense = expense; }

    public BigDecimal getProfit() { return profit; }
    public void setProfit(BigDecimal profit) { this.profit = profit; }

    public double getIncomePct() { return incomePct; }
    public void setIncomePct(double incomePct) { this.incomePct = incomePct; }

    public double getExpensePct() { return expensePct; }
    public void setExpensePct(double expensePct) { this.expensePct = expensePct; }

    public double getProfitPct() { return profitPct; }
    public void setProfitPct(double profitPct) { this.profitPct = profitPct; }
}
