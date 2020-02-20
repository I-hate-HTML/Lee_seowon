package semi.intranet.calendar.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import semi.intranet.calendar.model.dao.EventDao;

public class EventService {

	private Connection con;
	private EventDao edao = new EventDao();
	public int InsertEvent(String jsonstr, String eventcode) {
		int result = 0;
		con = getConnection();
		
		result = edao.InsertEvent(con,jsonstr,eventcode);
		
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
	public int updateEvent(String event, String jsonstr) {
		int result = 0;
		con = getConnection();
		
		result = edao.updateEvent(con,event,jsonstr);
		
		if(result>0) commit(con); 
		else rollback(con);
		close(con);
		
		
		return result;
	}
	public JSONObject selectOne(String event) {
		JSONObject obj = null;
		con = getConnection();
		
		obj = edao.selectOne(con, event);
		
		return obj;
	}
	public void deleteEvent(String before) {
		con = getConnection();
		int result = 0;
		
		result = edao.deleteEvent(con,before);
		
		if(result>0) { commit(con); System.out.println("성공");}
		else { rollback(con);}
		
	}
	public int editEvent(String before, String event, String after) {
		con = getConnection();
		int result = 0;
		
		result = edao.editEvent(con,before,event,after);
		
		if(result>0) { commit(con); System.out.println("성공");}
		else { rollback(con);}
		
		return result;
	}

}
