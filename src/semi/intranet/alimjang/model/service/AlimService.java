package semi.intranet.alimjang.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.alimjang.model.vo.AlimHome;
import semi.home.alimjang.model.vo.AlimMedi;
import semi.home.alimjang.model.vo.AlimNote;
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

	/**
	 * 알림장 노트 게시글 읽기
	 * @param empNo
	 * @param ano
	 * @return
	 */
	public AlimNote readAlimNote(int empNo, int ano) {
		
		Connection con = getConnection();
		
		AlimNote a = ad.readAlimNote(con, empNo, ano);
		
		close(con);
		
		return a;
		
	}
	
	/**
	 * 알림 귀가의뢰서 게시글 읽기
	 * @param empNo
	 * @param ano
	 * @return
	 */
	public AlimHome readAlimHome(int empNo, int ano) {
		
		Connection con = getConnection();
		
		AlimHome a = ad.readAlimHome(con, empNo, ano);
		
		close(con);
		
		return a;
		
	}
	
	/**
	 * 알림 투약의뢰서 게시글 읽기
	 * @param empNo
	 * @param ano
	 * @return
	 */
	public AlimMedi readAlimMedi(int empNo, int ano) {
		
		Connection con = getConnection();
				
		AlimMedi a = ad.readAlimMedi(con, empNo, ano);
		
		close(con);
		
		return a;
	}


	/**
	 * 알림장 읽기 커먼 정보
	 * @param empNo
	 * @param ano
	 * @param table
	 * @param culumn
	 * @param category 
	 * @return
	 */
	public Alim readAlimCommon(int empNo, int ano, String table, String culumn, int category) {
		
		Connection con = getConnection();
		
		Alim b = ad.readAlimCommon(con, empNo, ano, table, culumn, category);
		
		close(con);
		
		return b;
	}

	
	
}
