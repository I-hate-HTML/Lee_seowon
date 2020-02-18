package semi.intranet.counsel.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

import semi.intranet.counsel.model.dao.CounselDao;

public class CounselService {

	private CounselDao cDao = new CounselDao();
	
	public int deleteCounsel(int cno) {
		Connection con = getConnection();
		
		int result = cDao.deleteCounsel(con, cno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

}
