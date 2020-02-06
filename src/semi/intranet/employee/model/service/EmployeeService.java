package semi.intranet.employee.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

import semi.intranet.employee.model.dao.EmployeeDao;
import semi.intranet.employee.model.vo.Employee;

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
