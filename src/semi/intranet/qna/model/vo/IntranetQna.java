package semi.intranet.qna.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class IntranetQna implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3542405389485417315L;

	private int qno; //글번호
	private String qtitle;//글제목
	private String qcontent;//글내용
	private String qwriter;//작성자
	private Date qdate;//날짜
	private Date ask_date;//문의날짜
	private String chk_status;//읽음 상태
	private int qcclass; //원아 반
	private String qClassName; // 원아 반 이름
	private String qcname;//원아명
	private int qcnum; // 원아 코드
	private String qusername;//학부모명
	private int qusernum; // 학부모 코드
	
	public IntranetQna() {}

	/**
	 * 문의사항 리스트용
	 * @param qno
	 * @param qtitle
	 * @param qwriter
	 * @param qdate
	 * @param chk_status
	 * @param qcclass
	 * @param qClassName
	 * @param qcname
	 * @param qcnum
	 * @param qusername
	 * @param qusernum
	 */
	public IntranetQna(int qno, String qtitle, String qwriter, Date qdate, String chk_status, int qcclass,
			String qClassName, String qcname, int qcnum, String qusername, int qusernum) {
		super();
		this.qno = qno;
		this.qtitle = qtitle;
		this.qwriter = qwriter;
		this.qdate = qdate;
		this.chk_status = chk_status;
		this.qcclass = qcclass;
		this.qClassName = qClassName;
		this.qcname = qcname;
		this.qcnum = qcnum;
		this.qusername = qusername;
		this.qusernum = qusernum;
	}

	/**
	 * 문의사항 읽기용
	 * @param qno
	 * @param qtitle
	 * @param qcontent
	 * @param qwriter
	 * @param qdate
	 * @param ask_date
	 * @param chk_status
	 * @param qcclass
	 * @param qClassName
	 * @param qcname
	 * @param qcnum
	 * @param qusername
	 * @param qusernum
	 */
	public IntranetQna(int qno, String qtitle, String qcontent, String qwriter, Date qdate, Date ask_date,
			String chk_status, int qcclass, String qClassName, String qcname, int qcnum, String qusername,
			int qusernum) {
		super();
		this.qno = qno;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qwriter = qwriter;
		this.qdate = qdate;
		this.ask_date = ask_date;
		this.chk_status = chk_status;
		this.qcclass = qcclass;
		this.qClassName = qClassName;
		this.qcname = qcname;
		this.qcnum = qcnum;
		this.qusername = qusername;
		this.qusernum = qusernum;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQwriter() {
		return qwriter;
	}

	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	public Date getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(Date ask_date) {
		this.ask_date = ask_date;
	}

	public String getChk_status() {
		return chk_status;
	}

	public void setChk_status(String chk_status) {
		this.chk_status = chk_status;
	}

	public int getQcclass() {
		return qcclass;
	}

	public void setQcclass(int qcclass) {
		this.qcclass = qcclass;
	}

	public String getqClassName() {
		return qClassName;
	}

	public void setqClassName(String qClassName) {
		this.qClassName = qClassName;
	}

	public String getQcname() {
		return qcname;
	}

	public void setQcname(String qcname) {
		this.qcname = qcname;
	}

	public int getQcnum() {
		return qcnum;
	}

	public void setQcnum(int qcnum) {
		this.qcnum = qcnum;
	}

	public String getQusername() {
		return qusername;
	}

	public void setQusername(String qusername) {
		this.qusername = qusername;
	}

	public int getQusernum() {
		return qusernum;
	}

	public void setQusernum(int qusernum) {
		this.qusernum = qusernum;
	}

	@Override
	public String toString() {
		return "IntranetQna [qno=" + qno + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qwriter=" + qwriter
				+ ", qdate=" + qdate + ", ask_date=" + ask_date + ", chk_status=" + chk_status + ", qcclass=" + qcclass
				+ ", qClassName=" + qClassName + ", qcname=" + qcname + ", qcnum=" + qcnum + ", qusername=" + qusername
				+ ", qusernum=" + qusernum + "]";
	}

	
	
	
	
	
	
	
}
