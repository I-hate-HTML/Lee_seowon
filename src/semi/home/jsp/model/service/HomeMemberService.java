package semi.home.jsp.model.service;

import static semi.common.JDBCTemplate.*;

import java.sql.Connection;

import semi.home.jsp.model.dao.HomeMemberDao;
import semi.home.jsp.model.exception.MemberException;
import semi.home.jsp.model.vo.Member;
public class HomeMemberService {

	private Connection con;
	private HomeMemberDao hmDao = new HomeMemberDao();
	
	public Member selectMember(Member m) throws MemberException{
		con = getConnection();
	
		Member result = hmDao.selectMember(con,m);
		
		close(con);
		
		if(result == null) {
			throw new MemberException("회원 아이디나 비밀번호가 올바르지 않습니다.");
		}
		
		return result;
	}


	public int homeMemberInsert(Member m) throws MemberException {
		con = getConnection();
		
		int result = hmDao.homeMemberInsert(con,m);
		
		if(result > 0) commit(con); 
		else rollback(con);
		
		close(con);
		
		return result;
		}


	public int homeMemberUpdate(Member m) throws MemberException {
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
	 * @throws MemberException 
	 */
	public int homedeleteMember(String userId) throws MemberException {
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


	public Member searchId(Member m) throws MemberException {
		con = getConnection();
		
		Member result = hmDao.searchId(con,m);
		close(con);
		
		
		return result;
	}


	public Member searchPwd(Member m) throws MemberException {
		con = getConnection();
		
		Member result = hmDao.serchPwd(con,m);
		close(con);
		
		return result;
	}


	}


