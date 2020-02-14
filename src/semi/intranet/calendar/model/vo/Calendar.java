package semi.intranet.calendar.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Calendar implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1681590146656378574L;
	
	private String title;
	private String start;
	private String end;
	private String type;
	private String user;
	
	public Calendar() {}

	public Calendar(String title, String start, String end, String type, String user) {
		this.title = title;
		this.start = start;
		this.end = end;
		this.type = type;
		this.user = user;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Calendar [title=" + title + ", start=" + start + ", end=" + end + ", type=" + type + ", user=" + user
				+ "]";
	}

	
	
	
	
}
