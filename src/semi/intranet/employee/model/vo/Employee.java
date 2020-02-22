package semi.intranet.employee.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Employee implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7734435700357772483L;
	
	// �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占�
	private int empCode;
	private String empName;
	private String empJob;
	private String empNo;
	private String empPhone;
	private String empEmail;
	private String empAddr;
	private String hireDate; 
	private String entYN;
	private String entDate;
	private String empClass;
	private int hobong;
	private String empimg;
	  
	  
	public Employee() {}

	
	


	





	public Employee(String empName, String empJob, String empNo, String empPhone, String empEmail, String empAddr,
			String hireDate, String empClass, String empimg) {
		super();
		this.empName = empName;
		this.empJob = empJob;
		this.empNo = empNo;
		this.empPhone = empPhone;
		this.empEmail = empEmail;
		this.empAddr = empAddr;
		this.hireDate = hireDate;
		this.empClass = empClass;
		this.empimg = empimg;
	}











	public Employee(int empCode, String empName, String empJob, String empNo, String empPhone, String empEmail,
			String empAddr, String hireDate, String entYN, String entDate, String empClass, int hobong, String empimg) {
		super();
		this.empCode = empCode;
		this.empName = empName;
		this.empJob = empJob;
		this.empNo = empNo;
		this.empPhone = empPhone;
		this.empEmail = empEmail;
		this.empAddr = empAddr;
		this.hireDate = hireDate;
		this.entYN = entYN;
		this.entDate = entDate;
		this.empClass = empClass;
		this.hobong = hobong;
		this.empimg = empimg;
	}





	public String getHireDate() {
		return hireDate;
	}





	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}





	public String getEntYN() {
		return entYN;
	}





	public void setEntYN(String string) {
		this.entYN = string;
	}





	public String getEntDate() {
		return entDate;
	}





	public void setEntDate(String entDate) {
		this.entDate = entDate;
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
	

	public String getEmpimg() {
		return empimg;
	}


	public void setEmpimg(String empimg) {
		this.empimg = empimg;
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

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpAddr() {
		return empAddr;
	}

	public void setEmpAddr(String empAddr) {
		this.empAddr = empAddr;
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
				+ ", empPhone=" + empPhone + ", empEmail=" + empEmail + ", empAddr=" + empAddr + ", hireDate="
				+ hireDate + ", entYN=" + entYN + ", entDate=" + entDate + ", empClass=" + empClass + ", hobong="
				+ hobong + "]";
	}

	
	
	
	
	
}
