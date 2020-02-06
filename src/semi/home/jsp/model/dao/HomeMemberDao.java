package semi.home.jsp.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

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
				
				
				
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
