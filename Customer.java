package org.bean;

public class Customer {

	private String custId;
	private String custPwd;
	private String custName;
	private String phoneNum;
	private String addr;
	private String email;
	private String regDate;
	
	public Customer() {}

	public Customer(String custId, String custPwd, String custName, String phoneNum, String addr, String email, String regDate) {
		super();
		this.custId = custId;
		this.custPwd = custPwd;
		this.custName = custName;
		this.phoneNum = phoneNum;
		this.addr = addr;
		this.email = email;
		this.regDate = regDate;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustPwd() {
		return custPwd;
	}

	public void setCustPwd(String custPwd) {
		this.custPwd = custPwd;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
	
}
