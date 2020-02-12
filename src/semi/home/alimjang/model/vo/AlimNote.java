package semi.home.alimjang.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AlimNote implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 8768683683514038596L;
	private int al_no; 
	private int al_code;
	private int cno;
	private String al_content;
	private String al_feel;
	private String al_health;
	private String al_temp;
	private String al_meal;
	private String al_sleep;
	private String al_poop;
	private String al_writer;
	private Date al_date;
	
	public AlimNote() {} // 기본생성자

	/** 알림장 등록용
	 * @param al_content
	 * @param al_feel
	 * @param al_health
	 * @param al_temp
	 * @param al_meal
	 * @param al_sleep
	 * @param al_poop
	 * @param al_writer
	 */
	public AlimNote(String al_content, String al_feel, String al_health, String al_temp, String al_meal,
			String al_sleep, String al_poop, String al_writer) {
		super();
		this.al_content = al_content;
		this.al_feel = al_feel;
		this.al_health = al_health;
		this.al_temp = al_temp;
		this.al_meal = al_meal;
		this.al_sleep = al_sleep;
		this.al_poop = al_poop;
		this.al_writer = al_writer;
	}

	// 조회는 인트라넷에서~~ --> 오키오키
	/**
	 * 알림장 읽기용
	 * @param al_no
	 * @param al_code
	 * @param cno
	 * @param al_content
	 * @param al_feel
	 * @param al_health
	 * @param al_temp
	 * @param al_meal
	 * @param al_sleep
	 * @param al_poop
	 * @param al_writer
	 * @param al_date
	 */
	public AlimNote(int al_no, int al_code, int cno, String al_content, String al_feel, String al_health,
			String al_temp, String al_meal, String al_sleep, String al_poop, String al_writer, Date al_date) {
		super();
		this.al_no = al_no;
		this.al_code = al_code;
		this.cno = cno;
		this.al_content = al_content;
		this.al_feel = al_feel;
		this.al_health = al_health;
		this.al_temp = al_temp;
		this.al_meal = al_meal;
		this.al_sleep = al_sleep;
		this.al_poop = al_poop;
		this.al_writer = al_writer;
		this.al_date = al_date;
	}
	
	
	public int getAl_no() {
		return al_no;
	}


	public void setAl_no(int al_no) {
		this.al_no = al_no;
	}

	public int getAl_code() {
		return al_code;
	}

	public void setAl_code(int al_code) {
		this.al_code = al_code;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getAl_content() {
		return al_content;
	}

	public void setAl_content(String al_content) {
		this.al_content = al_content;
	}

	public String getAl_feel() {
		return al_feel;
	}

	public void setAl_feel(String al_feel) {
		this.al_feel = al_feel;
	}

	public String getAl_health() {
		return al_health;
	}

	public void setAl_health(String al_health) {
		this.al_health = al_health;
	}

	public String getAl_temp() {
		return al_temp;
	}

	public void setAl_temp(String al_temp) {
		this.al_temp = al_temp;
	}

	public String getAl_meal() {
		return al_meal;
	}

	public void setAl_meal(String al_meal) {
		this.al_meal = al_meal;
	}

	public String getAl_sleep() {
		return al_sleep;
	}

	public void setAl_sleep(String al_sleep) {
		this.al_sleep = al_sleep;
	}

	public String getAl_poop() {
		return al_poop;
	}

	public void setAl_poop(String al_poop) {
		this.al_poop = al_poop;
	}

	public String getAl_writer() {
		return al_writer;
	}

	public void setAl_writer(String al_writer) {
		this.al_writer = al_writer;
	}

	public Date getAl_date() {
		return al_date;
	}

	public void setAl_date(Date al_date) {
		this.al_date = al_date;
	}

	@Override
	public String toString() {
		return "AlimNote [al_no=" + al_no + ", al_code=" + al_code + ", cno=" + cno + ", al_content=" + al_content
				+ ", al_feel=" + al_feel + ", al_health=" + al_health + ", al_temp=" + al_temp + ", al_meal=" + al_meal
				+ ", al_sleep=" + al_sleep + ", al_poop=" + al_poop + ", al_writer=" + al_writer + ", al_date="
				+ al_date + "]";
	}
	
	
	

}
