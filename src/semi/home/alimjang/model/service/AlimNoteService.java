package semi.home.alimjang.model.service;

import semi.home.alimjang.model.dao.AlimNoteDao;
import semi.home.alimjang.model.vo.AlimNote;
import semi.home.jsp.model.vo.Member;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

public class AlimNoteService {
	private AlimNoteDao anDao = new AlimNoteDao();

	/** 알림장 작성
	 * @param m
	 * @param an
	 * @return
	 */
	public int insertAlimNote(Member m, AlimNote an) {
		Connection con = getConnection();
		
		int result = anDao.insertAlimNote(con, m, an);
		
		if(result > 0) commit(con);
		else rollback(con);
				
		return result;
	}

	

}
