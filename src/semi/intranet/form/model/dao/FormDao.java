package semi.intranet.form.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import semi.intranet.daily.model.dao.DailyDao;
import semi.intranet.employee.model.vo.Employee;
import semi.intranet.form.model.vo.SignList;

import static semi.common.JDBCTemplate.*;

public class FormDao {
	
	private Properties prop;
	
	/**
	 * 쿼리문 연결용
	 */
	public FormDao() {
		
		prop = new Properties();
		
		String filePath = DailyDao.class.getResource("/config/intranetForm-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	

	/**
	 * 결재자 리스트 가져오기
	 * @param con
	 * @param empNo
	 * @return
	 */
	public ArrayList<SignList> getSignList(Connection con, int empNo) {
		
		ArrayList<SignList> list = new ArrayList<SignList>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getSignList");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, empNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				SignList s = new SignList();
				
				s.setSname(rset.getString("EMP_NAME"));
				s.setScode(rset.getInt("EMP_CODE"));
				s.setSposition(rset.getInt("EMP_JOB"));
				
				list.add(s);			
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

}
