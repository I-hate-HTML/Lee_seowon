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
			pstmt.setInt(4, f.getFsignId1());
			pstmt.setString(5, f.getFtitle());
			pstmt.setString(6, f.getFcontent());
			pstmt.setString(7, f.getFfile());
			pstmt.setInt(8, f.getFsignId2());
			pstmt.setInt(9, f.getFsignId3());
			
			result = pstmt.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	/**
	 * id에 맞는 결재자 정보 불러오기
	 * @param signId1
	 * @param signId2
	 * @param signId3
	 * @return
	 */
	public ArrayList<SignList> findSignId(Connection con, int signId1, int signId2, int signId3) {

		ArrayList<SignList> s = new ArrayList<SignList>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findSignId");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, signId1);
			pstmt.setInt(2, signId2);
			pstmt.setInt(3, signId3);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				SignList sign = new SignList();
				
				sign.setScode(rset.getInt("EMP_CODE"));
				sign.setSposition(rset.getInt("EMP_JOB"));
				sign.setSname(rset.getString("EMP_NAME"));
				
				s.add(sign);
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return s;
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
			pstmt.setInt(3, empNum);
			pstmt.setInt(4, empNum);
			pstmt.setInt(5, endContent);
			pstmt.setInt(6, startContent);
			
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

	
	public ArrayList<Form> listAjax (Connection con, int empNo) {
		
		ArrayList<Form> list = new ArrayList<Form>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listAjax");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, empNo);
			pstmt.setInt(2, empNo);
			pstmt.setInt(3, empNo);
			pstmt.setInt(4, empNo);
			
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
				f.setFwriter(rset.getString("WNAME"));
				f.setfWriterId(rset.getInt("DRAFT_EMP"));
				f.setFdate(rset.getDate("DRAFT_DATE"));
				f.setFsign1(rset.getString("SNAME1"));
				f.setFsignId1(rset.getInt("SIGN_EMP1"));
				f.setFsignck1(rset.getString("SIGN_YN1"));
				f.setFsign2(rset.getString("SNAME2"));
				f.setFsignId2(rset.getInt("SIGN_EMP2"));
				f.setFsignck2(rset.getString("SIGN_YN2"));
				f.setFsign3(rset.getString("SNAME3"));
				f.setFsignId3(rset.getInt("SIGN_EMP3"));
				f.setFsignck3(rset.getString("SIGN_YN3"));
				f.setFreturnmsg(rset.getString("RETURN_REASON"));
				f.setFtitle(rset.getString("DRAFT_TITLE"));
				f.setFcontent(rset.getString("DRAFT_CONTENT"));
				f.setFfile(rset.getString("DRAFT_FILE"));
				f.setFstatus(rset.getString("DRAFT_PROCESS"));
				
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
	 * @param eno 
	 * @return
	 */
	public Form modifyViewForm(Connection con, int fno, int eno) {
		
		Form f = new Form();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("modifyViewForm");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, fno);
			pstmt.setInt(2, eno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				f.setFno(rset.getInt("DRAFT_NO"));
				f.setFcategory(rset.getInt("DRAFT_TYPE"));
				f.setfWriterId(rset.getInt("DRAFT_EMP"));
				f.setFwriter(rset.getString("WNAME"));
				f.setFdate(rset.getDate("DRAFT_DATE"));
				f.setFsignId1(rset.getInt("SIGN_EMP1"));
				f.setFsign1(rset.getString("SNAME1"));
				f.setFsignId2(rset.getInt("SIGN_EMP2"));
				f.setFsign2(rset.getString("SNAME2"));
				f.setFsignId3(rset.getInt("SIGN_EMP3"));
				f.setFsign3(rset.getString("SNAME3"));
				f.setFtitle(rset.getString("DRAFT_TITLE"));
				f.setFcontent(rset.getString("DRAFT_CONTENT"));
				f.setFfile(rset.getString("DRAFT_FILE"));
				
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return f;
	}



	/**
	 * 결재자 결재내용 저장
	 * @param con
	 * @param fno
	 * @param sign1
	 * @param sign2
	 * @param sign3
	 * @param fReturn
	 * @return
	 */
	public int updateSign(Connection con, int fno, String sign1, String sign2, String sign3, String fReturn) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateSign");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, sign1);
			pstmt.setString(2, sign2);
			pstmt.setString(3, sign3);
			pstmt.setString(4, fReturn);
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
	 * 결재자 결재 내용에 따른 결재 프로세스 변경 (반려 / 승인 / 검토)
	 * @param con
	 * @param fno
	 * @param size 
	 * @return
	 */
	public int updateSignProcess(Connection con, int fno, int size) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		System.out.println(size);
		
		switch(size) {
		case 1 : sql = prop.getProperty("updateSign1"); break;
		case 2 : sql = prop.getProperty("updateSign2"); break;
		case 3 : sql = prop.getProperty("updateSign3"); break;
		case 9 : sql = prop.getProperty("updateSignReturn"); break;
		}
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
				pstmt.setInt(1, fno);
			
			result = pstmt.executeUpdate();			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}


	/**
	 * 품의서 삭제
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



	






	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
