package semi.intranet.form.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.intranet.form.model.dao.FormDao;
import semi.intranet.form.model.vo.Form;
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

	/**
	 * 품의서 작성용
	 * @param f
	 * @return
	 */
	public int insertForm(Form f) {
		
		Connection con = getConnection();
		
		int result = fd.insertForm(con, f);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/**
	 * 품의서 게시판
	 * @param empNum 
	 * @return
	 */
	public ArrayList<Form> listForm(int empNum) {
		
		Connection con = getConnection();
		
		ArrayList<Form> list = fd.listForm(con, empNum);
		
		close(con);
		
		
		return list;
	}

}
