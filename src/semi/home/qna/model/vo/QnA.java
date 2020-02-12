package semi.home.qna.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class QnA implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -26919696308774506L;
	private int qno;
	private String qtitle;
	private String qcontent;
	private String qwriter;
	private Date qdate;
	private Date ask_date;
	private String chk_status;
	
	public QnA() {}

	/** qna 등록
	 * @param qtitle
	 * @param qcontent
	 * @param qwriter
	 * @param ask_date
	 */
	public QnA(String qtitle, String qcontent, String qwriter, Date ask_date) {
		super();
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qwriter = qwriter;
		this.ask_date = ask_date;	// 상담요청 날짜
	}

	/** qna 홈페이지 확인
	 * @param qno
	 * @param qtitle
	 * @param qwriter
	 * @param qdate
	 * @param chk_status
	 */
	public QnA(int qno, String qtitle, String qwriter, Date qdate, String chk_status) {
		super();
		this.qno = qno;
		this.qtitle = qtitle;
		this.qwriter = qwriter;
		this.qdate = qdate;
		this.chk_status = chk_status;
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

	@Override
	public String toString() {
		return "QnA [qno=" + qno + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qwriter=" + qwriter + ", qdate="
				+ qdate + ", ask_date=" + ask_date + ", chk_status=" + chk_status + "]";
	}
	
	
	
	

}
