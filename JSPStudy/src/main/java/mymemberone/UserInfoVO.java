package mymemberone;

public class UserInfoVO {
	private int userNo;
	private String userId;
	private String password;
	private String passwordCheck;
	private String userName;
	private String email;
	private int postNum;
	private String address1;
	private String address2;
	private String address3;
	private String phone;
	private String userDate;

	public UserInfoVO() {
		super();
	}

	public UserInfoVO(int userNo, String userId, String password, String passwordCheck, String userName, String email,
			int postNum, String address1, String address2, String address3, String phone, String userDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.password = password;
		this.passwordCheck = passwordCheck;
		this.userName = userName;
		this.email = email;
		this.postNum = postNum;
		this.address1 = address1;
		this.address2 = address2;
		this.address3 = address3;
		this.phone = phone;
		this.userDate = userDate;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserDate() {
		return userDate;
	}

	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordCheck() {
		return passwordCheck;
	}

	public void setPasswordCheck(String passwordCheck) {
		this.passwordCheck = passwordCheck;
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

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

}
