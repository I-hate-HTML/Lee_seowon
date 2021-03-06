package semi.intranet.daily.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
	 * 교육일지 / 공지사항 총 게시글 수 확인
	 * @param con 
	 * @param category 
	 * @return
	 */
	public int getListCount(Connection con, int category) {
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("listCount");

		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, category);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT(*)");
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
	 * 교육일지 / 공지사항 게시판 목록 읽기 + 페이징처리
	 * @param con
	 * @param currentPage
	 * @param limitContent 
	 * @return
	 */
	public ArrayList<Daily> selectList(Connection con, int currentPage, int limitContent, int category) {
		
		ArrayList<Daily> list = new ArrayList<Daily>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPaging");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			int startContent = (currentPage -1) * limitContent +1;
			int endContetnt = startContent + limitContent -1;
			
			pstmt.setInt(1, category);
			pstmt.setInt(2, endContetnt);
			pstmt.setInt(3, startContent);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Daily d = new Daily();
				
				d.setRownum(rset.getInt("RNUM"));
				d.setBno(rset.getInt("DAILY_NO"));
				d.setBclass(rset.getInt("DAILY_CLASS"));
				d.setBcategory(rset.getInt("DAILY_CATEGORY"));
				d.setBtitle(rset.getString("DAILY_TITLE"));
				d.setBdate(rset.getDate("DAILY_DATE"));
				d.setBwriter(rset.getString("TNAME"));
				d.setBwriterCode(rset.getInt("DAILY_EMP"));
				d.setBfile(rset.getString("DAILY_FILE"));
				d.setBcontent(rset.getString("DAILY_CONTENT"));
				d.setBcount(rset.getInt("DAILY_COUNT"));
				d.setStatus(rset.getString("IS_DELETE"));
				d.setBclassName(rset.getString("CNAME"));
								
				list.add(d);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		
		return list;
	}


	/**
	 * 게시글 읽기
	 * @param con
	 * @param dno
	 * @param category
	 * @return
	 */
	public Daily selectOne(Connection con, int dno, int category) {

		Daily d = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dno);
			pstmt.setInt(2, category);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				d = new Daily();
				
				d.setBno(rset.getInt("DAILY_NO"));
				d.setBclass(rset.getInt("DAILY_CLASS"));
				d.setBcategory(rset.getInt("DAILY_CATEGORY"));
				d.setBtitle(rset.getString("DAILY_TITLE"));
				d.setBdate(rset.getDate("DAILY_DATE"));
				d.setBwriter(rset.getString("TNAME"));
				d.setBwriterCode(rset.getInt("DAILY_EMP"));
				d.setBfile(rset.getString("DAILY_FILE"));
				d.setBcontent(rset.getString("DAILY_CONTENT"));
				d.setBcount(rset.getInt("DAILY_COUNT"));
				d.setStatus(rset.getString("IS_DELETE"));	
				d.setBclassName(rset.getString("CNAME"));
				
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return d;
	}
	
	
	/**
	 * 게시글 카운트 올리기
	 * @param con
	 * @param dno
	 * @param category
	 * @return
	 */
	public int updateReadCount(Connection con, int dno, int category) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReadCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dno);
			pstmt.setInt(2, category);
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	/**
	 * 게시글 삭제 is_delete N --> Y
	 * @param con
	 * @param dno
	 * @param category
	 * @return
	 */
	public int dailyDelete(Connection con, int dno, int category) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteDaily");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dno);
			pstmt.setInt(2, category);
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		
		return result;
	}
	

	

	/**
	 * 수정할 게시글 가져오기 (수정 입력창에 띄울 것)
	 * @param con
	 * @param dno
	 * @param category
	 * @return
	 */
	public Daily dailyModifyView(Connection con, int dno, int category) {
		
		Daily d = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("dailyModifyView");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dno);
			pstmt.setInt(2, category);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				d = new Daily();
				
				d.setBno(rset.getInt("DAILY_NO"));
				d.setBclass(rset.getInt("DAILY_CLASS"));
				d.setBcategory(rset.getInt("DAILY_CATEGORY"));
				d.setBtitle(rset.getString("DAILY_TITLE"));
				d.setBdate(rset.getDate("DAILY_DATE"));
				d.setBwriter(rset.getString("DAILY_EMP_NAME"));
				d.setBwriterCode(rset.getInt("DAILY_EMP"));
				d.setBfile(rset.getString("DAILY_FILE"));
				d.setBcontent(rset.getString("DAILY_CONTENT"));
				d.setBcount(rset.getInt("DAILY_COUNT"));
				d.setStatus(rset.getString("IS_DELETE"));	

			}
			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return d;
	}

	/**
	 * 수정할 게시글 저장하기
	 * @param con
	 * @param dno
	 * @param b
	 * @return
	 */
	public int dailyModifySave(Connection con, int dno, Daily d) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("dailyModifySave");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, d.getBtitle());
			pstmt.setString(2, d.getBcontent());
			pstmt.setString(3, d.getBfile());
			pstmt.setInt(4, dno);
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 글쓰기용 선생님 담당반 찾기
	 * @param con
	 * @param writerCode
	 * @return
	 */
	public int dailyClass(Connection con, int writerCode) {
		
		int result = 0;
			
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getClass");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, writerCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				if(rset.getString("EMP_CLASS").equals("없음")) {
					 result = 0;
				}
				
				result = rset.getInt("EMP_CLASS");
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 선생님 이름 가져오기
	 * @param con
	 * @param writerCode
	 * @return
	 */
	public String dailyWriterName(Connection con, int writerCode) {
		
		String name = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getName");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, writerCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				name = rset.getString("EMP_NAME");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		} 
		
		return name;
	}

	
}
