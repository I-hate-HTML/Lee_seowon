package semi.intranet.calendar.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import semi.intranet.daily.model.dao.DailyDao;

public class EventDao {
	private Properties prop = new Properties();
	String filePath = DailyDao.class.getResource("/config/intranetEvent-query.properties").getPath();

	public EventDao() {
		try {
			prop.load(new FileReader(filePath));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int InsertEvent(Connection con, String addjson, String eventcode) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertEvent");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, eventcode);
			pstmt.setString(2, addjson);
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}


		return result;
	}
	public JSONArray readEvent(Connection con) {
		JSONArray result = new JSONArray();

		Statement stmt = null;
		String sql = prop.getProperty("readEvent");
		ResultSet rset = null;

		JSONParser parser = new JSONParser();

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);

			while(rset.next()) {
				JSONObject aa = new JSONObject();
				aa = (JSONObject) parser.parse(rset.getString("E_CONTENT"));
				result.add(aa);
			}

		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ParseException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}


		return result;
	}
	public int updateEvent(Connection con, String event, String jsonstr) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateEvent");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, jsonstr);
			pstmt.setString(2, event);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}


		return result;
	}
	public JSONObject selectOne(Connection con,String eventid) {
		ResultSet rset = null;
		JSONObject obj = new JSONObject();
		JSONParser parser = new JSONParser();
		
		PreparedStatement pstmt = null;
		String call = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(call);
			pstmt.setString(1, eventid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				obj = (JSONObject)parser.parse(rset.getString(1));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}catch(ParseException e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return obj;
	}
	public int deleteEvent(Connection con, String before) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteOne");
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, before);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int editEvent(Connection con, String before, String event, String after) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("editEvent");
		int result = 0;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, after);
			pstmt.setString(2, event);
			pstmt.setString(3, before);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}


}





















