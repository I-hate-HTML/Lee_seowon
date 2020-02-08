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
		
		if(list != null) commit(con);
		else rollback(con);
		
		close(con);
		
		return list;
	}

}
