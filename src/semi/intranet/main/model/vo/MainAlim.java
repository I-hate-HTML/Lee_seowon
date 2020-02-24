package semi.intranet.main.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MainAlim implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String alimtype;
	private int childname;
	private String title;
	private String writer;
	private Date date;
	
	
	
	public MainAlim() {
	}



	public MainAlim(String alimtype, int childname, String title, String writer, Date date) {
		this.alimtype = alimtype;
		this.childname = childname;
		this.title = title;
		this.writer = writer;
		this.date = date;
	}



	public String getAlimtype() {
		return alimtype;
	}



	public void setAlimtype(String alimtype) {
		this.alimtype = alimtype;
	}



	public int getChildname() {
		return childname;
	}



	public void setChildname(int childname) {
		this.childname = childname;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
	}



	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	@Override
	public String toString() {
		return "MainAlim [alimtype=" + alimtype + ", childname=" + childname + ", title=" + title + ", writer=" + writer
				+ ", date=" + date + "]";
	}
	
	
	
}
