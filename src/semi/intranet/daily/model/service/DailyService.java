package semi.intranet.daily.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.intranet.daily.model.dao.DailyDao;
import semi.intranet.daily.model.vo.Daily;

public class DailyService {
	
	private DailyDao dd = new DailyDao();

	/**
	 * 게시글 올리기용
	 * @param b
	 * @param bcategory 
	 * @return
	 */
	public int dailyInsert(Daily b) {
		
		Connection con = getConnection();
		
		int result = dd.dailyInsert(con, b);
				
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);

		return result;
	}

	/**
	 * 총 게시글 확인
	 * @param category --> 1 공지사항 / 2 교육일지 
	 * @return
	 */
	public int getListCount(int category) {

		Connection con = getConnection();
		
		int result = dd.getListCount(con, category);
		
		close(con);
		
		return result;
	}
	
	
	/**
	 * 게시판 목록 불러오기 + 페이징 처리
	 * @param currentPage
	 * @param limitContent
	 * @return
	 */
	public ArrayList<Daily> selectList(int currentPage, int limitContent, int category) {
		
		Connection con = getConnection();
		
		ArrayList<Daily> list = dd.selectList(con, currentPage, limitContent, category);
		
		close(con);
		
		return list;
	}

	
	/**
	 * 게시물 읽기 + 카운트 올리기
	 * @param dno
	 * @param category
	 * @return
	 */
	public Daily selectOne(int dno, int category) {
		
		
		Connection con = getConnection();
		
		Daily d = dd.selectOne(con, dno, category);
		
		// 게시글 상세보기를 하면
		if(d != null) {
			// 글 수 카운트 올리기
			int result = dd.updateReadCount(con, dno, category);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		}
		
		close(con);
		
		return d;
	}

	/**
	 * 글 삭제용
	 * @param dno
	 * @param category
	 * @return
	 */
	public int dailyDelete(int dno, int category) {
		
		Connection con = getConnection();
		
		int result = dd.dailyDelete(con, dno, category);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	/**
	 * 수정할 게시글 가져오기 (수정 입력창에 띄울 것)
	 * @param dno
	 * @param category
	 * @return
	 */
	public Daily dailyModifyView(int dno, int category) {
		
		Connection con = getConnection();
		
		Daily d = dd.dailyModifyView(con, dno, category);
		
		close(con);
		
		return d;
	}

	
	/**
	 * 수정한 게시글 저장하기
	 * @param dno
	 * @param b
	 * @return
	 */
	public int dailyModifySave(int dno, Daily d) {
		
		Connection con = getConnection();
		
		int result = dd.dailyModifySave(con, dno, d);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

}
