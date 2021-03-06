package semi.intranet.alimjang.model.service;

import static semi.common.JDBCTemplate.*;

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
	 * 알림장 반 게시글 총 글 수 확인
	 * @param empNo
	 * @return
	 */
	public int getClassListCount(int empNo) {

		Connection con = getConnection();
		
		int listCount = ad.getClassListCount(con, empNo);
		
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
		
		Alim a = new Alim();
		for(int i = 0; i < list.size(); i++) {
			
			if(list.get(i).getCclass() == 1) {
				a = list.get(i);
				a.setCclassName("씨앗");
			} else if(list.get(i).getCclass() == 2) {
				a = list.get(i);
				a.setCclassName("새싹");
			} else if(list.get(i).getCclass() == 3) {
				a = list.get(i);
				a.setCclassName("나무");
			} else if(list.get(i).getCclass() == 4) {
				a = list.get(i);
				a.setCclassName("열매");
			}
		}
		
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
		
		Alim a = new Alim();
		for(int i = 0; i < list.size(); i++) {
			
			if(list.get(i).getCclass() == 1) {
				a = list.get(i);
				a.setCclassName("씨앗");
			} else if(list.get(i).getCclass() == 2) {
				a = list.get(i);
				a.setCclassName("새싹");
			} else if(list.get(i).getCclass() == 3) {
				a = list.get(i);
				a.setCclassName("나무");
			} else if(list.get(i).getCclass() == 4) {
				a = list.get(i);
				a.setCclassName("열매");
			}
		}
		
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
	 * @param category 
	 * @return
	 */
	public Alim readAlimCommon(int empNo, int ano, int category) {
		
		Connection con = getConnection();
		
		Alim b = ad.readAlimCommon(con, empNo, ano, category);
		
		close(con);
		
		if(b.getCclass() == 1) {
			b.setCclassName("씨앗");
		} else if(b.getCclass() == 2) {
			b.setCclassName("새싹");
		} else if(b.getCclass() == 3) {
			b.setCclassName("나무");
		} else if(b.getCclass() == 4) {
			b.setCclassName("열매");
		}
		
		return b;
	}

	/**
	 * 알림장 읽기 여부 업데이트용
	 * @param empNo
	 * @param read
	 * @param category 
	 * @param ano 
	 * @return
	 */
	public int readAlimCheck(int empNo, String read, int ano, int category) {
		
		Connection con = getConnection();
		
		int result = ad.readAlimCheck(con, empNo, read, ano, category);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	
}
