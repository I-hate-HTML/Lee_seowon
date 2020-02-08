package semi.intranet.form.model.vo;

import java.io.Serializable;

public class SignList implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String sname;
	private int sposition;
	private int scode;
	
	public SignList() {}

	public SignList(String sname, int sposition, int scode) {
		super();
		this.sname = sname;
		this.sposition = sposition;
		this.scode = scode;
	}

	public String getSname() {
		return sname;
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

	@Override
	public String toString() {
		return "SginList [sname=" + sname + ", sposition=" + sposition + ", scode=" + scode + "]";
	}

	
	
	
}
