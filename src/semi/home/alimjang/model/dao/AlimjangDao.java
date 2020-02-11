package semi.home.alimjang.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import semi.home.alimjang.model.vo.AlimHome;
import semi.home.alimjang.model.vo.AlimNote;
import semi.home.jsp.model.vo.Member;

import static semi.common.JDBCTemplate.*;

public class AlimjangDao {
	private Properties prop;
	
	public AlimjangDao() {
		prop = new Properties();
		
		String filePath = AlimNote.class.getResource("/config/alimjang-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

	public int insertAlimNote(Connection con, Member m, AlimNote an) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAlimNote");
		
		try {
			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, m.getCno());
			pstmt.setString(1, an.getAl_content());
			pstmt.setString(2, an.getAl_feel());
			pstmt.setString(3, an.getAl_health());
			pstmt.setString(4, an.getAl_temp());
			pstmt.setString(5, an.getAl_meal());
			pstmt.setString(6, an.getAl_sleep());
			pstmt.setString(7, an.getAl_poop());
//			pstmt.setString(8, m.getUserId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}

	public int insertAlimHome(Connection con, Member m, AlimHome ah) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAlimHome");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ah.getAlhm_wayhome());
			pstmt.setString(2, ah.getAlhm_time());
			pstmt.setString(3, ah.getAlhm_status());
			pstmt.setString(4, ah.getAlhm_phone());
			pstmt.setString(5, ah.getAlhm_status2());
			pstmt.setString(6, ah.getAlhm_phone2());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}

	

}
