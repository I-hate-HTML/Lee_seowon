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

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

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

	/*public ArrayList<Board> selectList(Connection con) {

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
	}*/

	/**
	 * 게시글 선택
	 * @param con
	 * @param bno
	 * @return
	 */
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
				b.setBfile(rset.getString("bfile"));
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	/**
	 * 게시글 조회수 증가용
	 * @param con
	 * @param bno
	 * @return
	 */
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

	/**
	 * 게시글 수정용
	 * @param con
	 * @param pbno
	 * @return
	 */
	public Board updateView(Connection con, int pbno) {
		
		Board b = new Board();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("updateview");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pbno);
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				b.setBno(rset.getInt("bno"));
				b.setBtitle(rset.getString("btitle"));
				b.setBcontent(rset.getString("bcontent"));
				b.setBfile(rset.getString("bfile"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}

	/**
	 * 게시글 수정용
	 * @param con
	 * @param pbno
	 * @param bcontent
	 * @return
	 */
	public int updateBoard(Connection con, int pbno, String bcontent, String bfile) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bcontent);
			pstmt.setString(2, bfile);
			pstmt.setInt(3, pbno);
			
			result= pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 게시판 넘버링
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
				listCount = rset.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}

	/**
	 * 게시판 넘버링
	 * @param con
	 * @param currentPage
	 * @param limit
	 * @param listCount
	 * @return
	 */
	public ArrayList<Board> selectList(Connection con, int currentPage, int limit, int listCount) {
		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectList");
		try {
			int startRow = (currentPage-1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset = pstmt.executeQuery();
			list= new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBno(listCount - rset.getInt("RNUM")+1);
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
			close(pstmt);
		}
		
		
		return list;
	}

	public int getSearchCount(Connection con, String searchval, String keyword) {

		int listCount = 0;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = "";
		
		
		switch(searchval) {
		
		case("title"): sql=prop.getProperty("searchcounttitle"); break;
		
		case("content"): sql=prop.getProperty("searchcountcontent"); break;
		
		case("writer"): sql=prop.getProperty("searchcountname"); break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return listCount;
	}

	public ArrayList<Board> searchBoard(Connection con, String searchval, String keyword,int currentPage,int limit) {
		
		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "";
		switch(searchval) {
		case("title") : sql=prop.getProperty("searchtitle"); break;
		case("content") : sql= prop.getProperty("searchcontent"); break;
		case("writer") : sql= prop.getProperty("searchname"); break;
		}
		
		try {
			int startRow = (currentPage-1)*limit +1;
			int endRow = startRow + limit -1;
			
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);

			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				Board b = new Board();

				b.setBno(rset.getInt("bno"));
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
			close(pstmt);
		}
		
		return list;
	}

	public int deleteBoard(Connection con, int pbno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pbno);
			
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}


}
