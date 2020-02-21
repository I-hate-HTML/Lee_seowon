package semi.intranet.form.model.dao;

import static semi.common.JDBCTemplate.close;

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
import semi.intranet.form.model.vo.Form;
import semi.intranet.form.model.vo.SignList;

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
	 * 결재자 리스트 가져오기 --> 사용
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
				s.setPosition(rset.getString("JOB"));
				
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
	 * 품의서 작성용 --> 사용
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
			pstmt.setString(4, f.getfSignList());
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
	 * 품의서 게시판 목록 읽기 + 페이징 처리 --> 사용
	 * @param con
	 * @param empNum 
	 * @param limitContent 
	 * @param currentPage 
	 * @return
	 */
	public ArrayList<Form> listForm(Connection con, int empNum, int currentPage, int limitContent) {
		
		ArrayList<Form> list = new ArrayList<Form>();
		
		String emp = Integer.toString(empNum);
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listForm");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			int startContent = (currentPage -1) * limitContent +1;
			int endContent = startContent + limitContent -1;
			
			pstmt.setInt(1, empNum);
			pstmt.setString(2, '%'+emp+'%');
			pstmt.setInt(3, endContent);
			pstmt.setInt(4, startContent);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Form f = new Form();
				
				f.setFno(rset.getInt("DRAFT_NO"));
				f.setFcategory(rset.getInt("DRAFT_TYPE"));
				f.setFstate(rset.getString("DRAFT_PROCESS"));
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
	 * 총 페이지 가져오기 --> 사용
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
	 * 품의서 읽기 --> 수정
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
				f.setFwriter(rset.getString("WNAME"));
				f.setfWriterId(rset.getInt("DRAFT_EMP"));
				f.setFdate(rset.getDate("DRAFT_DATE"));
				f.setfSignList(rset.getString("SIGN_EMP"));
				f.setfSignckList(rset.getString("SIGN_YN"));
				f.setFreturnmsg(rset.getString("RETURN_REASON"));
				f.setFtitle(rset.getString("DRAFT_TITLE"));
				f.setFcontent(rset.getString("DRAFT_CONTENT"));
				f.setFfile(rset.getString("DRAFT_FILE"));
				f.setFstate(rset.getString("DRAFT_PROCESS"));
				
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
	 * 결재자 결재내용 저장 --> 사용
	 * @param con
	 * @param fno
	 * @param process 
	 * @param alim 
	 * @param yn
	 * @param reason 
	 * @return
	 */
	public int updateSign(Connection con, int fno, String newYn, String newMsg, String process, String alim) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateSign");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, newYn);
			pstmt.setString(2, newMsg);
			pstmt.setString(3, process);
			pstmt.setString(4, alim);
			pstmt.setInt(5, fno);
			
			result = pstmt.executeUpdate();			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	/**
	 * 품의서 삭제 --> 사용
	 * @param con
	 * @param fno
	 * @param eno
	 * @return
	 */
	public int deleteForm(Connection con, int fno, int eno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteForm");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			pstmt.setInt(2, eno);
			
			result = pstmt.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}



	/**
	 * READ용 결재자 리스트 가져오기 --> 사용
	 * @param con
	 * @param list
	 * @return
	 */
	public ArrayList<SignList> getSignSelect(Connection con, String list) {
		
		ArrayList<SignList> SignList = new ArrayList<SignList>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSignSelect");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, list);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				SignList s = new SignList();
				
				s.setPosition(rset.getString("JOB"));
				s.setScode(rset.getInt("EMP_CODE"));
				s.setSname(rset.getString("EMP_NAME"));
				
				
				SignList.add(s);
				
			
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return SignList;
	}



	/**
	 * 기존에 있던 결재 내용 가져오기용 -->사용
	 * @param con
	 * @param fno
	 * @return
	 */
	public SignList getSignContent(Connection con, int fno) {
		SignList list = new SignList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSignContent");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, fno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.setSyn(rset.getString("SIGN_YN"));
				list.setSmsg(rset.getString("RETURN_REASON"));
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
