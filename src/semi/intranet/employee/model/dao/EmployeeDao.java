package intranet.employee.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import intranet.employee.model.vo.Employee;

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

}

 
