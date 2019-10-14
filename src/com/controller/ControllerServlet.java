package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Account;
import com.bean.CurrentAccount;
import com.bean.Customer;
import com.service.Service;


/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("Register")) {
			String name = request.getParameter("name");
			long ssn = Long.parseLong(request.getParameter("user_ssn"));
			String email = request.getParameter("email_id");
			String address = request.getParameter("user_address");
			String password = request.getParameter("password");
			
			Customer c = new Customer(name, ssn, email, address, password);
			boolean added = Service.registerCustomer(c);
			
			if(added){
				  
				String message = "Welcome "+name+". You have successfully registered. You may proceed to login.";
				request.setAttribute("message", message);
				request.getRequestDispatcher("RegisterSuccess.jsp").forward(request, response);
			}
		}
		
		else if(action.equals("Login")) {
		
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			Customer loggedInCustomer = Service.authenticateCustomer(name, password);
			ArrayList<String> arrSsn = Service.returnAllSsn();
			if(loggedInCustomer!= null) {
				HttpSession session = request.getSession();
				session.setAttribute("name", name);
				session.setAttribute("password", password);
				session.setAttribute("loggedincustomer", loggedInCustomer );
				request.setAttribute("arrSSN", arrSsn);
				request.getRequestDispatcher("InsideloginMain.jsp").forward(request, response);
			}
			
		}
		
		else if(action.equalsIgnoreCase("createSaving")) {
			ArrayList<Account> savingList = Service.getAllSavingsAccounts();
			request.setAttribute("savingList", savingList);
			request.getRequestDispatcher("InsideloginMain.jsp").forward(request, response);
		}
		
		else if(action.equalsIgnoreCase("createCurrent")) {
			ArrayList<CurrentAccount> currentList = Service.getAllCurrentAccounts();
			request.setAttribute("currentList", currentList);
			request.getRequestDispatcher("InsideloginMain.jsp").forward(request, response);
		}
		
		else if(action.equalsIgnoreCase("AddSavings")) {
			System.out.println("added savings");
			String accountType = request.getParameter("accountType");
			long accountId = Long.parseLong(request.getParameter("accountId"));
			long SSN = Long.parseLong(request.getParameter("SSN"));
			double balance = Double.parseDouble(request.getParameter("initialDeposit"));
			String status = null;
			
			
			if(balance > 0) {
				status = "Active";
			}
			
			else { 
				status = "Inactive";
			}
			
			Account account = new Account(accountId, accountType, balance, status, SSN);
			
			boolean added = Service.addSavingAccount(account);
			
			int savingsadder = 0;
			if(added) {
				savingsadder = 1;
				request.setAttribute("savingsaddedValue", savingsadder);
				request.getRequestDispatcher("InsideloginMain.jsp").forward(request, response);
			}
			
			
		}
		
		else if(action.equalsIgnoreCase("AddCurrent")) {
			long accountId = Long.parseLong(request.getParameter("accountId"));
			String accountType = request.getParameter("accountType");
			long SSN = Long.parseLong(request.getParameter("SSN"));
			double balance = Double.parseDouble(request.getParameter("initialDeposit"));
			String status = null;
			
			
			if(balance > 0) {
				status = "Active";
			}
			
			else { 
				status = "Inactive";
			}
			
			CurrentAccount currentaccount = new CurrentAccount(accountId, accountType, balance, status, SSN);
			
			boolean added = Service.addCurrentAccount(currentaccount);
			int currentadder = 0;
			if(added) {
				currentadder = 1;
				request.setAttribute("currentaddedValue", currentadder);
				request.getRequestDispatcher("InsideloginMain.jsp").forward(request, response);
			}
		}
		
		else if(action.equalsIgnoreCase("viewall")) {
			
			ArrayList<Customer> customerList = Service.getAllCustomers();
			request.setAttribute("customerList", customerList);
			request.getRequestDispatcher("showAllCustomers.jsp").forward(request, response);
			
			
		}
		
		else if(action.equalsIgnoreCase("showAccounts")) {
			long ssn = Long.parseLong(request.getParameter("ssn"));
			System.out.println(ssn);
			Account savingsAccount = Service.getSavingAccount(ssn);
			CurrentAccount currentAccount = Service.getCurrentAccount(ssn);
			
			request.setAttribute("savingsAccount", savingsAccount);
			request.setAttribute("currentAccount", currentAccount);
			
			request.getRequestDispatcher("ShowAccounts.jsp").forward(request, response);
		}
		
		if(action.equals("Delete")) {

			long ssn = Long.parseLong(request.getParameter("ssn"));
			System.out.println("++++++++++++++++++++"+ssn);
			boolean deleted = Service.deleteCustomer(ssn);
			System.out.println(deleted);
			if(deleted) {
				String msg1 = "Customer with " + ssn + " is successfully deleted!";
				request.setAttribute("msg1", msg1);
				request.getRequestDispatcher("SuccessfullyDeleted.jsp").forward(request, response);
			}else {
				String msg = "Customer with " + ssn + " deletion is unsuccessful!";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("ErrorDelete.jsp").forward(request, response);
			}
			
			
		}
		
		else if(action.equals("updatedetails"))
		{
			response.sendRedirect("updatedetails.jsp");
		}
		else if(action.equals("Update"))
		{
			String username = request.getParameter("name");
			String SSN = request.getParameter("SSn");
			Long ssn = Long.parseLong(SSN);
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			boolean updated = Service.updateCustomer(username, ssn, email, address, password);
		
			response.sendRedirect("Login.jsp");
			
		}
		
		else if (action.equals("Search")){
			String ssn1 = request.getParameter("ssn");

			Long ssn = Long.parseLong(ssn1);
			Customer clogin = Service.searchBySsn(ssn);
			if(clogin!=null){
				request.setAttribute("clogin", clogin);
				request.getRequestDispatcher("searchresult.jsp").forward(request, response);
			}
			else{
				String msg = ssn + " not found";
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("CustomerNotFound.jsp").forward(request, response);

			}
		}
		else if(action.equals("InsideloginMain")) {
			ArrayList<String> arrSsn = Service.returnAllSsn();
			request.setAttribute("arrSSN", arrSsn);
			request.getRequestDispatcher("InsideloginMain.jsp").forward(request, response);
			
		}
		
		else if(action.equals("Home"))
		{
			response.sendRedirect("Login.jsp");
		}
		
		else if(action.equalsIgnoreCase("Logout")) {
			HttpSession session = request.getSession(false);
			
			session.removeAttribute("name");
			session.removeAttribute("password");
			session.invalidate();
			response.sendRedirect("Login.jsp");

		}
	}

}
