package semi.intranet.form.model.vo;

import java.io.Serializable;
import java.sql.Date;

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
	private String fsign1;	// 결재자
	private int fsignId1;	// 결재자 코드
	private String fsignck1; // 결재자 확인
	private String fsign2;	// 결재자
	private int fsignId2;	// 결재자 코드
	private String fsignck2; // 결재자 확인
	private String fsign3;	// 결재자
	private int fsignId3;	// 결재자 코드
	private String fsignck3; // 결재자 확인
	private String freturnmsg;	// 반려 이유
	private String ftitle;		// 제목
	private String fcontent;	// 내용
	private String ffile;		// 첨부파일
	private String fstatus;		// 결재 상태
	private String category;	// 카테고리 string
	private int type;		// list 구분용 type --> 1 read / 2 readSign / 3 modify / 4 signModify 
	
	
	
	public Form() {}



	/**
	 * 품의 작성용
	 * @param fcategory
	 * @param fwriter
	 * @param fWriterId
	 * @param fdate
	 * @param fsign1
	 * @param fsignId1
	 * @param fsign2
	 * @param fsignId2
	 * @param fsign3
	 * @param fsignId3
	 * @param ftitle
	 * @param fcontent
	 */
	public Form(int fcategory, String fwriter, int fWriterId, Date fdate, String fsign1, int fsignId1, String fsign2,
			int fsignId2, String fsign3, int fsignId3, String ftitle, String fcontent, int type) {
		super();
		this.fcategory = fcategory;
		this.fwriter = fwriter;
		this.fWriterId = fWriterId;
		this.fdate = fdate;
		this.fsign1 = fsign1;
		this.fsignId1 = fsignId1;
		this.fsign2 = fsign2;
		this.fsignId2 = fsignId2;
		this.fsign3 = fsign3;
		this.fsignId3 = fsignId3;
		this.ftitle = ftitle;
		this.fcontent = fcontent;
		this.type = type;
	}


	public Form(int fno, int fcategory, String fwriter, int fWriterId, Date fdate, String fsign1, int fsignId1,
			String fsignck1, String fsign2, int fsignId2, String fsignck2, String fsign3, int fsignId3, String fsignck3,
			String freturnmsg, String ftitle, String fcontent, String ffile, String fstatus, String category,
			int type) {
		super();
		this.fno = fno;
		this.fcategory = fcategory;
		this.fwriter = fwriter;
		this.fWriterId = fWriterId;
		this.fdate = fdate;
		this.fsign1 = fsign1;
		this.fsignId1 = fsignId1;
		this.fsignck1 = fsignck1;
		this.fsign2 = fsign2;
		this.fsignId2 = fsignId2;
		this.fsignck2 = fsignck2;
		this.fsign3 = fsign3;
		this.fsignId3 = fsignId3;
		this.fsignck3 = fsignck3;
		this.freturnmsg = freturnmsg;
		this.ftitle = ftitle;
		this.fcontent = fcontent;
		this.ffile = ffile;
		this.fstatus = fstatus;
		this.category = category;
		this.type = type;
	}



	public int getType() {
		return type;
	}



	public void setType(int type) {
		this.type = type;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
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


	public String getFsign1() {
		return fsign1;
	}


	public void setFsign1(String fsign1) {
		this.fsign1 = fsign1;
	}


	public int getFsignId1() {
		return fsignId1;
	}


	public void setFsignId1(int fsignId1) {
		this.fsignId1 = fsignId1;
	}


	public String getFsignck1() {
		return fsignck1;
	}


	public void setFsignck1(String fsignck1) {
		this.fsignck1 = fsignck1;
	}


	public String getFsign2() {
		return fsign2;
	}


	public void setFsign2(String fsign2) {
		this.fsign2 = fsign2;
	}


	public int getFsignId2() {
		return fsignId2;
	}


	public void setFsignId2(int fsignId2) {
		this.fsignId2 = fsignId2;
	}


	public String getFsignck2() {
		return fsignck2;
	}


	public void setFsignck2(String fsignck2) {
		this.fsignck2 = fsignck2;
	}


	public String getFsign3() {
		return fsign3;
	}


	public void setFsign3(String fsign3) {
		this.fsign3 = fsign3;
	}


	public int getFsignId3() {
		return fsignId3;
	}


	public void setFsignId3(int fsignId3) {
		this.fsignId3 = fsignId3;
	}


	public String getFsignck3() {
		return fsignck3;
	}


	public void setFsignck3(String fsignck3) {
		this.fsignck3 = fsignck3;
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


	@Override
	public String toString() {
		return "Form [fno=" + fno + ", fcategory=" + fcategory + ", fwriter=" + fwriter + ", fWriterId=" + fWriterId
				+ ", fdate=" + fdate + ", fsign1=" + fsign1 + ", fsignId1=" + fsignId1 + ", fsignck1=" + fsignck1
				+ ", fsign2=" + fsign2 + ", fsignId2=" + fsignId2 + ", fsignck2=" + fsignck2 + ", fsign3=" + fsign3
				+ ", fsignId3=" + fsignId3 + ", fsignck3=" + fsignck3 + ", freturnmsg=" + freturnmsg + ", ftitle="
				+ ftitle + ", fcontent=" + fcontent + ", ffile=" + ffile + ", fstatus=" + fstatus + "]";
	}


	
	
	
	
	
	
	
	

}
