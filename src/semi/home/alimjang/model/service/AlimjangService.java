package semi.home.alimjang.model.service;

import semi.home.alimjang.model.dao.AlimjangDao;
import semi.home.alimjang.model.vo.AlimHome;
import semi.home.alimjang.model.vo.AlimMedi;
import semi.home.alimjang.model.vo.AlimNote;
import semi.home.jsp.model.vo.Member;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

public class AlimjangService {
	private AlimjangDao aDao = new AlimjangDao();

	/** 알림장 작성
	 * @param m
	 * @param an
	 * @return
	 */
	public int insertAlimNote(Member m, AlimNote an) {
		Connection con = getConnection();
		
		int result = aDao.insertAlimNote(con, m, an);
				
		if(result > 0) commit(con);
		else rollback(con);
				
		return result;
	}

	/** 귀가동의서 작성
	 * @param m
	 * @param ah
	 * @return
	 */
	public int insertAlimHome(Member m, AlimHome ah) {
		Connection con = getConnection();
		
		int result = aDao.insertAlimHome(con, m, ah);
				
		if(result > 0) commit(con);
		else rollback(con);
				
		return result;
	}

	/** 투약의뢰서 작성
	 * @param m
	 * @param am
	 * @return
	 */
	public int insertAlimMedi(Member m, AlimMedi am) {
		Connection con = getConnection();
		
		int result = aDao.insertAlimMedi(con, m, am);
		
		if(result > 0) commit(con);
		else rollback(con);
				
		return result;
	}

	

}
