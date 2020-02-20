package semi.home.gboard.model.dao;

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

import semi.home.gboard.model.vo.Gboard;
public class GboardDao {

	private Properties prop = new Properties();
	
	public GboardDao() {
		String filePath = GboardDao.class.getResource("/config/Gboard-query.properties").getPath();
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Gboard> selectList(Connection con,int currentPage,int limit)  {
		ArrayList<Gboard> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		try {
			pstmt = con.prepareStatement(sql);
			int startRow = (currentPage-1)*limit +1;
			int endRow = startRow + limit -1;
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			list = new ArrayList<Gboard>();
			
			while(rset.next()) {
				Gboard g = new Gboard();
				
				g.setGno(rset.getInt("GNO"));
				g.setGtitle(rset.getString("gtitle"));
				g.setGcontent(rset.getString("gcontent"));
				g.setGwriter(rset.getString("gwriter"));
				g.setGcount(rset.getInt("gcount"));
				g.setGdate(rset.getDate("gdate"));
//				g.setGfile(rset.getString("gfile"));
				String[] sarr = (rset.getString("gfile").split(","));
				g.setGfile(sarr[0]);
				g.setStatus(rset.getString("status"));

				list.add(g);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();;
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public Gboard selectOne(Connection con, int gno) {
		Gboard g = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "SELECT * FROM GBOARD WHERE GNO=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				g = new Gboard();
				
				g.setGno(rset.getInt("gno"));
				g.setGtitle(rset.getString("gtitle"));
				g.setGcontent(rset.getString("gcontent"));
				g.setGwriter(rset.getString("gwriter"));
				g.setGcount(rset.getInt("gcount"));
				g.setGdate(rset.getDate("gdate"));
				g.setGfile(rset.getString("gfile"));
				g.setStatus(rset.getString("status"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return g;
	}

	public int updateReadCount(Connection con, int gno) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReadCount");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gno);
			
			result = pstmt.executeUpdate();
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertgboard(Connection con, Gboard g) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertgboard");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, g.getGtitle());
			pstmt.setString(2, g.getGcontent());
			pstmt.setString(3, g.getGwriter());
			pstmt.setString(4, g.getGfile());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Gboard upDateView(Connection con, int gno) {
		Gboard g = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("upDateView");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				g = new Gboard();
				
				g.setGno(gno);
				g.setGtitle(rset.getString("gtitle"));
				g.setGcontent(rset.getString("gcontent"));
				g.setGwriter(rset.getString("gwriter"));
				g.setGdate(rset.getDate("gdate"));
				g.setGfile(rset.getString("gfile"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return g;
	}

	public int updateGboard(Connection con, int gno, String gcontent, String gfile) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateGboard");
		
		try {
			
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, gcontent);
		pstmt.setString(2, gfile);
		pstmt.setInt(3, gno);
			
		result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int gboardDelete(Connection con,int gno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("gboardDelete");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, gno);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int getListCount(Connection con) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("ListCount");
		
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

}