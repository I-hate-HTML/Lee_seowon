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
	
	public SignList() {}

	
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
				+ ", sclass=" + sclass + "]";
	}


	

	
	
}
