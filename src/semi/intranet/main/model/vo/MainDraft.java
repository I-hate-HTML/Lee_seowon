package semi.intranet.main.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MainDraft implements Serializable
{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int type;
	private String now;
	private String title;
	private int user;
	private Date date;
	
	public MainDraft() {}

	public MainDraft(int type, String now, String title, int user, Date date) {
		this.type = type;
		this.now = now;
		this.title = title;
		this.user = user;
		this.date = date;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getNow() {
		return now;
	}

	public void setNow(String now) {
		this.now = now;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
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
		return "MainDraft [type=" + type + ", now=" + now + ", title=" + title + ", user=" + user + ", date=" + date
				+ "]";
	}
	
	
}
