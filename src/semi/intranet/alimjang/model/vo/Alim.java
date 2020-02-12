package semi.intranet.alimjang.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Alim implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7916288263869408526L;
	
	private int ano; 		// 글번호
	private int acategory; 	//  1-알림장 2-귀가 3-투약
	private String category; // 카테고리 이름
	private String achild;	// 아이 이름
	private int ccode;		// 아이 코드
	private int cclass;		// 아이 반
	private String awriter;	// 작성자 id
	private Date adate;		// 작성 날짜
	private String ack;		// 글 확인
	
	public Alim() {}

	
	/**
	 * 알림장 리스트 불러오기용
	 * @param ano
	 * @param acategory
	 * @param category
	 * @param achild
	 * @param ccode
	 * @param cclass
	 * @param awriter
	 * @param adate
	 * @param ack
	 */
	public Alim(int ano, int acategory, String category, String achild, int ccode, int cclass, String awriter,
			Date adate, String ack) {
		super();
		this.ano = ano;
		this.acategory = acategory;
		this.category = category;
		this.achild = achild;
		this.ccode = ccode;
		this.cclass = cclass;
		this.awriter = awriter;
		this.adate = adate;
		this.ack = ack;
	}


	public int getAno() {
		return ano;
	}


	public void setAno(int ano) {
		this.ano = ano;
	}


	public int getAcategory() {
		return acategory;
	}


	public void setAcategory(int acategory) {
		this.acategory = acategory;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getAchild() {
		return achild;
	}


	public void setAchild(String achild) {
		this.achild = achild;
	}


	public int getCcode() {
		return ccode;
	}


	public void setCcode(int ccode) {
		this.ccode = ccode;
	}


	public int getCclass() {
		return cclass;
	}


	public void setCclass(int cclass) {
		this.cclass = cclass;
	}


	public String getAwriter() {
		return awriter;
	}


	public void setAwriter(String awriter) {
		this.awriter = awriter;
	}


	public Date getAdate() {
		return adate;
	}


	public void setAdate(Date adate) {
		this.adate = adate;
	}


	public String getAck() {
		return ack;
	}


	public void setAck(String ack) {
		this.ack = ack;
	}


	@Override
	public String toString() {
		return "Alim [ano=" + ano + ", acategory=" + acategory + ", category=" + category + ", achild=" + achild
				+ ", ccode=" + ccode + ", cclass=" + cclass + ", awriter=" + awriter + ", adate=" + adate + ", ack="
				+ ack + "]";
	}
	
	
	

	
	
	
	
	

}
