package semi.intranet.child.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Child implements Serializable{
	private int cCode;
	private String cName;
	private String cGender;
	private String cNo;
	private String cBirth;
	private Date cEntrance;
	private Date cGraduate;
	private String cAddr;
	private String cImage;
	private int cAge;
	private String cIsin;
	private String cClass;
	
	public Child() {}

	public Child(String cName, String cGender, String cNo, String cBirth, String cAddr, String cImage, String cClass) {
		this.cName = cName;
		this.cGender = cGender;
		this.cNo = cNo;
		this.cBirth = cBirth;
		this.cAddr = cAddr;
		this.cImage = cImage;
		this.cClass = cClass;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getcGender() {
		return cGender;
	}

	public void setcGender(String cGender) {
		this.cGender = cGender;
	}

	public String getcNo() {
		return cNo;
	}

	public void setcNo(String cNo) {
		this.cNo = cNo;
	}

	public String getcBirth() {
		return cBirth;
	}

	public void setcBirth(String cBirth) {
		this.cBirth = cBirth;
	}

	public Date getcEntrance() {
		return cEntrance;
	}

	public void setcEntrance(Date cEntrance) {
		this.cEntrance = cEntrance;
	}

	public Date getcGraduate() {
		return cGraduate;
	}

	public void setcGraduate(Date cGraduate) {
		this.cGraduate = cGraduate;
	}

	public String getcAddr() {
		return cAddr;
	}

	public void setcAddr(String cAddr) {
		this.cAddr = cAddr;
	}

	public String getcImage() {
		return cImage;
	}

	public void setcImage(String cImage) {
		this.cImage = cImage;
	}

	public int getcAge() {
		return cAge;
	}

	public void setcAge(int cAge) {
		this.cAge = cAge;
	}

	public String getcIsin() {
		return cIsin;
	}

	public void setcIsin(String cIsin) {
		this.cIsin = cIsin;
	}

	public String getcClass() {
		return cClass;
	}

	public void setcClass(String cClass) {
		this.cClass = cClass;
	}
	
	
}
