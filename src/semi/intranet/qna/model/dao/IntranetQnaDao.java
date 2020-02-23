package semi.intranet.qna.model.dao;

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

import semi.home.qna.model.vo.QnA;
import semi.intranet.qna.model.vo.IntranetQna;

public class IntranetQnaDao {

	private Properties prop;
	
	public IntranetQnaDao() {
		prop = new Properties();
		
		String filePath = QnA.class.getResource("/config/intranetQna-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}		
	}
	
	
	
	/**
	 * 인트라넷 문의사항 총 게시물 수 확인용
	 * @param con
	 * @param empNo 
	 * @return
	 */
	public int getListCount(Connection con, int empNo) {
		
		int listCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getListCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
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
	 * 인트라넷 문의 확인 첫화면에서 리스트 불러오기
	 * @param con
	 * @param empNo 
	 * @return
	 */
	public ArrayList<IntranetQna> selectList(Connection con, int empNo) {
		
		ArrayList<IntranetQna> list = new ArrayList<IntranetQna>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;//statement라서 여기에 넣어줌
		
		String sql = prop.getProperty("selectList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empNo);
			
			rset = pstmt.executeQuery();
						
			
			while(rset.next()) {
				
				IntranetQna q = new IntranetQna();
				
				q.setQno(rset.getInt("QNO"));
				q.setQtitle(rset.getString("QTITLE"));
				q.setQwriter(rset.getString("QWRITER"));
				q.setQdate(rset.getDate("QDATE"));
				q.setChk_status(rset.getString("CHK_STATUS"));
				q.setQcclass(rset.getInt("CLASSNUM"));
				q.setqClassName(rset.getString("CLASSNAME"));
				q.setQcname(rset.getString("CNAME"));
				q.setQcnum(rset.getInt("CNO"));
				q.setQusername(rset.getString("NAME"));
				q.setQusernum(rset.getInt("MNO"));
				
				list.add(q);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/**
	 * 인트라넷 문의 확인 상세 보기
	 * @param con
	 * @param qno
	 * @return
	 */
	public IntranetQna selectOne(Connection con, int qno) {
		
		IntranetQna q = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new IntranetQna();
				
				q.setQno(rset.getInt("QNO"));
				q.setQtitle(rset.getString("QTITLE"));
				q.setQcontent(rset.getString("QCONTENT"));
				q.setQwriter(rset.getString("QWRITER"));
				q.setQdate(rset.getDate("QDATE"));
				q.setChk_status(rset.getString("CHK_STATUS"));
				q.setQcclass(rset.getInt("CLASSNUM"));
				q.setqClassName(rset.getString("CLASSNAME"));
				q.setQcname(rset.getString("CNAME"));
				q.setQcnum(rset.getInt("CNO"));
				q.setQusername(rset.getString("NAME"));
				q.setQusernum(rset.getInt("MNO"));
				q.setAsk_date(rset.getDate("ASK_DATE"));
				
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
	}

	/**
	 * 인트라넷 문의 확인하면 체크 O로 바꾸기
	 * @param con
	 * @param qno
	 * @return
	 */
	public int updateReadCheck(Connection con, int qno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReadCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno); //setInt (1,qno)?
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 인트라넷 문의확인에서 문의 삭제
	 * @param con
	 * @param qno
	 * @return
	 */
	public int deleteQnaList(Connection con, int qno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQnaList");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}



	/**
	 * Qna 읽기 확인 취소 버튼
	 * @param con
	 * @param empNo
	 * @param read
	 * @param qno
	 * @return
	 */
	public int readQnaCheck(Connection con, int empNo, String read, int qno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("readCheck");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, read);
			pstmt.setInt(2, qno);
			
			result = pstmt.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	

}
