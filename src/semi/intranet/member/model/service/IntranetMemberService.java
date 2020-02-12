package semi.intranet.member.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.jsp.model.vo.Member;
import semi.intranet.member.model.dao.IntranetMemberDao;

public class IntranetMemberService {

	private IntranetMemberDao imDao = new IntranetMemberDao ();
	
	/**
	 * 조회용
	 * @return
	 */
	public ArrayList<Member> selectList() {
		Connection con = getConnection();
		
		ArrayList<Member> list = imDao.selectList(con);
		
		close(con);
		
		return list;
	}
	
	public Member selectOne(int nno) {
		Connection con = getConnection();
		
		Member m = imDao.selectOne(con, nno);
		
		// 게시글 상세보기를 통해 1회 조회할때
		// 2가지 기능이 실행된다.
		// 1. nno에 해당하는 게시글 내용을 가져오기(SELECT)
		// 2. 게시글 내용이 성공적으로 불러와 졌다면 (UPDATE)
		//    조회수가 1 증가해야한다.
		
		if(m != null) {
			int result = imDao.updateReadCount(con,nno);
			
			if(result > 0) commit(con);
			else rollback(con);
		}
		
		close(con);
		
		return m;
	}

}
