package semi.intranet.qna.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.qna.model.vo.QnA;
import semi.intranet.qna.model.dao.IntranetQnaDao;

public class IntranetQnaService {

	private IntranetQnaDao qDao = new IntranetQnaDao();
	
	/**
	 * 인트라넷 문의 확인 리스트 불러오기
	 * @return
	 */
	public ArrayList<QnA> selectList() {
		Connection con = getConnection();
		
		ArrayList<QnA> list = qDao.selectList(con);
		
		close(con);
		
		return list;
	}

	/**
	 * 인트라넷 문의 확인 상세 보기
	 * @param qno
	 * @return
	 */
	public QnA selectOne(int qno) {
		Connection con = getConnection();
		
		QnA q = qDao.selectOne(con, qno);
		
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

}
