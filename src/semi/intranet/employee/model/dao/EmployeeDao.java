package semi.intranet.employee.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.Properties;

import semi.intranet.employee.model.exception.EmployeeException;
import semi.intranet.employee.model.vo.Employee;

public class EmployeeDao {
	private Properties prop = new Properties();
	String url=EmployeeDao.class.getResource("/config/intranetEmployee.properties").getPath();
	
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
			pstmt.setString(1, em.getEmpName());
			pstmt.setString(2, em.getEmpJob());
			pstmt.setString(3, em.getEmpNo());
			pstmt.setString(4, em.getEmpPhone());
			pstmt.setString(5, em.getEmpAddr());
			pstmt.setDate(6, em.getHireDate());
			pstmt.setString(7, em.getEmpClass());
			pstmt.setString(8, em.getEmpimg());
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
	public int updateMember(Connection con, Employee em) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = prop.getProperty("updateMember");
			
			pstmt = con.prepareStatement(sql);
			
			
			
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Employee> emplistAll(Connection con) {
		ArrayList<Employee> ae = null;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("emplistAll");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Employee e = new Employee();
				
				e.setEmpCode(rset.getInt("EMP_CODE"));
				e.setEmpJob(rset.getString("EMP_JOB"));
				e.setEmpName(rset.getString("EMP_NAME"));
				e.setEmpPhone(rset.getString("EMP_PHONE"));
				e.setHireDate(rset.getDate("HIRE_DATE"));
				e.setEntDate(rset.getDate("ENT_DATE"));
				e.setEmpClass(rset.getString("EMP_CLASS"));
				e.setHobong(rset.getInt("HOBONG"));
				e.setEntYN(rset.getString("ENT_YN").equals("Y")?1:2);
				
				ae.add(e);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(con);
		}
				
		return ae;
				
	}

}

 
