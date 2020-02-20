package semi.home.educalendar.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import semi.home.board.model.vo.Board;

import static semi.common.JDBCTemplate.*;

public class EduCalendarDao {
	
	private Properties prop;
	
	public EduCalendarDao() {
		
		prop = new Properties();
		
		String filePath = Board.class.getResource("/config/educalendar-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int imgUpload(Connection con, String edate, String eduimg) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("imgUpload");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, edate);
			pstmt.setString(2, eduimg);
			result= pstmt.executeUpdate();
			
						
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkimg(Connection con, String edate) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkimg");
		
		try {
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, edate);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		}catch(SQLException  e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return result;
	}

	public int imgupdate(Connection con, String edate, String eduimg) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("imgupdate");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, eduimg);
			pstmt.setString(2, edate);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public String selectImg(Connection con, String edate) {

		String path  = "";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectImg");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, edate);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				path = rset.getString(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return path;
	}

}
