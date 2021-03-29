package May_Fifth01;

class Members1{
	private int userId;
	private String userName, email, phoneNo;
	private String userPwd, regDate;
	
	public Members1(int userId, String userName, String email, String phoneNo, String userPwd, String regDate) {
		this.userId = userId; this.userName = userName; this.email = email; this.phoneNo = phoneNo;
		this.userPwd = userPwd; this.regDate = regDate;
	}

	public int getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getRegDate() {
		return regDate;
	}
	
	public String toString(){
		return String.format("[userId=%d, userName=%s, email=%s, phoneNo=%s, userPwd=%s, regDate=%s]", 
							userId, userName, email, phoneNo, userPwd, regDate);
	}
	
}