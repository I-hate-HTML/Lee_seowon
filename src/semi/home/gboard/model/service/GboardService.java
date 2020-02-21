package semi.home.gboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.gboard.model.dao.GboardDao;
import semi.home.gboard.model.vo.Gboard;
import semi.home.jsp.model.exception.MemberException;

import static semi.common.JDBCTemplate.*;
public class GboardService {

	private GboardDao gDao = new GboardDao();
	
	
	public ArrayList<Gboard> selectList(int currentPage,int limit)  {
		Connection con = getConnection();
		
		ArrayList<Gboard> list = gDao.selectList(con,currentPage,limit);
		
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


	public Gboard upDateView(int gno) {
		Connection con = getConnection();
		Gboard g = gDao.upDateView(con,gno);
		
		close(con);
		
		return g;
	}


	public int updateGboard(int gno, String gcontent, String gfile) {
		Connection con = getConnection();
		int result = gDao.updateGboard(con,gno,gcontent,gfile);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public int gboardDelete(int gno) {
		Connection con = getConnection();
		int result = gDao.gboardDelete(con,gno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}


	public int getListCount() {
		Connection con = getConnection();
		int listCount = gDao.getListCount(con);
		close(con);
		return listCount;
	}


	public ArrayList<Gboard> searchGboard(String category, String keyword) {
		Connection con = getConnection();
		ArrayList<Gboard> searchlist = null;
				
		if(category.length() > 0) {
			searchlist = gDao.searchGboard(con,category,keyword);
		}else {
			searchlist = gDao.selecGboard(con);
		}
		close(con);
		return searchlist;
	}

}
