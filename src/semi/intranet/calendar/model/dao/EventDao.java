package semi.intranet.calendar.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import semi.intranet.calendar.model.vo.Calendar;
import semi.intranet.daily.model.dao.DailyDao;

import static semi.common.JDBCTemplate.*;

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
	public int InsertEvent(Connection con, String cJson) {
		int result = 0;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		String clear = prop.getProperty("clearEvent");
		String sql = prop.getProperty("insertEvent");
		
		try {
			stmt = con.createStatement();
			result = stmt.executeUpdate(clear);
			
			if(result>0) {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, cJson);
			
			result = pstmt.executeUpdate();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
