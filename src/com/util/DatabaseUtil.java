package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DatabaseUtil {

	private static final String DRIVERNAME = "oracle.jdbc.OracleDriver";
	private static final String URL = "jdbc:oracle:thin:@intvmoradb04:1521:ORAJAVADB";
	private static final String USERNAME ="TVM1819_TVM56_TJA295_TEST";
	private static final String PASSWORD ="tcstvm56";

	// get a database connection
	public static Connection getConnection() {
		Connection con = null;
		try {
			// Registering Driver
			Class.forName(DRIVERNAME); // throws ClassNotFoundException (Checked Exception)

			// Creating Connection
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD); // throws SQLException (Checked Exception)
		} catch (ClassNotFoundException ex) {

			System.out.println("connection not establisted" + ex);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			System.out.println(e1);
		}
		return con;
	}

	// close database connection
	public static void closeConnection(Connection con) {

		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				System.out.println(e1);
			}
		}
	}

	// close Prepared statements
	public static void closePreparedStatement(PreparedStatement smt) {

		if (smt != null) {
			try {
				smt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				System.out.println(e1);
			}
		}
	}

	// close Result sets
	public static void closeResultSet(ResultSet rs) {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				System.out.println(e1);
			}
		}
	}

}
