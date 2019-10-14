package com.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Customer {
	private String name;
	private long ssn;
	private String email;
	private String address;
	private String password;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getSsn() {
		return ssn;
	}
	public void setSsn(long ssn) {
		this.ssn = ssn;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Customer(String name, long ssn, String email, String address, String password) {
		super();
		this.name = name;
		this.ssn = ssn;
		this.email = email;
		this.address = address;
		this.password = password;
	}
	
	public Customer(String name, long ssn, String email, String address) {
		super();
		this.name = name;
		this.ssn = ssn;
		this.email = email;
		this.address = address;
	
	}
	

	public Customer() {
		super();
	}
	@Override
	public String toString() {
		return "Customer [name=" + name + ", ssn=" + ssn + ", email=" + email + ", address=" + address + ", password="
				+ password + "]";
	}
	
	
}
