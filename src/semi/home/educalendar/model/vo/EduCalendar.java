package semi.home.educalendar.model.vo;

import java.io.Serializable;

public class EduCalendar implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1701767791879839916L;
	private String edudate;
	private String eduimg;
	public EduCalendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public EduCalendar(String edudate, String eduimg) {
		super();
		this.edudate = edudate;
		this.eduimg = eduimg;
	}
	public String getEdudate() {
		return edudate;
	}
	public void setEdudate(String edudate) {
		this.edudate = edudate;
	}
	public String getEduimg() {
		return eduimg;
	}
	public void setEduimg(String eduimg) {
		this.eduimg = eduimg;
	}
	@Override
	public String toString() {
		return "EduCalendar [edudate=" + edudate + ", eduimg=" + eduimg + "]";
	}
	
	
	
}
