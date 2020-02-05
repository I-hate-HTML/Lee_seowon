package semi.intranet.daily.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Daily implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int bno;		// 글번호
	private int bclass;		// 반
	private String btitle;	// 글제목
	private String bcontent; // 글내용
	private Date bdate;		// 글번호
	private String bwriter;	// 작성자
	private int bcategory;	// 카테고리 (1-공지사항 / 2-교육일지)
	private String bfile;	// 첨부파일
	private int bwriterCode;// 작성자 직원코드
	private String status;	// 글상태
	
	
	public Daily() {}



	/**
	 * 글 조회용
	 * @param bno
	 * @param bclass
	 * @param btitle
	 * @param bcontent
	 * @param bdate
	 * @param bwriter
	 * @param bcategory
	 * @param bfile
	 * @param bwriterCode
	 * @param status
	 */
	public Daily(int bno, int bclass, String btitle, String bcontent, Date bdate, String bwriter, int bcategory,
			String bfile, int bwriterCode, String status) {
		super();
		this.bno = bno;
		this.bclass = bclass;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bdate = bdate;
		this.bwriter = bwriter;
		this.bcategory = bcategory;
		this.bfile = bfile;
		this.bwriterCode = bwriterCode;
		this.status = status;
	}


	/**
	 * 글 등록용
	 * @param btitle
	 * @param bcontent
	 * @param bwriter
	 * @param bcategory
	 * @param bfile
	 */
	public Daily(String btitle, String bcontent, String bwriter, int bwriterCode, int bcategory, String bfile) {
		super();
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bwriterCode = bwriterCode;
		this.bcategory = bcategory;
		this.bfile = bfile;
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


	@Override
	public String toString() {
		return "Daily [bno=" + bno + ", bclass=" + bclass + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bdate="
				+ bdate + ", bwriter=" + bwriter + ", bcategory=" + bcategory + ", bfile=" + bfile + ", bwriterCode="
				+ bwriterCode + ", status=" + status + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}