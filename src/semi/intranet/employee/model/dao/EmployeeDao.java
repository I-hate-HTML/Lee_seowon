package semi.intranet.employee.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import semi.intranet.employee.model.exception.EmployeeException;
import semi.intranet.employee.model.vo.Employee;

public class EmployeeDao {
	private Properties prop = new Properties();
	String url = "/intranet/config/Employee.properties";
	
	public EmployeeDao() {
		try {
			prop.load(new FileReader(url));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertEmployee(Connection con, Employee em) {
		int result = 0;
		PreparedStatement pstmt  = null;
		String sql = prop.getProperty("insertEmployee");
		 
		try {
			pstmt = con.prepareStatement(sql);
			
			
			
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace(); 
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 인트라넷 employee 정보 수정
	 * @param con
	 * @param e
	 * @return
	 */
	public int updateMember(Connection con, Employee e) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = prop.getProperty("updateMember");
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, e.getUserPwd());
			pstmt.setString(2, e.getEmail());
			pstmt.setString(3, e.getPhone1());
			pstmt.setString(4, e.getPhone2());
			pstmt.setString(5, e.getAddress());
			
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException ex) {
			throw new EmployeeException(e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}

 
