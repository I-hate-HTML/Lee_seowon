package semi.intranet.member.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.jsp.model.vo.Member;
import semi.intranet.member.model.dao.IntranetMemberDao;

public class IntranetMemberService {

	private IntranetMemberDao imDao = new IntranetMemberDao ();
	
	/**
	 * 가입한 회원들 조회용
	 * @return
	 */
	public ArrayList<Member> selectList() {
		Connection con = getConnection();
		
		ArrayList<Member> list = imDao.selectList(con);
		
		close(con);
		
		return list;
	}
	
	/**
	 * 가입승인 버튼 눌렀을 때
	 * @param userId
	 * @return
	 */
	public int acceptMember(String userId) {
		Connection con = getConnection();
		
		return imDao.acceptMember(con,userId);
	}
	
	/**
	 * 가입거절 눌렀을 때
	 * @param userId
	 * @return
	 */
	public int rejectMember(String userId) {
		Connection con = getConnection();
		
		return imDao.rejectMember(con,userId);
	}

}
