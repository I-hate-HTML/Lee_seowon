package intranet.employee.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Employee implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7734435700357772483L;
	
	// ¸â¹öº¯¼ö
	private int empCode;
	private String empName;
	private String empJob;
	private String empNo;
	private String empPhone;
	private String empAddr;
	private Date hireDate;
	private int entYN;
	private Date entDate;
	private String empClass;
	private int hobong;
	 
	public Employee() {}

	public Employee(String empName, String empJob, String empNo, String empPhone, String empAddr,
			 String empClass) {
		this.empName = empName;
		this.empJob = empJob;
		this.empNo = empNo;
		this.empPhone = empPhone;
		this.empAddr = empAddr;
		this.empClass = empClass;
	}

	public Employee(int empCode, String empName, String empJob, String empNo, String empPhone, String empAddr,
			Date hireDate, int entYN, Date entDate, String empClass) {
		this.empCode = empCode;
		this.empName = empName;
		this.empJob = empJob;
		this.empNo = empNo;
		this.empPhone = empPhone;
		this.empAddr = empAddr;
		this.hireDate = hireDate;
		this.entYN = entYN;
		this.entDate = entDate;
		this.empClass = empClass;
	}

	public int getEmpCode() {
		return empCode;
	}

	public void setEmpCode(int empCode) {
		this.empCode = empCode;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpJob() {
		return empJob;
	}

	public void setEmpJob(String empJob) {
		this.empJob = empJob;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpPhone() {
		return empPhone;
	}

	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}

	public String getEmpAddr() {
		return empAddr;
	}

	public void setEmpAddr(String empAddr) {
		this.empAddr = empAddr;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public int getEntYN() {
		return entYN;
	}

	public void setEntYN(int entYN) {
		this.entYN = entYN;
	}

	public Date getEntDate() {
		return entDate;
	}

	public void setEntDate(Date entDate) {
		this.entDate = entDate;
	}

	public String getEmpClass() {
		return empClass;
	}

	public void setEmpClass(String empClass) {
		this.empClass = empClass;
	}

	public int getHobong() {
		return hobong;
	}

	public void setHobong(int hobong) {
		this.hobong = hobong;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Employee [empCode=" + empCode + ", empName=" + empName + ", empJob=" + empJob + ", empNo=" + empNo
				+ ", empPhone=" + empPhone + ", empAddr=" + empAddr + ", hireDate=" + hireDate + ", entYN=" + entYN
				+ ", entDate=" + entDate + ", empClass=" + empClass + ", hobong=" + hobong + "]";
	}
	
	
	
	
}
