package semi.intranet.nav.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.intranet.alimjang.model.vo.Alim;
import semi.intranet.nav.model.dao.IntranetNavDao;
import semi.intranet.nav.model.vo.NavAlim;
import semi.intranet.nav.model.vo.NavEmployeeInfo;
import semi.intranet.nav.model.vo.NavForm;

public class IntranetNavService {
	
	IntranetNavDao ind = new IntranetNavDao();

	
	
	/**
	 * 선생님 정보가져오기
	 * @param empNo
	 * @return
	 */
	public NavEmployeeInfo getTClass(int empNo) {
		
		Connection con = getConnection();
		
		NavEmployeeInfo info = ind.getTClass(con, empNo);
		
		close(con);
		
		
		return info;
	}

	
	/**
	 * Form 새로운 알림 갯수 확인용
	 * @param emp
	 * @return
	 */
	public int newFormCount(int emp) {

		Connection con = getConnection();
		
		int newCount = ind.newFormCount(con, emp);
				
		
		return newCount;
	}


	/**
	 * Form 새로운 알림 리스트 가져오기
	 * @param emp
	 * @return
	 */
	public ArrayList<NavForm> navListForm(int emp) {
		
		Connection con = getConnection();
		
		ArrayList<NavForm> list = ind.navFormList(con, emp);
		
		close(con);
		
		return list;
	}


	/**
	 * Alim 새로운 알림 갯수 확인용
	 * @param emp
	 * @return
	 */
	public int newAlimCount(int emp) {
		
		Connection con = getConnection();
		
		int newCount = ind.newAlimCount(con, emp);
		
		close(con);
		
		return newCount;
	}


	/**
	 * 알림장 nav 알림 리스트 가져오기
	 * @param emp
	 * @return
	 */
	public ArrayList<NavAlim> navListAlim(int emp) {
		
		Connection con = getConnection();
		
		ArrayList<NavAlim> list = ind.navListAlim(con, emp);
		
		close(con);
		
		return list;
	}

	
}
