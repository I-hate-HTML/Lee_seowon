package semi.intranet.child.model.service;

import java.sql.Connection;

import semi.intranet.child.model.dao.ChildDao;
import semi.intranet.child.model.vo.Child;
import static semi.common.JDBCTemplate.*;

public class ChildService {
	private Connection con;
	private ChildDao cDao;
	
	public int insertChild(Child c) {
		con = getConnection();
		
		int result = cDao.insertChild(c,con);
		
		if(result>0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
}
