package semi.home.foodcalendar.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import semi.home.board.model.vo.Board;
import semi.home.foodcalendar.model.vo.FoodCalendar;
import static semi.common.JDBCTemplate.*;

public class FoodCalendarDao {
	
	private Properties prop;
	
	public FoodCalendarDao() {
		
		prop = new Properties();
		
		String filePath = Board.class.getResource("/config/calendar-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int imginput(String fdate, String fcalimg, Connection con) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("imginput");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fdate);
			pstmt.setString(2, fcalimg);
			
			result= pstmt.executeUpdate();
			
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public String selectimg(Connection con, String date) {

		String path = "";
		PreparedStatement pstmt = null;
		ResultSet rset  = null;
		String sql = prop.getProperty("selectimg");
				
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				path=rset.getString(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			
		}
		
		
		return path;
	}

	public int deleteImg(Connection con, String date) {

		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteimg");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, date);
			
			result =pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return result;
	}
}
