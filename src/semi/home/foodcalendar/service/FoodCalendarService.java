package semi.home.foodcalendar.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

import semi.home.foodcalendar.model.dao.FoodCalendarDao;
import semi.home.foodcalendar.model.vo.FoodCalendar;

public class FoodCalendarService {

	public int imginput(String fdate, String fcalimg) {
		Connection con = getConnection();
		// 이부분에서 count 조회 하나 만들고 결과에 따라서 다르게 처리
		
		int result = new FoodCalendarDao().imginput(fdate,fcalimg,con);
		
		if(result>0) commit(con);
		else rollback(con);
		
		return result;
	}

	public String selectimg(String date) {
		Connection con = getConnection();
		
		String path = new FoodCalendarDao().selectimg(con,date);
		
		return path;
	}

	public int deleteImg(String date) {
		
		Connection con = getConnection();
		
		int result = new FoodCalendarDao().deleteImg(con,date);
		
		if(result>0) commit(con);
		else rollback(con);
		
		return result;
	}

}
