package semi.home.educalendar.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

import semi.home.educalendar.model.dao.EduCalendarDao;

public class EduCalendarService {

	public int imgUpload(String edate, String eduimg) {
		Connection con = getConnection();
		
		int check = new EduCalendarDao().checkimg(con,edate);
		
		int result = 0;
		
		if(check>0) {
			result = new EduCalendarDao().imgupdate(con,edate,eduimg);
		}else {
			result = new EduCalendarDao().imgUpload(con,edate,eduimg);
		}
		
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public String selectImg(String edate) {
		Connection con = getConnection();
		
		String path = new EduCalendarDao().selectImg(con,edate);
		
		close(con);
		
		return path;
	}

}
