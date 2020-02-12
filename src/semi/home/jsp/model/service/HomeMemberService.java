package semi.home.jsp.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

import semi.home.jsp.model.dao.HomeMemberDao;
import semi.home.jsp.model.vo.Member;
public class HomeMemberService {

	private Connection con;
	private HomeMemberDao hmDao = new HomeMemberDao();
	
	
	public Member selectMember(Member m) {
		con = getConnection();
		
		Member result = hmDao.selectMember(con,m);
		
		close(con);
		
		if(result == null) {
			System.out.println("회원 아이디나 비번이 올바르지 않습니다.");
		}
		
		return result;
	}


	public int homeMemberInsert(Member m) {
		con = getConnection();
		
		int result = hmDao.homeMemberInsert(con,m);
		
		if(result > 0) commit(con); 
		else rollback(con);
		
		close(con);
		
		return result;
		}


	public int homeMemberUpdate(Member m) {
		con = getConnection();
		
		int result = hmDao.homeMemberUpdate(con,m);
		
		if(result > 0) commit(con);
		else rollback(con);
			
		close(con);
		
		return result;
	}


	
	/** 회원 탈퇴
	 * @param userId
	 * @return
	 */
	public int homedeleteMember(String userId) {
		con = getConnection();
		
		int result = hmDao.homeMemberDelete(con, userId);
		
		if(result > 0) commit(con);
		else rollback(con);
		
		close(con);
		
		return result;		
	}


	public int idDupCheck(String id) {
		con = getConnection();
		
		int result = hmDao.idDupCheck(con,id);
		close(con);
		
		return result;
	}


	}


