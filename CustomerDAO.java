package org.bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CustomerDAO {

	public CustomerDAO() {}
	
	public int addCust(Customer customer) {
		String sql = null;
		int result=0;
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();
			sql = "insert into customer values(?,?,?,?,?,?,to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'))";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customer.getCustId());
			pstmt.setString(2, customer.getCustPwd());
			pstmt.setString(3, customer.getCustName());
			pstmt.setString(4, customer.getPhoneNum());
			pstmt.setString(5, customer.getAddr());
			pstmt.setString(6, customer.getEmail());
			result = pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}return result;
		
	}
	
	public int isCustomer(String custId, String custPwd) {
		int result = 0;
		String sql = null;
		try {
			InitialContext ic = new InitialContext();
			DataSource ds = (DataSource)ic.lookup("java:comp/env/jdbc/myoracle");
			Connection conn = ds.getConnection();
			sql = "select custId, custPwd from customer";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				if(custId.equals(rs.getString(1))&&custPwd.equals(rs.getString(2))){
					result = 1;
				}
			}	
			pstmt.close(); rs.close(); conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}return result;
		
	}
	
		
}
