package semi.intranet.nav.model.vo;

import java.util.Date;

public class NavForm {

	private int fno;
	private String name;
	private Date date;
	private String process;
	private String title;
	private String img;
	private int count;
	
	
	public NavForm() {}


	/**
	 * 알림 가져오기
	 * @param fno
	 * @param name
	 * @param date
	 * @param process
	 * @param title
	 * @param img
	 * @param count
	 */
	public NavForm(int fno, String name, Date date, String process, String title, String img, int count) {
		super();
		this.fno = fno;
		this.name = name;
		this.date = date;
		this.process = process;
		this.title = title;
		this.img = img;
		this.count = count;
	}



	public int getFno() {
		return fno;
	}


	public void setFno(int fno) {
		this.fno = fno;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Date getDate() {
		return date;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	public String getProcess() {
		return process;
	}


	public void setProcess(String process) {
		this.process = process;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	
	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	@Override
	public String toString() {
		return "NavForm [fno=" + fno + ", name=" + name + ", date=" + date + ", process=" + process + ", title=" + title
				+ ", img=" + img + "]";
	}
	
	
	
	
	
	
	
}
