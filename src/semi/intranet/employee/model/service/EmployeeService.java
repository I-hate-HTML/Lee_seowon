package semi.intranet.employee.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.intranet.employee.model.dao.EmployeeDao;
import semi.intranet.employee.model.vo.Employee;

public class EmployeeService {

	private Connection con;
	private EmployeeDao eDao = new EmployeeDao();
	public int insertEmployee(Employee  em) {
		int result = 0;
		con = getConnection();
		
		result=eDao.insertEmployee(con,em);
		
		if(result>0) commit(con);
		else rollback(con); 
		
		close(con);
		 
		return result;
	}
	/**
	 * 원태 씨의 인트라넷 정보수정
	 * @param e
	 */
	public int updateEmployee(Employee e) {
		
		
		con = getConnection();
		int result = eDao.updateMember(con,e);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		 
	}
	
	/**마정훈이 한 인트라넷 intranetEdit.정보 수정
	 * @param empl
	 * @return
	 */
	public int updateEmployeeByMa(Employee empl) {
		con = getConnection();
		int result = eDao.updateMemberByMa(con,empl);
		
		if(result > 0) commit(con);
		else rollback(con);
		close(con);
		return result;
	}
	
	public ArrayList<Employee> emplistAll() {
		con = getConnection();
		
		ArrayList<Employee> ae = eDao.emplistAll(con);
		close(con);
				
		return ae;
	}
	public int editEmployee(int code, String phone, String email, String addr, String enddate) {
		con = getConnection();
		int result = eDao.updateMember(con,code,phone,email,addr,enddate);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	public int deleteEmployee(int delid) {
		con = getConnection();
		int result = eDao.deleteEmployee(con,delid);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
	
	/**
	 * 인트라넷 마정훈 개인정보수정 화면  불러오기
	 * @return
	 */
	public ArrayList<Employee> updateViewShowingByMa() {
		Connection con = getConnection();
		
		ArrayList<Employee> list = eDao.updateViewShowingByMa(con);
		close(con);
		
		return list;
	}
	

}
