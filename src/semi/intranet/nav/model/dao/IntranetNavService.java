package semi.intranet.nav.model.dao;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.intranet.nav.model.service.IntranetNavDao;
import semi.intranet.nav.model.vo.NavEmployeeInfo;

public class IntranetNavService {
	
	IntranetNavDao ind = new IntranetNavDao();

	public NavEmployeeInfo getTClass(int empNo) {
		
		Connection con = getConnection();
		
		NavEmployeeInfo info = ind.getTClass(con, empNo);
		
		close(con);
		
		
		return info;
	}

}
