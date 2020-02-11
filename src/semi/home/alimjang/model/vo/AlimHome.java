package semi.home.alimjang.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AlimHome implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4252561605513901137L;
	private int alhm_no;
	private int al_code;
	private int cno;
	private String alhm_wayhome;
	private String alhm_time;
	private String alhm_status;
	private String alhm_phone;
	private String alhm_status2;
	private String alhm_phone2;
	private String alhm_writer;
	private Date alhm_date;
	
	public AlimHome() {}

	public AlimHome(String alhm_wayhome, String alhm_time, String alhm_status, String alhm_phone, String alhm_status2,
			String alhm_phone2, String alhm_writer) {
		super();
		this.alhm_wayhome = alhm_wayhome;
		this.alhm_time = alhm_time;
		this.alhm_status = alhm_status;
		this.alhm_phone = alhm_phone;
		this.alhm_status2 = alhm_status2;
		this.alhm_phone2 = alhm_phone2;
		this.alhm_writer = alhm_writer;
	}

	public int getAlhm_no() {
		return alhm_no;
	}

	public void setAlhm_no(int alhm_no) {
		this.alhm_no = alhm_no;
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

	public String getAlhm_wayhome() {
		return alhm_wayhome;
	}

	public void setAlhm_wayhome(String alhm_wayhome) {
		this.alhm_wayhome = alhm_wayhome;
	}

	public String getAlhm_time() {
		return alhm_time;
	}

	public void setAlhm_time(String alhm_time) {
		this.alhm_time = alhm_time;
	}

	public String getAlhm_status() {
		return alhm_status;
	}

	public void setAlhm_status(String alhm_status) {
		this.alhm_status = alhm_status;
	}

	public String getAlhm_phone() {
		return alhm_phone;
	}

	public void setAlhm_phone(String alhm_phone) {
		this.alhm_phone = alhm_phone;
	}

	public String getAlhm_status2() {
		return alhm_status2;
	}

	public void setAlhm_status2(String alhm_status2) {
		this.alhm_status2 = alhm_status2;
	}

	public String getAlhm_phone2() {
		return alhm_phone2;
	}

	public void setAlhm_phone2(String alhm_phone2) {
		this.alhm_phone2 = alhm_phone2;
	}

	public String getAlhm_writer() {
		return alhm_writer;
	}

	public void setAlhm_writer(String alhm_writer) {
		this.alhm_writer = alhm_writer;
	}

	public Date getAlhm_date() {
		return alhm_date;
	}

	public void setAlhm_date(Date alhm_date) {
		this.alhm_date = alhm_date;
	}

	@Override
	public String toString() {
		return "AlimHome [alhm_no=" + alhm_no + ", al_code=" + al_code + ", cno=" + cno + ", alhm_wayhome="
				+ alhm_wayhome + ", alhm_time=" + alhm_time + ", alhm_status=" + alhm_status + ", alhm_phone="
				+ alhm_phone + ", alhm_status2=" + alhm_status2 + ", alhm_phone2=" + alhm_phone2 + ", alhm_writer="
				+ alhm_writer + ", alhm_date=" + alhm_date + "]";
	}


	
	
	

}
