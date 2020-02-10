package semi.intranet.form.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
	 * 품의서 게시판 목록 읽기 + 페이징 처리
	 * @param con
	 * @param empNum 
	 * @param limitContent 
	 * @param currentPage 
	 * @return
	 */
	public ArrayList<Form> listForm(Connection con, int empNum, int currentPage, int limitContent) {
		
		ArrayList<Form> list = new ArrayList<Form>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listForm");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			int startContent = (currentPage -1) * limitContent +1;
			int endContent = startContent + limitContent -1;
			
			pstmt.setInt(1, empNum);
			pstmt.setInt(2, empNum);
			pstmt.setInt(3, endContent);
			pstmt.setInt(4, startContent);
			
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



	/**
	 * 총 페이지 가져오기
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
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
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
	 * 품의서 읽기
	 * @param con
	 * @param fno
	 * @return
	 */
	public Form readForm(Connection con, int fno) {

		Form f = new Form();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("readForm");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				f.setFno(fno);
				f.setFcategory(rset.getInt("DRAFT_TYPE"));
				f.setFcontent(rset.getString("DRAFT_CONTENT"));
				f.setFdate(rset.getDate("DRAFT_DATE"));
				f.setFfile(rset.getString("DRAFT_FILE"));
				/* f.setFreturnmsg(rset.getString("RETURN_REASON")); */
				f.setFsign(rset.getString("SNAME"));
				f.setFstatus(rset.getString("DRAFT_PROCESS"));
				f.setFtitle(rset.getString("DRAFT_TITLE"));
				f.setFwriter(rset.getString("WNAME"));
				f.setfWriterId(rset.getInt("DRAFT_EMP"));
				f.setFsignId(rset.getInt("SIGN_EMP"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
				
	
		return f;
	}



	/**
	 * 품의서 수정할 내용 불러오기
	 * @param con
	 * @param fno
	 * @return
	 */
	public Form modifyViewForm(Connection con, int fno) {
		
		Form f = new Form();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("modifyViewForm");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
