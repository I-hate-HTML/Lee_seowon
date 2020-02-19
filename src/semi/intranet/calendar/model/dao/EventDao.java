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
	public int InsertEvent(Connection con, String alljson) {
		int result = 0;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		String clear = prop.getProperty("clearEvent");
		String sql = prop.getProperty("insertEvent");
		
		try {
			stmt = con.createStatement();
			result = stmt.executeUpdate(clear);
			
			if(result>=0) {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, alljson);
			
			result = pstmt.executeUpdate();
			}
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
		String all = "";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				all = rset.getString(1);
				result = (JSONArray)parser.parse(all);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ParseException e) {
			e.printStackTrace();
		}
		
		
		return result;
	}
	

}





















