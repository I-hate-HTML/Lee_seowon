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
	public int InsertEvent(Connection con, String addjson) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertEvent");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, addjson);
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
				aa = (JSONObject) parser.parse(rset.getString("E_DATA"));
				aa.put("_id", rset.getInt(1));
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
	public int updateEvent(Connection con, String event, String newstart, String newend) {
		int result = 0;
		PreparedStatement pstmt = null;
		Statement stmt = null;
		String sql = prop.getProperty("readEvent");
		String clear = prop.getProperty("clearEvent");
		String insert = prop.getProperty("insertEvent");
		ResultSet rset = null;

		JSONParser parser = new JSONParser();
		JSONArray jall = new JSONArray();
		JSONObject cll = new JSONObject();
		String all = "";

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);

			if(rset.next()) {
				all = rset.getString(1);
				jall = (JSONArray) parser.parse(all);
				for(int i=0;i<jall.size();i++) {
					cll = (JSONObject) jall.get(i);
					if(cll.get("title").equals(event)) {
						cll.put("start", newstart);
						cll.put("end", newend);
						break;
					}
				}
				System.out.println(jall.toString());
				result = stmt.executeUpdate(clear);
				if(result>=0) {
					pstmt = con.prepareStatement(insert);
					pstmt.setString(1, jall.toString());
				}
			}
			
			
			

		}catch(SQLException e) {
			e.printStackTrace();
		}catch(ParseException e) {
			e.printStackTrace();
		}


		return result;
	}


}





















