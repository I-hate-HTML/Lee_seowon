package semi.home.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static semi.common.JDBCTemplate.*;

import semi.home.board.model.vo.Board;
import semi.home.jsp.model.dao.HomeMemberDao;

public class BoardDao {
	private Properties prop;
			
	public BoardDao() {
		
		prop = new Properties();
		
		String filePath = HomeMemberDao.class.getResource("board-query.properties").getPath();
		
	}

	public ArrayList<Board> selectList(Connection con) {

		ArrayList<Board> list = new ArrayList<Board>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		Board b = null;
		
		String sql = prop.getProperty("");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				b = new Board();
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

}
