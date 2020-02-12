package semi.intranet.alimjang.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.intranet.alimjang.model.dao.AlimDao;
import semi.intranet.alimjang.model.vo.Alim;

public class AlimService {
	
	AlimDao ad = new AlimDao();

	/**
	 * 알림장 총 게시글 확인
	 * @return
	 */
	public int getListCount() {

		Connection con = getConnection();
		
		int listCount = ad.getListCount(con);
		
		return listCount;
	}

	/**
	 * 알림장 전체 리스트 가져오기
	 * @param currentPage
	 * @param limitContent
	 * @return
	 */
	public ArrayList<Alim> selectListAll(int currentPage, int limitContent) {
		
		Connection con = getConnection();
		
		ArrayList<Alim> list = ad.selectListAll(con, currentPage, limitContent);
		
		close(con);
		
		return list;
	}

	/**
	 * 알림장 우리반 리스트 가져오기
	 * @param empNo
	 * @param currentPage
	 * @param limitContent
	 * @return
	 */
	public ArrayList<Alim> selectListClass(int empNo, int currentPage, int limitContent) {
		Connection con = getConnection();
		
		ArrayList<Alim> list = ad.selectListClass(con, empNo, currentPage, limitContent);
		
		close(con);
		
		return list;
	}

}
