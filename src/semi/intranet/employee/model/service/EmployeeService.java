package semi.intranet.employee.model.service;

import java.sql.Connection;

import static semi.common.JDBCTemplate.*; 

import intranet.employee.model.dao.EmployeeDao;
import intranet.employee.model.vo.Employee;

public class EmployeeService {

	private Connection con;
	private EmployeeDao mDao = new EmployeeDao();
	public int insertEmployee(Employee  em) {
		int result = 0;
		con = getConnection();
		
		result=mDao.insertEmployee(con,em);
		
		if(result>0) commit(con);
		else rollback(con); 
		
		close(con);
		 
		return result;
	}

}
