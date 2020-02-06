package semi.home.jsp.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import static semi.common.JDBCTemplate.*;
import semi.home.jsp.model.vo.Member;

public class HomeMemberDao {
	private Properties prop;
	
	public HomeMemberDao() {
		prop = new Properties();
		
		String filePath = HomeMemberDao.class.getResource("member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public Member selectMember(Connection con, Member m) {
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
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public int homeMemberInsert(Connection con, Member m) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("homeMemberInsert");
		
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
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
