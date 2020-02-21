package semi.intranet.child.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import semi.intranet.child.model.vo.Child;
import semi.intranet.employee.model.dao.EmployeeDao;
import semi.intranet.employee.model.vo.Employee;

import static semi.common.JDBCTemplate.*;

public class ChildDao {
	
	private Properties prop = new Properties();
	String url=ChildDao.class.getResource("/config/intranetChild.properties").getPath();
	
	public ChildDao() {
		try {
			prop.load(new FileReader(url));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertChild(Child ch, Connection con) {
		int result  = 0;
		PreparedStatement pstmt = null;
		String sql  = prop.getProperty("insertChild");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ch.getName());
			pstmt.setString(2, ch.getGender());
			pstmt.setString(3, ch.getNo());
			pstmt.setString(4, ch.getBirth());
			pstmt.setString(5, ch.getEntdate());
			pstmt.setString(6, ch.getAddr());
			pstmt.setInt(7, ch.getAge());
			pstmt.setString(8, ch.getState());
			pstmt.setString(9, ch.getStuclass());
			pstmt.setString(10, ch.getStuimg());
			
			
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Child> stulistAll(Connection con) {
		ArrayList<Child> ae = new ArrayList<>();
		Child c = null;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("stulistAll");
		System.out.println(sql);
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				System.out.println(rset.getString(2));
				c = new Child();
				System.out.println(c);
				c.setcCode(rset.getInt("CHILD_CODE"));
				c.setName(rset.getString("CHILD_NAME"));
				c.setGender(rset.getString("CHILD_GENDER"));
				c.setBirth(rset.getString("CHILD_BIRTH"));
				c.setEntdate(rset.getString("CHILD_ENTRANCE"));
				c.setStuclass(rset.getString("CHILD_CLASS"));
				c.setState(rset.getString("CHILD_STATE"));
				c.setParentCode(rset.getInt("PARENT_CODE"));
				System.out.println(c);
				ae.add(c);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(con);
		}
				
		return ae;
	}

	public int updateChild(Connection con, int code, String state, String addr, String graduate) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("editStu");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setString(2, addr);
			pstmt.setString(3, graduate);
			pstmt.setInt(4, code);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteChild(Connection con, int delid) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("delStu");
		
		int result = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, delid);
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	

}






