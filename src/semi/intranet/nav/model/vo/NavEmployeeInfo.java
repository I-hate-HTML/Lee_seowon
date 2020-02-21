package semi.intranet.nav.model.vo;

import java.io.Serializable;

public class NavEmployeeInfo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -524129129533962215L;
	
	private int classNum; 	// 교사 담당 반
	private String image;	// 교사 사진
	private String position; // 교사 직책
	
	
	public NavEmployeeInfo() {}


	public NavEmployeeInfo(int classNum, String image, String position) {
		super();
		this.classNum = classNum;
		this.image = image;
		this.position = position;
	}


	public int getClassNum() {
		return classNum;
	}


	public void setClassNum(int classNum) {
		this.classNum = classNum;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}
	

	public String getPosition() {
		return position;
	}


	public void setPosition(String position) {
		this.position = position;
	}


	@Override
	public String toString() {
		return "NavEmployeeInfo [classNum=" + classNum + ", image=" + image + ", position=" + position + "]";
	}


	


	
	
	
	
}
