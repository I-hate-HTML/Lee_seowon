package semi.intranet.form.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Form implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int fno;		// 품의번호
	private int fcategory; 	// 카테고리 1- 지출결의서 2- 휴가신청서 3- 교구신청서 4-기타
	private String fwriter;	// 작성자
	private String fWriterId;	// 작성자 코드
	private Date fdate;		// 기안날짜
	private String fsign;	// 결재자
	private String fsignId;	// 결재자 코드
	private String freturnmsg;	// 반려 이유
	private String ftitle;		// 제목
	private String fcontent;	// 내용
	private String ffile;		// 첨부파일
	
	
	public Form() {}


	/**
	 * 품의 작성용
	 * @param fcategory
	 * @param fwriter
	 * @param fWriterId
	 * @param fdate
	 * @param fsign
	 * @param fsignId
	 * @param ftitle
	 * @param fcontent
	 * @param ffile
	 */
	public Form(int fcategory, String fwriter, String fWriterId, Date fdate, String fsign, String fsignId,
			String ftitle, String fcontent, String ffile) {
		super();
		this.fcategory = fcategory;
		this.fwriter = fwriter;
		this.fWriterId = fWriterId;
		this.fdate = fdate;
		this.fsign = fsign;
		this.fsignId = fsignId;
		this.ftitle = ftitle;
		this.fcontent = fcontent;
		this.ffile = ffile;
	}


	/**
	 * 품의 보기용
	 * @param fno
	 * @param fcategory
	 * @param fwriter
	 * @param fWriterId
	 * @param fdate
	 * @param fsign
	 * @param fsignId
	 * @param freturnmsg
	 * @param ftitle
	 * @param fcontent
	 * @param ffile
	 */
	public Form(int fno, int fcategory, String fwriter, String fWriterId, Date fdate, String fsign, String fsignId,
			String freturnmsg, String ftitle, String fcontent, String ffile) {
		super();
		this.fno = fno;
		this.fcategory = fcategory;
		this.fwriter = fwriter;
		this.fWriterId = fWriterId;
		this.fdate = fdate;
		this.fsign = fsign;
		this.fsignId = fsignId;
		this.freturnmsg = freturnmsg;
		this.ftitle = ftitle;
		this.fcontent = fcontent;
		this.ffile = ffile;
	}


	public int getFno() {
		return fno;
	}


	public void setFno(int fno) {
		this.fno = fno;
	}


	public int getFcategory() {
		return fcategory;
	}


	public void setFcategory(int fcategory) {
		this.fcategory = fcategory;
	}


	public String getFwriter() {
		return fwriter;
	}


	public void setFwriter(String fwriter) {
		this.fwriter = fwriter;
	}


	public String getfWriterId() {
		return fWriterId;
	}


	public void setfWriterId(String fWriterId) {
		this.fWriterId = fWriterId;
	}


	public Date getFdate() {
		return fdate;
	}


	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}


	public String getFsign() {
		return fsign;
	}


	public void setFsign(String fsign) {
		this.fsign = fsign;
	}


	public String getFsignId() {
		return fsignId;
	}


	public void setFsignId(String fsignId) {
		this.fsignId = fsignId;
	}


	public String getFreturnmsg() {
		return freturnmsg;
	}


	public void setFreturnmsg(String freturnmsg) {
		this.freturnmsg = freturnmsg;
	}


	public String getFtitle() {
		return ftitle;
	}


	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}


	public String getFcontent() {
		return fcontent;
	}


	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}


	public String getFfile() {
		return ffile;
	}


	public void setFfile(String ffile) {
		this.ffile = ffile;
	}


	@Override
	public String toString() {
		return "Form [fno=" + fno + ", fcategory=" + fcategory + ", fwriter=" + fwriter + ", fWriterId=" + fWriterId
				+ ", fdate=" + fdate + ", fsign=" + fsign + ", fsignId=" + fsignId + ", freturnmsg=" + freturnmsg
				+ ", ftitle=" + ftitle + ", fcontent=" + fcontent + ", ffile=" + ffile + "]";
	}


	
	
	
	
	
	
	

}
