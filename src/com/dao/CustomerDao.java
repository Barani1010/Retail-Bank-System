package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bean.Account;
import com.bean.CurrentAccount;
import com.bean.Customer;
import com.util.DatabaseUtil;

public class CustomerDao {
	
	public static ArrayList<Customer> getAllCustomers() { 
		ArrayList<Customer> customerList = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		try { 
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement("SELECT * FROM CUSTOMERDETAILS");
		rs = ps.executeQuery();
		while(rs.next()) { 
			Customer customer = new Customer(rs.getString(1), rs.getLong(2), rs.getString(3), rs.getString(4), rs.getString(5));
			customerList.add(customer);			
		}
			
			
		}
		catch(SQLException e) { 
			System.out.println(e.getMessage());
		}
		finally { 
			DatabaseUtil.closeResultSet(rs);
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}

		return customerList;
	}
	
	public static boolean registerCustomer(Customer c){
		boolean registered = false;
		Connection con = null;
		PreparedStatement ps = null;
	
		try{
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("INSERT INTO CUSTOMERDETAILS VALUES(?,?,?,?,?)");
			ps.setString(1, c.getName());
			ps.setLong(2, c.getSsn());
			ps.setString(3, c.getEmail());
			ps.setString(4,  c.getAddress());
			ps.setString(5, c.getPassword());
			int t = ps.executeUpdate();
			if(t > 0) { 
				registered = true;
			}
			
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		return registered;
	}
	
	public static Customer authenticateCustomer(String name, String password) {
		Customer loggedInCustomer = null;
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		PreparedStatement ps2 =null;
		ResultSet rs2 = null;
		boolean foundmatch = false;
		Long matchedSSN = null;
		
		try { 
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement("SELECT * FROM CUSTOMERDETAILS"); 
		rs = ps.executeQuery();
			 
		while(rs.next()) { 
			if(name.equals(rs.getString("USERNAME")) && password.equals(rs.getString("PASSWORD"))){
				foundmatch = true;
				matchedSSN = rs.getLong("SSN");
				
			}
		}
		
		if(foundmatch) {
			ps2 = con.prepareStatement("SELECT * FROM CUSTOMERDETAILS WHERE SSN = ?");
			ps2.setLong(1, matchedSSN);
			rs2 = ps2.executeQuery();
			while(rs2.next()) {
				loggedInCustomer = new Customer(rs2.getString(1), rs2.getLong(2), rs2.getString(3), rs2.getString(4));
			}
			
		}
			
			
		}
		catch(SQLException e) { 
			System.out.println(e.getMessage());
		}
		finally { 
			DatabaseUtil.closeResultSet(rs2);
			DatabaseUtil.closeResultSet(rs);
			DatabaseUtil.closePreparedStatement(ps2);
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}

		
		return loggedInCustomer;
	}
	
	public static ArrayList<Account> getAllSavingsAccounts() { 
		ArrayList<Account> savingsList = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		try { 
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement("SELECT * FROM SAVINGSACCOUNTDETAILS");
		rs = ps.executeQuery();
		while(rs.next()) { 
			Account savingsAccount = new Account(rs.getLong(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getLong(5));
			savingsList.add(savingsAccount);			
		}
			
			
		}
		catch(SQLException e) { 
			System.out.println(e.getMessage());
		}
		finally { 
			DatabaseUtil.closeResultSet(rs);
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}

		return savingsList;
	}
	
	public static ArrayList<CurrentAccount> getAllCurrentAccounts() { 
		ArrayList<CurrentAccount> currentList = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps =null;
		ResultSet rs = null;
		
		try { 
		con = DatabaseUtil.getConnection();
		ps = con.prepareStatement("SELECT * FROM CURRENTACCOUNTDETAILS");
		rs = ps.executeQuery();
		while(rs.next()) { 
			CurrentAccount currentAccount = new CurrentAccount(rs.getLong(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getLong(5));
			currentList.add(currentAccount);			
		}
			
			
		}
		catch(SQLException e) { 
			System.out.println(e.getMessage());
		}
		finally { 
			DatabaseUtil.closeResultSet(rs);
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}

		return currentList;
	}
	
	public static boolean addSavingAccount(Account a){
		boolean added = false;
		Connection con = null;
		PreparedStatement ps = null;
	
		try{
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("INSERT INTO SAVINGSACCOUNTDETAILS VALUES(?,?,?,?,?)");
			ps.setLong(1, a.getAccountId());
			ps.setString(2, a.getAccountType());
			ps.setDouble(3, a.getBalance());
			ps.setString(4,  a.getStatus());
			ps.setLong(5, a.getSsn());
			int t = ps.executeUpdate();
			if(t > 0) { 
				added = true;
			}
			
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		return added;
	}
	
	public static boolean addCurrentAccount(CurrentAccount c){
		boolean added = false;
		Connection con = null;
		PreparedStatement ps = null;
	
		try{
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("INSERT INTO CURRENTACCOUNTDETAILS VALUES(?,?,?,?,?)");
			ps.setLong(1, c.getAccountId());
			ps.setString(2, c.getAccountType());
			ps.setDouble(3, c.getBalance());
			ps.setString(4, c.getStatus());
			ps.setLong(5, c.getSsn());
			int t = ps.executeUpdate();
			if(t > 0) { 
				added = true;
			}
			
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		return added;
	}
	
	public static Account getSavingAccount(long ssn) { 
		Account savingaccount = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
	
		try{
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("SELECT * FROM SAVINGSACCOUNTDETAILS WHERE SSN = ?");
			ps.setLong(1, ssn);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				 savingaccount = new Account(rs.getLong(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getLong(5));
			}
			
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		
		
		return savingaccount;
	}
	
	public static CurrentAccount getCurrentAccount(long ssn) { 
		CurrentAccount currentaccount = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
	
		try{
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("SELECT * FROM CURRENTACCOUNTDETAILS WHERE SSN = ?");
			ps.setLong(1, ssn);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				currentaccount = new CurrentAccount(rs.getLong(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getLong(5));
			}
			
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		
		
		return currentaccount;
	}
	
	public static boolean updateCustomer(String username, long ssn, String email, String address, String password)
	{
		boolean updated = false;
		Connection con = null;
		PreparedStatement ps =null;
		try
		{
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("UPDATE CUSTOMERDETAILS set USERNAME = ?, EMAIL = ?, ADDRESS = ?, PASSWORD = ? WHERE SSN = ?");
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, address);
			ps.setString(4, password);
			ps.setLong(5, ssn);
			int t = ps.executeUpdate();
			if(t>0)
			{
				updated = true;
			}
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		return updated;
		
	}
	
	public static boolean deleteCustomer(long ssn) {
		boolean deleted = false;
		Connection con = null;
		PreparedStatement ps =null;
		PreparedStatement ps1 =null;
		PreparedStatement ps2 =null;
		try
		{
			con = DatabaseUtil.getConnection();
//			ps2=con.prepareStatement("DELETE from CURRENTACCOUNTDETAILS WHERE SSN = ?");
//			ps2.setLong(1, ssn);
//			
//			int t2 =ps2.executeUpdate();
//			if(t2>0){
//				ps1=con.prepareStatement("DELETE from SAVINGSACCOUNTDETAILS WHERE SSN = ?");
//				ps1.setLong(1, ssn);
//				int t1= ps1.executeUpdate();
//				if(t1>0){
				
					ps = con.prepareStatement("DELETE from CUSTOMERDETAILS WHERE SSN=?");
					ps.setLong(1, ssn);
					int t = ps.executeUpdate();
					System.out.println("+++++++++++++++++++++++++++++++++++++++"+t);
					if(t>0)
					{
						deleted = true;
					}
//				}
//			}
//			
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps2);
			DatabaseUtil.closePreparedStatement(ps1);
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		
		return deleted;
		
		
	}
	
	
	public static ArrayList<String> returnAllSsn(){
		ArrayList<String> arrSsn = new ArrayList<String>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("SELECT SSN FROM CUSTOMERDETAILS ");
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				{	
					arrSsn.add(rs.getString("SSN"));
				}
			}
			
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		return arrSsn;
	}
	
	public static Customer searchBySsn(long ssn){
		Customer cust = null;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			con = DatabaseUtil.getConnection();
			ps = con.prepareStatement("SELECT * FROM CUSTOMERDETAILS WHERE SSN=?");
			ps.setLong(1, ssn);
			rs = ps.executeQuery();
			
			while(rs.next()){
				{	
					cust = new Customer(rs.getString("USERNAME"),rs.getLong("SSN"), rs.getString("EMAIL"), rs.getString("ADDRESS"),rs.getString("PASSWORD"));
				}
			}
			
		}catch(SQLException e){
			e.getMessage();
		}
		
		finally { 
			DatabaseUtil.closePreparedStatement(ps);
			DatabaseUtil.closeConnection(con);
		}
		return cust;
	}
}
