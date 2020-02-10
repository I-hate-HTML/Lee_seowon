package semi.home.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
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
}
