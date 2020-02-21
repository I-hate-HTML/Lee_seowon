package semi.home.qna.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import semi.home.alimjang.model.vo.AlimNote;
import semi.home.jsp.model.vo.Member;
import semi.home.qna.model.vo.QnA;
import static semi.common.JDBCTemplate.*;

public class QnaDao {
private Properties prop;
	
	public QnaDao() {
		prop = new Properties();
		
		String filePath = AlimNote.class.getResource("/config/qna-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}



	/**
	 * 문의 작성
	 * @param con
	 * @param qna
	 * @return
	 */
	public int insertQna(Connection con, QnA qna) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQna");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, qna.getQtitle());
			pstmt.setString(2, qna.getQcontent());
			pstmt.setString(3, qna.getQwriter());
			pstmt.setDate(4, qna.getAsk_date());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}



	public ArrayList<QnA> listQna(Connection con, Member m) {
		ArrayList<QnA> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset =null;
		String sql = prop.getProperty("listQna");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			rset = pstmt.executeQuery();
			
			list = new ArrayList<QnA>();
			
			while (rset.next()) {
				QnA q = new QnA();
				
				q.setQno(rset.getInt("qno"));
				q.setQtitle(rset.getString("qtitle"));
				q.setQcontent(rset.getString("qcontent"));
				q.setQwriter(rset.getString("qwriter"));
				q.setQdate(rset.getDate("qdate"));
				q.setAsk_date(rset.getDate("ask_date"));
				q.setChk_status(rset.getString("chk_status"));
				
				list.add(q);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}


	
	
	

}
