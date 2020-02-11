package semi.home.board.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.board.model.dao.BoardDao;
import semi.home.board.model.vo.Board;
import static semi.common.JDBCTemplate.*;

public class BoardService {
	
	private BoardDao bDao = new BoardDao();

	public ArrayList<Board> selectList() {
		Connection con = getConnection();
		
		ArrayList<Board> list = bDao.selectList(con);
		
		close(con);
		
		return list;
	}

	public Board selectOne(int bno) {
		Connection con = getConnection();
		
		Board b = bDao.selectOne(con,bno);
		
		if(b != null) {
			int result = bDao.updateCount(con,b.getBno());
			
			if(result>0)commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return b;
	}

	public int BoardWrite(Board b) {
		Connection con = getConnection();
		
		int result = bDao.BoardWrite(con,b);
		
		if(result>0)commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public Board updateView(int pbno) {
		Connection con = getConnection();
		
		Board b = bDao.updateView(con,pbno);
		
		close(con);
		return b;
	}
}
	
