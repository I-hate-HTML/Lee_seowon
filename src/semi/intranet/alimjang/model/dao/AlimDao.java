package semi.intranet.alimjang.model.dao;


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

import semi.home.alimjang.model.vo.AlimHome;
import semi.home.alimjang.model.vo.AlimMedi;
import semi.home.alimjang.model.vo.AlimNote;
import semi.intranet.alimjang.model.vo.Alim;

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
	 * 알림장 반 총 게시물 수 확인용
	 * @param con
	 * @param empNo
	 * @return
	 */
	public int getClassListCount(Connection con, int empNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("classListCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empNo);
			pstmt.setInt(2, empNo);
			pstmt.setInt(3, empNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				listCount = rset.getInt("SUM(TOTAL)");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
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
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListAll");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			int startContent = (currentPage -1) * limitContent + 1;
			int endContent = startContent + limitContent -1;
			
			pstmt.setInt(1, endContent);
			pstmt.setInt(2, startContent);
			
			rset = pstmt.executeQuery();
			
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
				a.setArownum(rset.getInt("RNUM"));
				
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

			int startContent = (currentPage -1) * limitContent + 1;
			int endContent = startContent + limitContent -1;
			
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setInt(1, endContent);
			pstmt.setInt(2, empNo);
			pstmt.setInt(3, startContent);
			
			rset = pstmt.executeQuery();
			
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
				a.setArownum(rset.getInt("RNUM"));
				
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


	/**
	 * 알림 노트 게시글 읽기
	 * @param con 
	 * @param empNo
	 * @param ano
	 * @return
	 */
	public AlimNote readAlimNote(Connection con, int empNo, int ano) {
		
		AlimNote a = new AlimNote();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("readAlimNote");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				a.setAl_code(rset.getInt("AL_CODE"));
				a.setAl_content(rset.getString("AL_CONTENT"));
				a.setAl_date(rset.getDate("AL_DATE"));
				a.setAl_feel(rset.getString("AL_FEEL"));
				a.setAl_health(rset.getString("AL_HEATH"));
				a.setAl_meal(rset.getString("AL_MEAL"));
				a.setAl_no(rset.getInt("AL_NO"));
				a.setAl_poop(rset.getString("AL_POOP"));
				a.setAl_sleep(rset.getString("AL_SLEEP"));
				a.setAl_temp(rset.getString("AL_TEMP"));
				a.setAl_writer(rset.getString("AL_WRITER"));
				a.setCno(rset.getInt("CNO"));
				
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return a;
	}
	
	/**
	 * 알림장 귀가 의뢰서 읽기
	 * @param con
	 * @param empNo
	 * @param ano
	 * @return
	 */
	public AlimHome readAlimHome(Connection con, int empNo, int ano) {
		
		AlimHome a = new AlimHome();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("readAlimHome");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				a.setAlhm_no(rset.getInt("ALHM_NO"));
				a.setAl_code(rset.getInt("AL_CODE"));
				a.setCno(rset.getInt("CNO"));
				a.setAlhm_wayhome(rset.getString("ALHM_WAYHOME"));
				a.setAlhm_time(rset.getString("ALHM_TIME"));
				a.setAlhm_status(rset.getString("ALHM_STAUTS"));
				a.setAlhm_phone(rset.getString("ALHM_PHONE"));
				a.setAlhm_status2(rset.getString("ALHM_STATUS2"));
				a.setAlhm_phone2(rset.getString("ALHM_PHONE2"));
				a.setAlhm_writer(rset.getString("ALHM_WRITER"));
				a.setAlhm_date(rset.getDate("ALHM_DATE"));
			}
			
			
			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return a;
	}
	
	/**
	 * 알림장 투약의뢰서 읽기
	 * @param con
	 * @param empNo
	 * @param ano
	 * @return
	 */
	public AlimMedi readAlimMedi(Connection con, int empNo, int ano) {
		
		AlimMedi a = new AlimMedi();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("readAlimMedi");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ano);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				a.setAlmd_no(rset.getInt("ALMD_NO"));
				a.setAl_code(rset.getInt("AL_CODE"));
				a.setCno(rset.getInt("CNO"));
				a.setAlmd_con(rset.getString("ALMD_CON"));
				a.setAlmd_type(rset.getString("ALMD_TYPE"));
				a.setAlmd_vol(rset.getString("ALMD_VOL"));
				a.setAlmd_num(rset.getString("ALMD_NUM"));
				a.setAlmd_time(rset.getString("ALMD_TIME"));
				a.setAlmd_temp(rset.getString("ALMD_TEMP"));
				a.setAlmd_ps(rset.getString("ALMD_PS"));
				a.setAlmd_writer(rset.getString("ALMD_WRITER"));
				a.setAlmd_date(rset.getDate("ALMD_DATE"));
				
				
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return a;
	}


	/**
	 * 알림 게시판 읽기 common
	 * @param con
	 * @param empNo
	 * @param ano
	 * @param category 
	 * @return
	 */
	public Alim readAlimCommon(Connection con, int empNo, int ano, int category) {
		
		Alim b = new Alim();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = "";
		
		if(category == 1) {
			sql = prop.getProperty("readAlimNoteCommon");
		} else if (category == 2) {
			sql = prop.getProperty("readAlimHomeCommon");
		} else if (category == 3) {
			sql = prop.getProperty("readAlimMediCommon");
		}
		
		
		try {
			
			pstmt = con.prepareStatement(sql);
			  
			  pstmt.setInt(1, ano);
			 
			
			 
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				b.setAno(rset.getInt("ANO")); // 글번호
				b.setCategory(rset.getString("ACATEGORY"));
				b.setCclass(rset.getInt("CCLASS"));
				b.setCcode(rset.getInt("CCODE"));
				b.setAchild(rset.getString("CNAME"));
				b.setAwriter(rset.getString("WRITER"));
				b.setAdate(rset.getDate("CDATE"));
				b.setAck(rset.getString("CK"));
				
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}


	/**
	 * 알림장들 읽기 확인 취소 버튼
	 * @param con
	 * @param empNo
	 * @param read
	 * @param ano
	 * @param category
	 * @return
	 */
	public int readAlimCheck(Connection con, int empNo, String read, int ano, int category) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		if(category == 1) {
			sql = prop.getProperty("readAlimNoteCheck");
		} else if (category == 2) {
			sql = prop.getProperty("readAlimHomeCheck");
		} else if (category == 3) {
			sql = prop.getProperty("readAlimMediCheck");
		}
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, read);
			pstmt.setInt(2, ano);
			
			result = pstmt.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}



}
