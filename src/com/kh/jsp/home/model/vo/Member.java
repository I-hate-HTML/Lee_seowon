package com.kh.jsp.home.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6979929713683275604L;
	private String userId;
	private String userPwd;
	private String userName;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private String cname;
	private Date cbdate;
	private String cgender;
	private String cclass;
	private Date enrolldate;
	
	// 기본생성자
	public Member() {
	}

	// 로그인용 생성자
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	// 회원가입용 생성자
	public Member(String userId, String userPwd, String userName, String gender, String email, String phone,
			String address, String cname, Date cbdate, String cgender, String cclass) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.cname = cname;
		this.cbdate = cbdate;
		this.cgender = cgender;
		this.cclass = cclass;
	}

	// 회원 전체 정보 조회 생성자
	public Member(String userId, String userPwd, String userName, String gender, String email, String phone,
			String address, String cname, Date cbdate, String cgender, String cclass, Date enrolldate) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.cname = cname;
		this.cbdate = cbdate;
		this.cgender = cgender;
		this.cclass = cclass;
		this.enrolldate = enrolldate;
	}

	// 게터 세터
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public Date getCbdate() {
		return cbdate;
	}

	public void setCbdate(Date cbdate) {
		this.cbdate = cbdate;
	}

	public String getCgender() {
		return cgender;
	}

	public void setCgender(String cgender) {
		this.cgender = cgender;
	}

	public String getCclass() {
		return cclass;
	}

	public void setCclass(String cclass) {
		this.cclass = cclass;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", gender=" + gender
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", cname=" + cname + ", cbdate="
				+ cbdate + ", cgender=" + cgender + ", cclass=" + cclass + ", enrolldate=" + enrolldate + "]";
	}
	
	
	

}
