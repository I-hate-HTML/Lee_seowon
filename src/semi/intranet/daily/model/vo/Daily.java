package semi.intranet.daily.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Daily implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -7526365370075270878L;

	private int bno;		// 글번호
	private int bclass;		// 반번호
	private String bclassName; // 반이름
	private String btitle;	// 글제목
	private String bcontent; // 글내용
	private Date bdate;		// 작성 날짜
	private String bwriter;	// 작성자
	private int bcategory;	// 카테고리 (1-공지사항 / 2-교육일지)
	private String bfile;	// 첨부파일
	private int bwriterCode;// 작성자 직원코드
	private String status;	// 글상태
	private int bcount;		// 글카운트
	private int rownum;		// 글 정렬용
	
	
	public Daily() {}


	/**
	 * 글 조회용
	 * @param bno
	 * @param bclass
	 * @param bclassName
	 * @param btitle
	 * @param bcontent
	 * @param bdate
	 * @param bwriter
	 * @param bcategory
	 * @param bfile
	 * @param bwriterCode
	 * @param status
	 * @param bcount
	 * @param rownum
	 */
	public Daily(int bno, int bclass, String bclassName, String btitle, String bcontent, Date bdate, String bwriter,
			int bcategory, String bfile, int bwriterCode, String status, int bcount, int rownum) {
		super();
		this.bno = bno;
		this.bclass = bclass;
		this.bclassName = bclassName;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.bwriter = bwriter;
		this.bcategory = bcategory;
		this.bfile = bfile;
		this.bwriterCode = bwriterCode;
		this.status = status;
		this.bcount = bcount;
		this.rownum = rownum;
	}

	

	/**
	 * 글 수정용
	 * @param btitle
	 * @param bcontent
	 * @param bwriter
	 * @param bcategory
	 * @param bfile
	 * @param bwriterCode
	 */
	public Daily(String btitle, String bcontent, String bwriter, int bcategory, String bfile, int bwriterCode) {
		super();
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bcategory = bcategory;
		this.bfile = bfile;
		this.bwriterCode = bwriterCode;
	}


	/**
	 * 글 등록용
	 * @param bclass
	 * @param btitle
	 * @param bcontent
	 * @param bwriter
	 * @param bcategory
	 * @param bfile
	 * @param bwriterCode
	 */
	public Daily(int bclass, String btitle, String bcontent, String bwriter, int bcategory, String bfile,
			int bwriterCode) {
		super();
		this.bclass = bclass;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bcategory = bcategory;
		this.bfile = bfile;
		this.bwriterCode = bwriterCode;
	}


	public int getBno() {
		return bno;
	}


	public void setBno(int bno) {
		this.bno = bno;
	}


	public int getBclass() {
		return bclass;
	}


	public void setBclass(int bclass) {
		this.bclass = bclass;
	}


	public String getBtitle() {
		return btitle;
	}


	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}


	public String getBcontent() {
		return bcontent;
	}


	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}


	public Date getBdate() {
		return bdate;
	}


	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}


	public String getBwriter() {
		return bwriter;
	}


	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}


	public int getBcategory() {
		return bcategory;
	}


	public void setBcategory(int bcategory) {
		this.bcategory = bcategory;
	}


	public String getBfile() {
		return bfile;
	}


	public void setBfile(String bfile) {
		this.bfile = bfile;
	}


	public int getBwriterCode() {
		return bwriterCode;
	}


	public void setBwriterCode(int bwriterCode) {
		this.bwriterCode = bwriterCode;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public int getBcount() {
		return bcount;
	}


	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	

	public int getRownum() {
		return rownum;
	}


	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	

	public String getBclassName() {
		return bclassName;
	}


	public void setBclassName(String bclassName) {
		this.bclassName = bclassName;
	}


	@Override
	public String toString() {
		return "Daily [bno=" + bno + ", bclass=" + bclass + ", bclassName=" + bclassName + ", btitle=" + btitle
				+ ", bcontent=" + bcontent + ", bdate=" + bdate + ", bwriter=" + bwriter + ", bcategory=" + bcategory
				+ ", bfile=" + bfile + ", bwriterCode=" + bwriterCode + ", status=" + status + ", bcount=" + bcount
				+ ", rownum=" + rownum + "]";
	}



}