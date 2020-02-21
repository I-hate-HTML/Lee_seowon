package semi.intranet.child.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Child implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int cCode;
	private String name;
	private String gender;
	private String no;
	private String birth;
	private String entdate;
	private String graduate;
	private String addr;
	private int age;
	private String state;
	private String stuclass;
	private String stuimg;
	private int parentCode;
	
	public Child() {}

	public Child(int cCode, String name, String gender, String no, String birth, String entdate, String graduate,
			String addr, int age, String state, String stuclass, String stuimg, int parentCode) {
		this.cCode = cCode;
		this.name = name;
		this.gender = gender;
		this.no = no;
		this.birth = birth;
		this.entdate = entdate;
		this.graduate = graduate;
		this.addr = addr;
		this.age = age;
		this.state = state;
		this.stuclass = stuclass;
		this.stuimg = stuimg;
		this.parentCode = parentCode;
	}

	public Child(String name, String gender, String no, String birth, String entdate, String addr, int age,
			String state, String stuclass, String stuimg) {
		super();
		this.name = name;
		this.gender = gender;
		this.no = no;
		this.birth = birth;
		this.entdate = entdate;
		this.addr = addr;
		this.age = age;
		this.state = state;
		this.stuclass = stuclass;
		this.stuimg = stuimg;
	}

	public int getcCode() {
		return cCode;
	}

	public void setcCode(int cCode) {
		this.cCode = cCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEntdate() {
		return entdate;
	}

	public void setEntdate(String entdate) {
		this.entdate = entdate;
	}

	public String getGraduate() {
		return graduate;
	}

	public void setGraduate(String graduate) {
		this.graduate = graduate;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getStuclass() {
		return stuclass;
	}

	public void setStuclass(String stuclass) {
		this.stuclass = stuclass;
	}

	public String getStuimg() {
		return stuimg;
	}

	public void setStuimg(String stuimg) {
		this.stuimg = stuimg;
	}

	public int getParentCode() {
		return parentCode;
	}

	public void setParentCode(int i) {
		this.parentCode = i;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Child [cCode=" + cCode + ", name=" + name + ", gender=" + gender + ", no=" + no + ", birth=" + birth
				+ ", entdate=" + entdate + ", graduate=" + graduate + ", addr=" + addr + ", age=" + age + ", state="
				+ state + ", stuclass=" + stuclass + ", stuimg=" + stuimg + ", parentCode=" + parentCode + "]";
	}
	
	
	
}
