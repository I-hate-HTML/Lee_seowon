package semi.intranet.daily.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import semi.intranet.daily.model.vo.Daily;

public class DailyDao {
	
	private Properties prop;
	
	
	/**
	 * 쿼리문 연결용
	 */
	public DailyDao() {
		
		prop = new Properties();
		
		String filePath = DailyDao.class.getResource("/config/intranetDaily-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 교육일지 / 공지사항 올리기용
	 * @param con
	 * @param b
	 * @param bcategory 
	 * @return
	 */
	public int dailyInsert(Connection con, Daily b) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertDaily");
		
		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, b.getBclass());
			pstmt.setString(2, b.getBtitle());
			pstmt.setString(3, b.getBwriter());
			pstmt.setInt(4, b.getBcategory());
			pstmt.setString(5, b.getBfile());
			pstmt.setInt(6, b.getBwriterCode());
			pstmt.setString(7, b.getBcontent());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	/**
	 * 교육일지 총 게시글 확인
	 * @param con 
	 * @return
	 */
	public int getListCount(Connection con) {
		int dailyListCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("dailyListCount");
			
		try {
			
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				dailyListCount = rset.getInt("COUNT(*)");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return dailyListCount;
	}

}
