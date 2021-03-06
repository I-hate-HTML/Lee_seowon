package semi.home.jsp.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6979929713683275604L;
	
	private int mno;
	private String userId;
	private String userPwd;
	private String userName;
	private String gender;
	private String email;
	private String phone;
	private String address;
	private Date enrolldate;
	private int cno;
	private String cname;
	private Date cbdate;
	private String cgender;
	private int cclass;
	private String mstatus;
	private int job_code;
	// 기본생성자
	public Member() {
	}

	// 로그인용 생성자
	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	
	
	public Member(String userId, Date cbdate) {
		super();
		this.userId = userId;
		this.cbdate = cbdate;
	}

	// 회원 가입
	public Member(String userId, String userPwd, String userName, String gender, String email, String phone,
			String address, String cname, Date cbdate, String cgender, int cclass) {
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
	
	// 전체 데이터 조회
	public Member(int mno, String userId, String userPwd, String userName, String gender, String email, String phone,
			String address, Date enrolldate, int cno, String cname, Date cbdate, String cgender, int cclass,
			String mstatus,int job_code) {
		super();
		this.mno = mno;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.enrolldate = enrolldate;
		this.cno = cno;
		this.cname = cname;
		this.cbdate = cbdate;
		this.cgender = cgender;
		this.cclass = cclass;
		this.mstatus = mstatus;
		this.job_code = job_code;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

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

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
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

	public int getCclass() {
		return cclass;
	}

	public void setCclass(int cclass) {
		this.cclass = cclass;
	}

	public String getMstatus() {
		return mstatus;
	}

	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}

	public int getJob_code() {
		return job_code;
	}

	public void setJob_code(int job_code) {
		this.job_code = job_code;
	}

	@Override
	public String toString() {
		return "Member [mno=" + mno + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", address=" + address
				+ ", enrolldate=" + enrolldate + ", cno=" + cno + ", cname=" + cname + ", cbdate=" + cbdate
				+ ", cgender=" + cgender + ", cclass=" + cclass + ", mstatus=" + mstatus + ", job_code=" + job_code
				+ "]";
	}

	

	
	
	
	
	

}
