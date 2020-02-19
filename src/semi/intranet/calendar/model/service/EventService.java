package semi.intranet.calendar.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import org.json.simple.JSONArray;

import semi.intranet.calendar.model.dao.EventDao;

public class EventService {

	private Connection con;
	private EventDao edao = new EventDao();
	public int InsertEvent(String alljson) {
		int result = 0;
		con = getConnection();
		
		result = edao.InsertEvent(con,alljson);
		
		if(result>0) commit(con);
		else rollback(con); 
		
		close(con);
		
		
		return result;
	}
	public JSONArray readEvent() {
		JSONArray result = new JSONArray();
		con = getConnection();
		
		result = edao.readEvent(con);
		
		return result;
	}

}
