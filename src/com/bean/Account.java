package com.bean;

public class Account {
	private long accountId;
	private String accountType;
	private double balance;
	private String status;
	private long ssn;
	public long getAccountId() {
		return accountId;
	}
	public void setAccountId(long accountId) {
		this.accountId = accountId;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public long getSsn() {
		return ssn;
	}
	public void setSsn(long ssn) {
		this.ssn = ssn;
	}
	public Account(long accountId, String accountType, double balance, String status, long ssn) {
		super();
		this.accountId = accountId;
		this.accountType = accountType;
		this.balance = balance;
		this.status = status;
		this.ssn = ssn;
	}
	public Account() {
		super();
	}
	@Override
	public String toString() {
		return "Account [accountId=" + accountId + ", accountType=" + accountType + ", balance=" + balance + ", status="
				+ status + ", ssn=" + ssn + "]";
	}
	

	


	
	
	
	
	
}
