package semi.intranet.employee.model.service;

import static com.kh.jsp.common.JDBCTemplate.close;
import static com.kh.jsp.common.JDBCTemplate.commit;
import static com.kh.jsp.common.JDBCTemplate.getConnection;
import static com.kh.jsp.common.JDBCTemplate.rollback;
import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;

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
	 * 인트라넷 정보수정
	 * @param e
	 */
	public void updateEmployee(Employee e) {
		
		con = getConnection();
		int result = eDao.updateMember(con,e);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
		
	}

}
