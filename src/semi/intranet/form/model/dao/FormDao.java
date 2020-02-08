package semi.intranet.form.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.intranet.daily.model.dao.DailyDao;
import semi.intranet.employee.model.vo.Employee;
import semi.intranet.form.model.vo.Form;
import semi.intranet.form.model.vo.SignList;

import static semi.common.JDBCTemplate.*;

public class FormDao {
	
	private Properties prop;
	
	/**
	 * 쿼리문 연결용
	 */
	public FormDao() {
		
		prop = new Properties();
		
		String filePath = DailyDao.class.getResource("/config/intranetForm-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	

	/**
	 * 결재자 리스트 가져오기
	 * @param con
	 * @param empNo
	 * @return
	 */
	public ArrayList<SignList> getSignList(Connection con, int empNo) {
		
		ArrayList<SignList> list = new ArrayList<SignList>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSignList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				SignList s = new SignList();
				
				s.setSname(rset.getString("EMP_NAME"));
				s.setScode(rset.getInt("EMP_CODE"));
				s.setSposition(rset.getInt("EMP_JOB"));
				s.setSclass(rset.getInt("EMP_CLASS"));
				
				list.add(s);			
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}



	/**
	 * 품의서 작성용
	 * @param con
	 * @param f
	 * @return
	 */
	public int insertForm(Connection con, Form f) {

		int result = 0;

		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertForm");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, f.getFcategory());
			pstmt.setInt(2, f.getfWriterId());
			pstmt.setDate(3, f.getFdate());
			pstmt.setInt(4, f.getFsignId());
			pstmt.setString(5, f.getFtitle());
			pstmt.setString(6, f.getFcontent());
			pstmt.setString(7, f.getFfile());
			
			result = pstmt.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	/**
	 * 품의서 게시판
	 * @param con
	 * @param empNum 
	 * @return
	 */
	public ArrayList<Form> listForm(Connection con, int empNum) {
		
		ArrayList<Form> list = new ArrayList<Form>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listForm");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empNum);
			pstmt.setInt(2, empNum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Form f = new Form();
				
				f.setFno(rset.getInt("DRAFT_NO"));
				f.setFcategory(rset.getInt("DRAFT_TYPE"));
				f.setFstatus(rset.getString("DRAFT_PROCESS"));
				f.setFtitle(rset.getString("DRAFT_TITLE"));
				f.setFwriter(rset.getString("TNAME"));
				f.setfWriterId(rset.getInt("DRAFT_EMP"));
				f.setFdate(rset.getDate("DRAFT_DATE"));
				
				list.add(f);
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
