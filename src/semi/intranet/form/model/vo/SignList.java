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
	private String syn;
	private String smsg;
	
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

	
	
	/**
	 * 읽기용 결재자 리스트 가져오기
	 * @param sname
	 * @param sposition
	 * @param position
	 * @param scode
	 * @param sclass
	 * @param syn
	 * @param smsg
	 */
	public SignList(String sname, int sposition, String position, int scode, int sclass, String syn, String smsg) {
		super();
		this.sname = sname;
		this.sposition = sposition;
		this.position = position;
		this.scode = scode;
		this.sclass = sclass;
		this.syn = syn;
		this.smsg = smsg;
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

	

	public String getSyn() {
		return syn;
	}


	public void setSyn(String syn) {
		this.syn = syn;
	}


	public String getSmsg() {
		return smsg;
	}


	public void setSmsg(String smsg) {
		this.smsg = smsg;
	}


	@Override
	public String toString() {
		return "SignList [sname=" + sname + ", sposition=" + sposition + ", position=" + position + ", scode=" + scode
				+ ", sclass=" + sclass + ", syn=" + syn + ", smsg=" + smsg + "]";
	}


	


	


	


	

	
	
}
