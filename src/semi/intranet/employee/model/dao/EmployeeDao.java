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
			pstmt.setString(5, em.getEmpEmail());
			pstmt.setString(6, em.getEmpAddr());
			pstmt.setString(7, em.getHireDate());
			pstmt.setString(8, em.getEmpClass());
			pstmt.setString(9, em.getEmpimg());
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace(); 
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	/**원태 씨의
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
		ArrayList<Employee> ae = new ArrayList<>();
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("emplistAll");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				Employee e = new Employee();
				
				e.setEmpCode(rset.getInt(1));
				e.setEmpJob(rset.getString(3));
				e.setEmpName(rset.getString(2));
				e.setEmpPhone(rset.getString(5));
				e.setHireDate(rset.getString(8));
				e.setEmpClass(rset.getString(11));
				e.setHobong(rset.getInt(12));
				e.setEntYN(rset.getString(10));
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

	/**
	 * 원태 씨가 만든 거
	 * @param con
	 * @param code
	 * @param phone
	 * @param email
	 * @param addr
	 * @param enddate
	 * @return
	 */
	public int updateMember(Connection con, int code, String phone, String email, String addr, String enddate) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("editEmp");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, phone);
			pstmt.setString(2, email);
			pstmt.setString(3, addr);
			pstmt.setString(4, enddate);
			pstmt.setInt(5, code);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 마정훈이 한 
	 * 인트라넷 intraEdit.jsp 정보수정
	 * @param con
	 * @param empl
	 * @return
	 */
	public int updateMemberByMa(Connection con, Employee empl) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateEmployeeByMa");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, empl.getEmpimg());
			pstmt.setString(2, empl.getEmpPhone());
			pstmt.setString(3, empl.getEmpEmail());
			pstmt.setString(4, empl.getEmpAddr());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteEmployee(Connection con, int delid) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("delEmp");
		
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

	/**
	 * 개인정보수정intranetEdit.화면 불러오기
	 * @param con
	 * @return
	 */
	public ArrayList<Employee> updateViewShowingByMa(Connection con) {
		ArrayList<Employee> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("updateViewShowingByMa");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Employee>();
			
			while(rset.next()) {
				Employee empl = new Employee();
				
				empl.setEmpimg(rset.getString("EMP_IMG"));
				empl.setEmpName(rset.getString("EMP_NAME"));
				empl.setEmpCode(rset.getInt("EMP_CODE"));
				empl.setEmpEmail(rset.getString("EMP_EMAIL"));
				empl.setEmpPhone(rset.getString("EMP_PHONE"));
				empl.setEmpAddr(rset.getString("EMP_ADDR"));
				
				list.add(empl);
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

