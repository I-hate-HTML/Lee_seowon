package semi.intranet.form.model.vo;

import java.io.Serializable;

public class SignList implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sname;
	private int sposition;
	private String position;
	private int scode;
	private int sclass;
	private String sname2;
	private int sposition2;
	private String position2;
	private int scode2;
	private int sclass2;
	private String sname3;
	private int sposition3;
	private String position3;
	private int scode3;
	private int sclass3;
	
	public SignList() {}

	
	/**
	 * 작성용 결재자 리스트 가져오기
	 * @param sname
	 * @param sposition
	 * @param position
	 * @param scode
	 * @param sclass
	 */
	public SignList(String sname, int sposition, String position, int scode, int sclass) {
		super();
		this.sname = sname;
		this.sposition = sposition;
		this.position = position;
		this.scode = scode;
		this.sclass = sclass;
	}

	public String getSname() {
		return sname;
	}

	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}


	public void setSname(String sname) {
		this.sname = sname;
	}

	public int getSposition() {
		return sposition;
	}

	public void setSposition(int sposition) {
		this.sposition = sposition;
	}

	public String getSname2() {
		return sname2;
	}


	public void setSname2(String sname2) {
		this.sname2 = sname2;
	}


	public int getSposition2() {
		return sposition2;
	}


	public void setSposition2(int sposition2) {
		this.sposition2 = sposition2;
	}


	public String getPosition2() {
		return position2;
	}


	public void setPosition2(String position2) {
		this.position2 = position2;
	}


	public int getScode2() {
		return scode2;
	}


	public void setScode2(int scode2) {
		this.scode2 = scode2;
	}


	public int getSclass2() {
		return sclass2;
	}


	public void setSclass2(int sclass2) {
		this.sclass2 = sclass2;
	}


	public String getSname3() {
		return sname3;
	}


	public void setSname3(String sname3) {
		this.sname3 = sname3;
	}


	public int getSposition3() {
		return sposition3;
	}


	public void setSposition3(int sposition3) {
		this.sposition3 = sposition3;
	}


	public String getPosition3() {
		return position3;
	}


	public void setPosition3(String position3) {
		this.position3 = position3;
	}


	public int getScode3() {
		return scode3;
	}


	public void setScode3(int scode3) {
		this.scode3 = scode3;
	}


	public int getSclass3() {
		return sclass3;
	}


	public void setSclass3(int sclass3) {
		this.sclass3 = sclass3;
	}


	public int getScode() {
		return scode;
	}

	public void setScode(int scode) {
		this.scode = scode;
	}
	
	public int getSclass() {
		return sclass;
	}

	public void setSclass(int sclass) {
		this.sclass = sclass;
	}


	@Override
	public String toString() {
		return "SignList [sname=" + sname + ", sposition=" + sposition + ", position=" + position + ", scode=" + scode
				+ ", sclass=" + sclass + ", sname2=" + sname2 + ", sposition2=" + sposition2 + ", position2="
				+ position2 + ", scode2=" + scode2 + ", sclass2=" + sclass2 + ", sname3=" + sname3 + ", sposition3="
				+ sposition3 + ", position3=" + position3 + ", scode3=" + scode3 + ", sclass3=" + sclass3 + "]";
	}


	


	

	
	
}
