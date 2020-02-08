package semi.intranet.form.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.intranet.form.model.dao.FormDao;
import semi.intranet.form.model.vo.SignList;

import static semi.common.JDBCTemplate.*;

public class FormService {
	
	private FormDao fd = new FormDao();

	/**
	 * 결재자 리스트 불러오기 용
	 * @param empNo
	 * @return
	 */
	public ArrayList<SignList> getSignList(int empNo) {
		
		Connection con = getConnection();
		
		ArrayList<SignList> list = fd.getSignList(con, empNo);
		
		close(con);
		
		return list;
	}

}
