package semi.intranet.main.model.service;


import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import semi.intranet.main.model.dao.MainDao;
import semi.intranet.main.model.vo.MainAlim;
import semi.intranet.main.model.vo.MainDraft;

public class MainService {
	private Connection con;
	private MainDao mDao = new MainDao();
	
	
	
	public ArrayList<MainAlim> alimlist() {
		con = getConnection();
		System.out.println("aa4");
		ArrayList<MainAlim> ae = mDao.alimlist(con);
		close(con);
				
		return ae;
	}



	public ArrayList<MainDraft> draftlist() {
		con = getConnection();
		
		ArrayList<MainDraft> ae = mDao.draftlist(con);
		close(con);
				
		return ae;
	}

}
