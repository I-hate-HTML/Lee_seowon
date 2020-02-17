package semi.intranet.calendar.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

import semi.intranet.calendar.model.dao.EventDao;
import semi.intranet.calendar.model.vo.Calendar;

public class EventService {

	private Connection con;
	private EventDao edao = new EventDao();
	public int InsertEvent(String cJson) {
		int result = 0;
		con = getConnection();
		
		result = edao.InsertEvent(con,cJson);
		
		if(result>0) commit(con);
		else rollback(con); 
		
		close(con);
		
		
		return result;
	}

}
