package semi.intranet.child.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import semi.intranet.child.model.vo.Child;
import static semi.common.JDBCTemplate.*;

public class ChildDao {
	
	private Properties prop = new Properties();
	String url = "/intranet/config/Child.properties";
	
	public ChildDao() {
		try {
			prop.load(new FileReader(url));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertChild(Child c, Connection con) {
		int result  = 0;
		PreparedStatement pstmt = null;
		String sql  = prop.getProperty("insertChild");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			result = pstmt.executeUpdate();
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
