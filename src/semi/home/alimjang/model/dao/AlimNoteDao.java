package semi.home.alimjang.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import semi.home.alimjang.model.vo.AlimNote;
import semi.home.jsp.model.vo.Member;

import static semi.common.JDBCTemplate.*;

public class AlimNoteDao {
	private Properties prop;
	
	public AlimNoteDao() {
		prop = new Properties();
		
		String filePath = AlimNote.class.getResource("config/alimjang-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

	public int insertAlimNote(Connection con, Member m, AlimNote an) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ALIMNOTE VALUES(SEQ_ALIM.NEXTVAL,1,?,?,?,?,?,?,?,?,?,DEFAULT)";//prop.getProperty("insertAlimNote");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, m.getCno());
			pstmt.setString(2, an.getAl_content());
			pstmt.setString(3, an.getAl_feel());
			pstmt.setString(4, an.getAl_health());
			pstmt.setString(5, an.getAl_temp());
			pstmt.setString(6, an.getAl_meal());
			pstmt.setString(7, an.getAl_sleep());
			pstmt.setString(8, an.getAl_poop());
			pstmt.setString(9, m.getUserId());
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}

	

}
