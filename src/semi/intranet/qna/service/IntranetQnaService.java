package semi.intranet.qna.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.qna.model.vo.QnA;
import semi.intranet.qna.model.dao.IntranetQnaDao;
import semi.intranet.qna.model.vo.IntranetQna;

public class IntranetQnaService {

	private IntranetQnaDao qDao = new IntranetQnaDao();
	
	
	/**
	 * 인트라넷 총 게시글 확인
	 * @param empNo 
	 * @return
	 */
	public int getListCount(int empNo) {
		
		Connection con = getConnection();
		
		int listCount = qDao.getListCount(con, empNo);
		
		return listCount;
		
	}
	
	
	
	/**
	 * 인트라넷 문의 확인 리스트 불러오기
	 * @param empNo 
	 * @return
	 */
	public ArrayList<IntranetQna> selectList(int empNo) {
		
		Connection con = getConnection();
		
		ArrayList<IntranetQna> list = qDao.selectList(con, empNo);
		
		close(con);
		
		return list;
	}

	/**
	 * 인트라넷 문의 확인 상세 보기
	 * @param qno
	 * @return
	 */
	public IntranetQna selectOne(int qno) {
		
		Connection con = getConnection();
		
		IntranetQna q = qDao.selectOne(con, qno);
		
		// 게시글 상세보기를 통해 1회 조회할때
		// 2가지 기능이 실행된다.
		// 1. nno에 해당하는 게시글 내용을 가져오기(SELECT)
		// 2. 게시글 내용이 성공적으로 불러와 졌다면 (UPDATE)
		//    조회수가 1 증가해야한다.		
		
		if(q != null) {
			int result = qDao.updateReadCheck(con,qno);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return q;
	}

	/**
	 * 인트라넷 문의확인에서 문의 삭제
	 * @param qno
	 * @return
	 */
	public int deleteQnaList(int qno) {
		Connection con = getConnection();
		
		int result = qDao.deleteQnaList(con, qno);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}



	/**
	 * 문의사항 읽기 여부 업데이트용
	 * @param empNo
	 * @param read
	 * @param qno
	 * @return
	 */
	public int readQnaCheck(int empNo, String read, int qno) {
		
		Connection con = getConnection();
		
		int result = qDao.readQnaCheck(con, empNo, read, qno);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
		
		
		
	}

	

}
