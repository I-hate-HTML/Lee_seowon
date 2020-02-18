package semi.home.gboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.gboard.model.dao.GboardDao;
import semi.home.gboard.model.vo.Gboard;
import semi.home.jsp.model.exception.MemberException;

import static semi.common.JDBCTemplate.*;
public class GboardService {

	private GboardDao gDao = new GboardDao();
	
	
	public ArrayList<Gboard> selectList()  {
		Connection con = getConnection();
		
		ArrayList<Gboard> list = gDao.selectList(con);
		
		close(con);
		
		return list;
	}


	public Gboard selectOne(int gno) {
		Connection con = getConnection();
		Gboard g = gDao.selectOne(con,gno);
		if(g != null) {
			int result = gDao.updateReadCount(con,gno);
		
			if(result > 0)commit(con);
			else rollback(con);
		}
		
		
		return g;
	}


	public int insertgboard(Gboard g) {
		Connection con = getConnection();
		int result = gDao.insertgboard(con,g);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
