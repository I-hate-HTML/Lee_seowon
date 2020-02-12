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
import static semi.common.JDBCTemplate.*;

public class EventDao {
	private Properties prop = new Properties();
	String url = "/config/intranetEvent-query.properties";
	
	public EventDao() {
		try {
			prop.load(new FileReader(url));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public int InsertEvent(Connection con, Calendar cc) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertEvent");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,cc.getTitle());
			pstmt.setString(2,cc.getContent());
			pstmt.setDate(3, cc.getStart());
			pstmt.setDate(4, cc.getEnd());
			pstmt.setString(5, cc.getType());
			pstmt.setString(6, cc.getUser());
			
			result = pstmt.executeUpdate(sql);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
