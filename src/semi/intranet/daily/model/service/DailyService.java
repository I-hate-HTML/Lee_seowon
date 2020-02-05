package semi.intranet.daily.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

import semi.intranet.daily.model.dao.DailyDao;
import semi.intranet.daily.model.vo.Daily;

public class DailyService {
	
	private DailyDao dd = new DailyDao();

	public int dailyInsert(Daily b) {
		
		Connection con = getConnection();
		
		int result = dd.dailyInsert(con, b);
				
		close(con);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}

}
