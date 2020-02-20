package semi.intranet.form.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

/**
 * @author SERYE
 *
 */
public class Form implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int fno;		// 품의번호
	private int fcategory; 	// 카테고리 1- 지출결의서 2- 휴가신청서 3- 교구신청서 4-기타
	private String fwriter;	// 작성자
	private int fWriterId;	// 작성자 코드
	private Date fdate;		// 기안날짜
	private String fSignList; // 결재자코드 저장용
	private String fSignckList; // 결재자 확인 저장용
	private String[] fsign;	// 결재자
	private int[] fsignId;	// 결재자 코드
	private String[] fsignck; // 결재자 확인
	private String freturnmsg;	// 반려 이유
	private String ftitle;		// 제목
	private String fcontent;	// 내용
	private String ffile;		// 첨부파일
	private String fstatus;		// 결재 상태
	private String category;	// 카테고리 string
	
	
	
	
	public Form() {}




	/**
	 * 품의 저장용
	 * @param fno
	 * @param fcategory
	 * @param fwriter
	 * @param fWriterId
	 * @param fdate
	 * @param fSignList
	 * @param ftitle
	 * @param fcontent
	 * @param ffile
	 */
	public Form(int fcategory, String fwriter, int fWriterId, Date fdate, String fSignList, String ftitle,
			String fcontent, String ffile) {
		super();
		this.fcategory = fcategory;
		this.fwriter = fwriter;
		this.fWriterId = fWriterId;
		this.fdate = fdate;
		this.fSignList = fSignList;
		this.ftitle = ftitle;
		this.fcontent = fcontent;
		this.ffile = ffile;
	}




	/**
	 * 품의 읽기용
	 * @param fno
	 * @param fcategory
	 * @param fwriter
	 * @param fWriterId
	 * @param fdate
	 * @param fSignList
	 * @param fSignckList
	 * @param fsign
	 * @param fsignId
	 * @param fsignck
	 * @param freturnmsg
	 * @param ftitle
	 * @param fcontent
	 * @param ffile
	 * @param fstatus
	 * @param category
	 */
	public Form(int fno, int fcategory, String fwriter, int fWriterId, Date fdate, String fSignList, String fSignckList,
			String[] fsign, int[] fsignId, String[] fsignck, String freturnmsg, String ftitle, String fcontent,
			String ffile, String fstatus, String category) {
		super();
		this.fno = fno;
		this.fcategory = fcategory;
		this.fwriter = fwriter;
		this.fWriterId = fWriterId;
		this.fdate = fdate;
		this.fSignList = fSignList;
		this.fSignckList = fSignckList;
		this.fsign = fsign;
		this.fsignId = fsignId;
		this.fsignck = fsignck;
		this.freturnmsg = freturnmsg;
		this.ftitle = ftitle;
		this.fcontent = fcontent;
		this.ffile = ffile;
		this.fstatus = fstatus;
		this.category = category;
	}




	public String getfSignckList() {
		return fSignckList;
	}




	public void setfSignckList(String fSignckList) {
		this.fSignckList = fSignckList;
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




	public int getfWriterId() {
		return fWriterId;
	}




	public void setfWriterId(int fWriterId) {
		this.fWriterId = fWriterId;
	}




	public Date getFdate() {
		return fdate;
	}




	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}




	public String getfSignList() {
		return fSignList;
	}




	public void setfSignList(String fSignList) {
		this.fSignList = fSignList;
	}




	public String[] getFsign() {
		return fsign;
	}




	public void setFsign(String[] fsign) {
		this.fsign = fsign;
	}




	public int[] getFsignId() {
		return fsignId;
	}




	public void setFsignId(int[] fsignId) {
		this.fsignId = fsignId;
	}




	public String[] getFsignck() {
		return fsignck;
	}




	public void setFsignck(String[] fsignck) {
		this.fsignck = fsignck;
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




	public String getFstatus() {
		return fstatus;
	}




	public void setFstatus(String fstatus) {
		this.fstatus = fstatus;
	}




	public String getCategory() {
		return category;
	}




	public void setCategory(String category) {
		this.category = category;
	}




	@Override
	public String toString() {
		return "Form [fno=" + fno + ", fcategory=" + fcategory + ", fwriter=" + fwriter + ", fWriterId=" + fWriterId
				+ ", fdate=" + fdate + ", fSignList=" + fSignList + ", fsign=" + Arrays.toString(fsign) + ", fsignId="
				+ Arrays.toString(fsignId) + ", fsignck=" + Arrays.toString(fsignck) + ", freturnmsg=" + freturnmsg
				+ ", ftitle=" + ftitle + ", fcontent=" + fcontent + ", ffile=" + ffile + ", fstatus=" + fstatus
				+ ", category=" + category + "]";
	}

	
	

	
	

}
