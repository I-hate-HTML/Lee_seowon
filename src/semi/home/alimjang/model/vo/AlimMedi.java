package semi.home.alimjang.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class AlimMedi implements Serializable{

	private int almd_no;
	private int al_code;
	private int cno;
	private String almd_con;
	private String almd_type;
	private String almd_vol;
	private String almd_num;
	private String almd_time;
	private String almd_temp;
	private String almd_ps;
	private String almd_writer;
	private Date almd_date;

	public AlimMedi() {}

	/** 홈페이지 등록용
	 * @param almd_con
	 * @param almd_type
	 * @param almd_vol
	 * @param almd_num
	 * @param almd_time
	 * @param almd_temp
	 * @param almd_ps
	 * @param almd_writer
	 */
	public AlimMedi(String almd_con, String almd_type, String almd_vol, String almd_num, String almd_time,
			String almd_temp, String almd_ps, String almd_writer) {
		super();
		this.almd_con = almd_con;
		this.almd_type = almd_type;
		this.almd_vol = almd_vol;
		this.almd_num = almd_num;
		this.almd_time = almd_time;
		this.almd_temp = almd_temp;
		this.almd_ps = almd_ps;
		this.almd_writer = almd_writer;
	}

	/** 인트라넷 조회용
	 * @param almd_no
	 * @param al_code
	 * @param cno
	 * @param almd_con
	 * @param almd_type
	 * @param almd_vol
	 * @param almd_num
	 * @param almd_time
	 * @param almd_temp
	 * @param almd_ps
	 * @param almd_writer
	 * @param almd_date
	 */
	public AlimMedi(int almd_no, int al_code, int cno, String almd_con, String almd_type, String almd_vol,
			String almd_num, String almd_time, String almd_temp, String almd_ps, String almd_writer, Date almd_date) {
		super();
		this.almd_no = almd_no;
		this.al_code = al_code;
		this.cno = cno;
		this.almd_con = almd_con;
		this.almd_type = almd_type;
		this.almd_vol = almd_vol;
		this.almd_num = almd_num;
		this.almd_time = almd_time;
		this.almd_temp = almd_temp;
		this.almd_ps = almd_ps;
		this.almd_writer = almd_writer;
		this.almd_date = almd_date;
	}

	public int getAlmd_no() {
		return almd_no;
	}

	public void setAlmd_no(int almd_no) {
		this.almd_no = almd_no;
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

	public String getAlmd_con() {
		return almd_con;
	}

	public void setAlmd_con(String almd_con) {
		this.almd_con = almd_con;
	}

	public String getAlmd_type() {
		return almd_type;
	}

	public void setAlmd_type(String almd_type) {
		this.almd_type = almd_type;
	}

	public String getAlmd_vol() {
		return almd_vol;
	}

	public void setAlmd_vol(String almd_vol) {
		this.almd_vol = almd_vol;
	}

	public String getAlmd_num() {
		return almd_num;
	}

	public void setAlmd_num(String almd_num) {
		this.almd_num = almd_num;
	}

	public String getAlmd_time() {
		return almd_time;
	}

	public void setAlmd_time(String almd_time) {
		this.almd_time = almd_time;
	}

	public String getAlmd_temp() {
		return almd_temp;
	}

	public void setAlmd_temp(String almd_temp) {
		this.almd_temp = almd_temp;
	}

	public String getAlmd_ps() {
		return almd_ps;
	}

	public void setAlmd_ps(String almd_ps) {
		this.almd_ps = almd_ps;
	}

	public String getAlmd_writer() {
		return almd_writer;
	}

	public void setAlmd_writer(String almd_writer) {
		this.almd_writer = almd_writer;
	}

	public Date getAlmd_date() {
		return almd_date;
	}

	public void setAlmd_date(Date almd_date) {
		this.almd_date = almd_date;
	}

	@Override
	public String toString() {
		return "AlimMedi [almd_no=" + almd_no + ", al_code=" + al_code + ", cno=" + cno + ", almd_con=" + almd_con
				+ ", almd_type=" + almd_type + ", almd_vol=" + almd_vol + ", almd_num=" + almd_num + ", almd_time="
				+ almd_time + ", almd_temp=" + almd_temp + ", almd_ps=" + almd_ps + ", almd_writer=" + almd_writer
				+ ", almd_date=" + almd_date + "]";
	}
	
	
	
	
	
	
	
}
