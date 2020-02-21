package semi.intranet.child.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

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

	public ArrayList<Child> stulistAll() {
		con = getConnection();
		
		ArrayList<Child> ae = cDao.stulistAll(con);
		close(con);
				
		return ae;
	}

	public int editChild(int code, String state, String addr, String graduate) {
		con = getConnection();
		int result = cDao.updateChild(con,code,state,addr,graduate);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public int deleteChild(int delid) {
		con = getConnection();
		int result = cDao.deleteChild(con,delid);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}
}
