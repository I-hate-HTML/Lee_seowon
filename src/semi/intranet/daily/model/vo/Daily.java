package semi.intranet.daily.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Daily implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int dno;
	private int dtype;
	private int dclass;
	private String dtitle;
	private String dcontent;
	private String dwriter;
	private String teacherCode;
	private String doardfile;
	private Date ddate;
	private int dcount;
	private String status;
	private String dpwd;
	
	
	public Daily() {}


	/**
	 * @내용 교육일지 조회용
	 */
	public Daily(int dno, int dtype, int dclass, String dtitle, String dcontent, String dwriter, String teacherCode,
			String doardfile, Date ddate, int dcount, String status, String dpwd) {
		super();
		this.dno = dno;
		this.dtype = dtype;
		this.dclass = dclass;
		this.dtitle = dtitle;
		this.dcontent = dcontent;
		this.dwriter = dwriter;
		this.teacherCode = teacherCode;
		this.doardfile = doardfile;
		this.ddate = ddate;
		this.dcount = dcount;
		this.status = status;
		this.dpwd = dpwd;
	}
	


	/**
	 * @내용 교육일지 등록용
	 */
	public Daily(int dclass, String dtitle, String dcontent, String dwriter, String doardfile, String dpwd) {
		super();
		this.dclass = dclass;
		this.dtitle = dtitle;
		this.dcontent = dcontent;
		this.dwriter = dwriter;
		this.doardfile = doardfile;
		this.dpwd = dpwd;
	}


	public int getDno() {
		return dno;
	}


	public void setDno(int dno) {
		this.dno = dno;
	}


	public int getDtype() {
		return dtype;
	}


	public void setDtype(int dtype) {
		this.dtype = dtype;
	}


	public int getDclass() {
		return dclass;
	}


	public void setDclass(int dclass) {
		this.dclass = dclass;
	}


	public String getDtitle() {
		return dtitle;
	}


	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}


	public String getDcontent() {
		return dcontent;
	}


	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}


	public String getDwriter() {
		return dwriter;
	}


	public void setDwriter(String dwriter) {
		this.dwriter = dwriter;
	}


	public String getTeacherCode() {
		return teacherCode;
	}


	public void setTeacherCode(String teacherCode) {
		this.teacherCode = teacherCode;
	}


	public String getDoardfile() {
		return doardfile;
	}


	public void setDoardfile(String doardfile) {
		this.doardfile = doardfile;
	}


	public Date getDdate() {
		return ddate;
	}


	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}


	public int getDcount() {
		return dcount;
	}


	public void setDcount(int dcount) {
		this.dcount = dcount;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getDpwd() {
		return dpwd;
	}


	public void setDpwd(String dpwd) {
		this.dpwd = dpwd;
	}


	@Override
	public String toString() {
		return "Daily [dno=" + dno + ", dtype=" + dtype + ", dclass=" + dclass + ", dtitle=" + dtitle + ", dcontent="
				+ dcontent + ", dwriter=" + dwriter + ", teacherCode=" + teacherCode + ", doardfile=" + doardfile
				+ ", ddate=" + ddate + ", dcount=" + dcount + ", status=" + status + ", dpwd=" + dpwd + "]";
	}

	
}