package semi.home.jsp.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import semi.home.jsp.model.exception.MemberException;
import semi.home.jsp.model.vo.Member;

public class HomeMemberDao {
	private Properties prop;
	
	public HomeMemberDao() {
		prop = new Properties();
		
		String filePath = Member.class.getResource("/config/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public Member selectMember(Connection con, Member m) throws MemberException {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember");
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Member();
				
				
				result.setUserId(m.getUserId());
				result.setUserPwd(m.getUserPwd());
				
				result.setUserName(rset.getString("username"));
				result.setGender(rset.getString("gender"));
				result.setEmail(rset.getString("email"));
				result.setPhone(rset.getString("phone"));
				result.setAddress(rset.getString("address"));
				result.setEnrolldate(rset.getDate("enrolldate"));
			
				result.setCname(rset.getString("cname"));
				result.setCbdate(rset.getDate("cbdate"));
				result.setCgender(rset.getString("cgender"));
				result.setCclass(rset.getInt("cclass"));
				
				
			}
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public int homeMemberInsert(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("homeMemberInsert"); 
				//"INSERT INTO MEMBER VALUES(SEQ_BNO.NEXTVAL,?,?,?,?,?,?,?,DEFAULT,NULL,?,?,?,?,DEFAULT)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getPhone());
			pstmt.setString(7, m.getAddress());
			pstmt.setString(8, m.getCname());
			pstmt.setDate(9, m.getCbdate());
			pstmt.setString(10, m.getCgender());
			pstmt.setInt(11, m.getCclass());
			
			result = pstmt.executeUpdate();
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		return result;
	}


	public int homeMemberUpdate(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("homeMemberUpdate");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserPwd());
			pstmt.setString(2, m.getEmail());
			pstmt.setString(3, m.getPhone());
			pstmt.setString(4, m.getAddress());
			pstmt.setString(5, m.getUserId());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	/**
	 * 회원 탈퇴
	 * @param con
	 * @param userId
	 * @return
	 * @throws MemberException 
	 */
	public int homeMemberDelete(Connection con, String userId) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("homeMemberDelete");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();		
			
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		} finally {
			close(pstmt);
		}		
		return result;
	}


	public int idDupCheck(Connection con, String id) {
		int result = -1;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("idDupCheck");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				result = rset.getInt(1);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public Member searchId(Connection con, Member m) throws MemberException {
		Member result = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchId");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = new Member();
				
				result.setUserId(rset.getString("userId"));
			}
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(rset);
			close(pstmt);
		}
	
		return result;
	}


	public int serchPwd(Connection con, Member m) throws MemberException {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("serchPwd");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setDate(2, m.getCbdate());
			
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			throw new MemberException(e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public String searchPhoneNum(Connection con, Member m) {
		String phonenum="";
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchPhoneNum");
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setDate(2, m.getCbdate());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				phonenum = rset.getString(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return phonenum;
	}

}
