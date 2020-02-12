package semi.intranet.alimjang.model.dao;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import semi.intranet.alimjang.model.vo.Alim;
import static semi.common.JDBCTemplate.close;

public class AlimDao {

	private Properties prop;
	
	
	/**
	 * 쿼리문 연결용
	 */
	public AlimDao() {
		
		prop = new Properties();
	
		String filePath = AlimDao.class.getResource("/config/intranetAlim-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 알림장 총 게시물 수 확인용
	 * @param con
	 * @return
	 */
	public int getListCount(Connection con) {
		
		int listCount = 0;
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				listCount = rset.getInt("SUM(TOTAL)");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
	
		return listCount;
	}




	/**
	 * 알림장 전체 리스트 가져오기
	 * @param con
	 * @param currentPage
	 * @param limitContent
	 * @return
	 */
	public ArrayList<Alim> selectListAll(Connection con, int currentPage, int limitContent) {
		
		ArrayList<Alim> list = new ArrayList<Alim>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListAll");
		
		try {
			
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Alim a = new Alim();
				
				a.setAno(rset.getInt("ANO"));
				a.setCategory(rset.getString("ACATEGORY"));
				a.setAcategory(rset.getInt("ACODE"));
				a.setCclass(rset.getInt("CCLASS"));
				a.setAchild(rset.getString("CNAME"));
				a.setCcode(rset.getInt("CCODE"));
				a.setAdate(rset.getDate("CDATE"));
				a.setAwriter(rset.getString("WRITER"));
				a.setAck(rset.getString("CK"));
				
				list.add(a);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
				
		
		return list;
	}


	/**
	 * 알림장 우리반 리스트 가져오기
	 * @param con
	 * @param empNo
	 * @param currentPage
	 * @param limitContent
	 * @return
	 */
	public ArrayList<Alim> selectListClass(Connection con, int empNo, int currentPage, int limitContent) {
		
		ArrayList<Alim> list = new ArrayList<Alim>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListClass");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			
			while(rset.next()) {
				Alim a = new Alim();
				
				a.setAno(rset.getInt("ANO"));
				a.setCategory(rset.getString("ACATEGORY"));
				a.setAcategory(rset.getInt("ACODE"));
				a.setCclass(rset.getInt("CCLASS"));
				a.setAchild(rset.getString("CNAME"));
				a.setCcode(rset.getInt("CCODE"));
				a.setAdate(rset.getDate("CDATE"));
				a.setAwriter(rset.getString("WRITER"));
				a.setAck(rset.getString("CK"));
				
				list.add(a);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
		
		return list;
	}
	

}
