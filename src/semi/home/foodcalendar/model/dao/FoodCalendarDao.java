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

	/**
	 * 이미지 등록
	 * @param fdate
	 * @param fcalimg
	 * @param con
	 * @return
	 */
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

	/**
	 * 이미지 선택
	 * @param con
	 * @param date
	 * @return
	 */
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

	/**
	 * 이미지 삭제
	 * @param con
	 * @param date
	 * @return
	 */
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

	/**
	 * 해당 달 데이터 값이 존재하는지 확인
	 * @param con
	 * @param fdate
	 * @return
	 */
	public int checkimg(Connection con, String fdate) {

		int result = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("countimg");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fdate);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result= rset.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);			
		}
		return result;
	}

	/**
	 * 이미지 수정용
	 * @param fdate
	 * @param fcalimg
	 * @param con
	 * @return
	 */
	public int imgupdate(String fdate, String fcalimg, Connection con) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("imgupdate");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fcalimg);
			pstmt.setString(2, fdate);
			
			result = pstmt.executeUpdate();
					
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
