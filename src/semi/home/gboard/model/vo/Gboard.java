package semi.home.gboard.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Gboard  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2948296909152646776L;
	
	private int gno;
	private String gtitle;
	private String gcontent;
	private String gwriter;
	private int gcount;
	private Date gdate;
	private String gfile;
	private String status;
	
	public Gboard() {
		super();
	}

	public Gboard(int gno, String gtitle, String gcontent, String gwriter, int gcount, Date gdate, String gfile,
			String status) {
		super();
		this.gno = gno;
		this.gtitle = gtitle;
		this.gcontent = gcontent;
		this.gwriter = gwriter;
		this.gcount = gcount;
		this.gdate = gdate;
		this.gfile = gfile;
		this.status = status;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getGtitle() {
		return gtitle;
	}

	public void setGtitle(String gtitle) {
		this.gtitle = gtitle;
	}

	public String getGcontent() {
		return gcontent;
	}

	public void setGcontent(String gcontent) {
		this.gcontent = gcontent;
	}

	public String getGwriter() {
		return gwriter;
	}

	public void setGwriter(String gwriter) {
		this.gwriter = gwriter;
	}

	public int getGcount() {
		return gcount;
	}

	public void setGcount(int gcount) {
		this.gcount = gcount;
	}

	public Date getGdate() {
		return gdate;
	}

	public void setGdate(Date gdate) {
		this.gdate = gdate;
	}

	public String getGfile() {
		return gfile;
	}

	public void setGfile(String gfile) {
		this.gfile = gfile;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Gboard [gno=" + gno + ", gtitle=" + gtitle + ", gcontent=" + gcontent + ", gwriter=" + gwriter
				+ ", gcount=" + gcount + ", gdate=" + gdate + ", gfile=" + gfile + ", status=" + status + "]";
	}
	
	
	
	
	
	
	
	
	
}
