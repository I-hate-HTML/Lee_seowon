package semi.home.foodcalendar.model.vo;

import java.io.Serializable;

public class FoodCalendar implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String FcalMonth;
	private String FcalImg;
	
	public FoodCalendar() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FoodCalendar(String fcalMonth, String fcalImg) {
		super();
		FcalMonth = fcalMonth;
		FcalImg = fcalImg;
	}
	public String getFcalMonth() {
		return FcalMonth;
	}
	public void setFcalMonth(String fcalMonth) {
		FcalMonth = fcalMonth;
	}
	public String getFcalImg() {
		return FcalImg;
	}
	public void setFcalImg(String fcalImg) {
		FcalImg = fcalImg;
	}
	@Override
	public String toString() {
		return "FoodCalendar [FcalMonth=" + FcalMonth + ", FcalImg=" + FcalImg + "]";
	}
	
	
	
		
}
