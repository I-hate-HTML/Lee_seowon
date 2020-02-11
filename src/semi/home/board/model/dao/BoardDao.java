package semi.home.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;

import semi.home.board.model.vo.Board;

public class BoardDao {
	private Properties prop;
			
	public BoardDao() {
		
		prop = new Properties();
		
		String filePath = Board.class.getResource("/config/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Board> selectList(Connection con) {

		ArrayList<Board> list = null;
		Statement stmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("SelectList");
		
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBno(rset.getInt(1));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBwriter(rset.getString("bwriter"));
				b.setBcount(rset.getInt("bcount"));
				b.setBdate(rset.getDate("bdate"));
				
				list.add(b);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}		
		return list;
	}

	public Board selectOne(Connection con, int bno) {
		Board b = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectOne");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBwriter(rset.getString("bwriter"));
				b.setBdate(rset.getDate("bdate"));
				b.setBno(rset.getInt("bno"));
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	public int updateCount(Connection con, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);		
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int BoardWrite(Connection con, Board b) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("boardwrite");
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, b.getBtitle());
			pstmt.setString(2, b.getBcontent());
			pstmt.setString(3, b.getBwriter());
			pstmt.setString(4, b.getBfile());
			
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


}
