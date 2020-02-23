package semi.intranet.main.model.service;


import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import semi.intranet.child.model.vo.Child;
import semi.intranet.main.model.dao.MainDao;
import semi.intranet.main.model.vo.MainAlim;
import semi.intranet.main.model.vo.MainDraft;

public class MainService {
	private Connection con;
	private MainDao cDao = new MainDao();
	
	
	
	public List<MainAlim> alimlist() {
		con = getConnection();
		
		ArrayList<MainAlim> ae = cDao.alimlist(con);
		close(con);
				
		return ae;
	}



	public List<MainDraft> draftlist() {
		con = getConnection();
		
		ArrayList<MainDraft> ae = cDao.draftlist(con);
		close(con);
				
		return ae;
	}

}
