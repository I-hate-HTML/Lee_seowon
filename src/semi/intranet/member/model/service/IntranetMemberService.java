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
	
	public int readAlimCheck(int empNo, String read, int ano, int category) {
			
			Connection con = getConnection();
			
			int result = ad.readAlimCheck(con, empNo, read, ano, category);
			
			if(result > 0) {
				commit(con);
			} else {
				rollback(con);
			}
			
			close(con);
			
			return 0;
		}

}
