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
	 * 인트라넷 문의 확인 첫화면에서 리스트 불러오기
	 * @param con
	 * @return
	 */
	public ArrayList<QnA> selectList(Connection con) {
		ArrayList<QnA> list = null;//반환시켜줄 변수 선언하자
		Statement stmt = null;
		ResultSet rset = null;//statement라서 여기에 넣어줌
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<QnA>();
			
			while(rset.next()) {
				QnA q = new QnA();
				//다른 테이블에 있는 거 써도 되나
				q.setQno(rset.getInt(1));
				q.setQcclass(rset.getInt("CCLASS"));//(2)이렇게 해야 하나
				q.setQcname(rset.getString("CNAME"));
				q.setQtitle(rset.getString("QTITLE"));
				q.setQwriter(rset.getString("QWRITER"));
				q.setQusername(rset.getString("USERNAME"));
				q.setQdate(rset.getDate("QDATE"));
				q.setChk_status(rset.getString("CHK_STATUS"));
				
				list.add(q);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	/**
	 * 인트라넷 문의 확인 상세 보기
	 * @param con
	 * @param qno
	 * @return
	 */
	public QnA selectOne(Connection con, int qno) {
		
		QnA q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, qno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QnA();
				
				q.setQno(rset.getInt(1));
				q.setQtitle(rset.getString("QTITLE"));
				q.setQdate(rset.getDate("QDATE"));
				q.setQcclass(rset.getInt("CCLASS"));//(2)이렇게 해야 하나
				q.setQcname(rset.getString("CNAME"));
				q.setQwriter(rset.getString("QWRITER"));
				q.setQcname(rset.getString("QCONTENT"));
				
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

}
