package semi.intranet.member.model.dao;

import static semi.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import semi.home.jsp.model.vo.Member;

public class IntranetMemberDao {

	private Properties prop;
	
	/**
	 * 쿼리 연결
	 */
	public IntranetMemberDao() {
		prop = new Properties();
		
		String filePath = Member.class.getResource("/config/intranetMember-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 페이지 불러올래요
	 * @param con
	 * @return
	 */
	public ArrayList<Member> selectList(Connection con) {
		ArrayList<Member> list = null;//반환시켜줄 변수 선언
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member m = new Member();
				
				m.setUserId(rset.getString("userId"));//m.getUserId()?
				m.setUserName(rset.getString("userName"));//m.getUserPwd()?
				m.setGender(rset.getString("gender"));//String?
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));//int?
				m.setAddress(rset.getString("address"));
				m.setEnrolldate(rset.getDate("enrolldate"));
				m.setCno(rset.getInt("cno"));
				m.setCname(rset.getString("cname"));
				m.setCbdate(rset.getDate("cbdate"));
				m.setCgender(rset.getString("cgender"));//String?
				m.setCclass(rset.getInt("cclass"));
				
				list.add(m);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	public int readAlimCheck(Connection con, int empNo, String read, int ano, int category) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = "";
		
		if(category == 1) {
			sql = prop.getProperty("readAlimNoteCheck");
		} else if (category == 2) {
			sql = prop.getProperty("readAlimHomeCheck");
		} else if (category == 3) {
			sql = prop.getProperty("readAlimMediCheck");
		}
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, read);
			pstmt.setInt(2, ano);
			
			result = pstmt.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	/**
	 * ????
	 * @param con
	 * @param nno
	 * @return
	 */
	public Member selectOne(Connection con, int nno) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, nno);//?????
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member();
				
				m.setUserId(rset.getString("userId"));//m.getUserId()?
				m.setUserName(rset.getString("userName"));//m.getUserPwd()?
				m.setGender(rset.getString("gender"));//String?
				m.setEmail(rset.getString("email"));
				m.setPhone(rset.getString("phone"));//int?
				m.setAddress(rset.getString("address"));
				m.setEnrolldate(rset.getDate("enrolldate"));
				m.setCno(rset.getInt("cno"));
				m.setCname(rset.getString("cname"));
				m.setCbdate(rset.getDate("cbdate"));
				m.setCgender(rset.getString("cgender"));//String?
				m.setCclass(rset.getInt("cclass"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return m;
	}

	/**
	 * 상세보기 카운트??
	 * @param con
	 * @param nno
	 * @return
	 */
	public int updateReadCount(Connection con, int nno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateReadCount");
		
		try {
			//미완성된 SQL 준비
			pstmt = con.prepareStatement(sql);
			
			//SQL의 ?를 채워 쿼리 완성
			pstmt.setInt(1, nno);//??
			
			//결과 확인
			//PreparedStatement 객체의 메소드 중에서
			//insert,update,delete를 사용하면 executeUpdate사용
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	
	
}
