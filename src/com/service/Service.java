package com.service;

import java.util.ArrayList;

import com.bean.Account;
import com.bean.CurrentAccount;
import com.bean.Customer;
import com.dao.CustomerDao;

public class Service {
	public static boolean registerCustomer(Customer c){
		return CustomerDao.registerCustomer(c);
	}
	
	public static ArrayList<Customer> getAllCustomers() {
		return CustomerDao.getAllCustomers();
	}
	
	public static Customer authenticateCustomer(String name, String password) {
		return CustomerDao.authenticateCustomer(name, password);
	}
	
	public static ArrayList<Account> getAllSavingsAccounts() { 
		return CustomerDao.getAllSavingsAccounts();
	}
	
	public static ArrayList<CurrentAccount> getAllCurrentAccounts() { 
		return CustomerDao.getAllCurrentAccounts();
	}
	
	public static boolean addSavingAccount(Account a){
		return CustomerDao.addSavingAccount(a);
	}
	
	public static boolean addCurrentAccount(CurrentAccount c){
		return CustomerDao.addCurrentAccount(c);
	}
	
	public static Account getSavingAccount(long ssn) { 
		return CustomerDao.getSavingAccount(ssn);
	}
	
	public static CurrentAccount getCurrentAccount(long ssn) { 
		return CustomerDao.getCurrentAccount(ssn);
	}
	
	public static ArrayList<String> returnAllSsn(){
		return CustomerDao.returnAllSsn();
	}
	
	public static Customer searchBySsn(long ssn){
		return CustomerDao.searchBySsn(ssn);
	}
	
	public static boolean updateCustomer(String username, long ssn, String email, String address, String password) { 
		return CustomerDao.updateCustomer(username, ssn, email, address, password);
	}
	
	public static boolean deleteCustomer(long ssn) {
		return CustomerDao.deleteCustomer(ssn);
	}
}
