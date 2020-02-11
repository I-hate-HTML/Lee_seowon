package semi.home.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriter;
	private int bcount;
	private Date bdate;
	private Date qdate;
	private int btype;
	private String bfile;
	private String bstatus;
	private String qstatus;
	
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
	public Board(int bno, String btitle, String bcontent, String bwriter, int bcount, Date bdate) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bcount = bcount;
		this.bdate = bdate;
	}



	public Board(int bno, String btitle, String bcontent, String bwriter, int bcount, Date bdate, int btype,
			String bfile, String bstatus) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bcount = bcount;
		this.bdate = bdate;
		this.btype = btype;
		this.bfile = bfile;
		this.bstatus = bstatus;
	}

	public Board(int bno, String btitle, String bcontent, String bwriter, int bcount, Date bdate, Date qdate, int btype,
			String bfile, String qstatus) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bcount = bcount;
		this.bdate = bdate;
		this.qdate = qdate;
		this.btype = btype;
		this.bfile = bfile;
		this.qstatus = qstatus;
	}

	public Board(int bno, String btitle, String bcontent, String bwriter, int bcount, Date bdate, Date qdate, int btype,
			String bfile, String bstatus, String qstatus) {
		super();
		this.bno = bno;
		this.btitle = btitle;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bcount = bcount;
		this.bdate = bdate;
		this.qdate = qdate;
		this.btype = btype;
		this.bfile = bfile;
		this.bstatus = bstatus;
		this.qstatus = qstatus;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public int getBcount() {
		return bcount;
	}

	public void setBcount(int bcount) {
		this.bcount = bcount;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

	public Date getQdate() {
		return qdate;
	}

	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}

	public int getBtype() {
		return btype;
	}

	public void setBtype(int btype) {
		this.btype = btype;
	}

	public String getBfile() {
		return bfile;
	}

	public void setBfile(String bfile) {
		this.bfile = bfile;
	}

	public String getBstatus() {
		return bstatus;
	}

	public void setBstatus(String bstatus) {
		this.bstatus = bstatus;
	}

	public String getQstatus() {
		return qstatus;
	}

	public void setQstatus(String qstatus) {
		this.qstatus = qstatus;
	}

	@Override
	public String toString() {
		return "Board [bno=" + bno + ", btitle=" + btitle + ", bcontent=" + bcontent + ", bwriter=" + bwriter
				+ ", bcount=" + bcount + ", bdate=" + bdate + ", qdate=" + qdate + ", btype=" + btype + ", bfile="
				+ bfile + ", bstatus=" + bstatus + ", qstatus=" + qstatus + "]";
	}
	
	
	
	
}
