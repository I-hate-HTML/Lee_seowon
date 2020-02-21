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
import semi.intranet.nav.model.vo.NavForm;

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
	
	
	/**
	 * 선생님 정보가져오기
	 * @param con
	 * @param empNo
	 * @return
	 */
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


	/**
	 * 내가 쓴 품의서 중 완료된 품의서 갯수 가져오기
	 * @param con
	 * @param emp
	 * @return
	 */
	public int newFormCount(Connection con, int emp) {
		
		int formCount = 0;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("getFormCount");
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, emp);
			pstmt.setString(2, "%"+emp+"%");
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				formCount = rset.getInt("SUM(TOTAL)");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return formCount;
	}


	/**
	 * nav form 알림 리스트
	 * @param con
	 * @param emp
	 * @return
	 */
	public ArrayList<NavForm> navFormList(Connection con, int emp) {
		
		ArrayList<NavForm> list = new ArrayList<NavForm>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("navListForm");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, emp);
			pstmt.setInt(2, emp);
			pstmt.setString(3, "%"+emp+"%");
			pstmt.setInt(4, emp);
			pstmt.setInt(5, emp);
			pstmt.setInt(6, emp);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				NavForm f = new NavForm();
				
				f.setName(rset.getString("NAME"));
				f.setDate(rset.getDate("FDATE"));
				f.setProcess(rset.getString("PROCESS"));
				f.setTitle(rset.getString("TITLE"));
				f.setImg(rset.getString("IMG"));
				f.setFno(rset.getInt("FNO"));
				
				list.add(f);
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