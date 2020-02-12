package semi.intranet.calendar.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Calendar implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1681590146656378574L;
	
	private String title;
	private String content;
	private Date start;
	private Date end;
	private String type;
	private String user;
	
	public Calendar() {}

	public Calendar(String title, String content, Date start, Date end, String type, String user) {
		this.title = title;
		this.content = content;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getStart() {
		return start;
	}

	public void setStart(Date start) {
		this.start = start;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
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
		return "Calendar [title=" + title + ", content=" + content + ", start=" + start + ", end=" + end + ", type="
				+ type + ", user=" + user + "]";
	}
	
	
	
	
	
	
}
