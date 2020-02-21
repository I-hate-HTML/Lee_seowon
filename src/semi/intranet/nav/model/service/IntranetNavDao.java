package semi.intranet.nav.model.service;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.intranet.nav.model.vo.NavEmployeeInfo;

import static semi.common.JDBCTemplate.*;

public class IntranetNavDao {
	
	private Properties prop;

	/**
	 * 쿼리문 연결용
	 */
	public IntranetNavDao() {
		
		prop = new Properties();
		
		String filePath = IntranetNavDao.class.getResource("/config/intranetNav-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	public NavEmployeeInfo getTClass(Connection con, int empNo) {
		
		NavEmployeeInfo info = new NavEmployeeInfo();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getTClass");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				info.setClassNum(rset.getInt("EMP_CLASS"));
				info.setImage(rset.getString("EMP_IMG"));
				info.setPosition(rset.getString("JOB"));
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return info;
	}

}
