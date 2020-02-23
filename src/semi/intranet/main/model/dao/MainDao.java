package semi.intranet.main.model.dao;

import static semi.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import semi.intranet.child.model.dao.ChildDao;
import semi.intranet.main.model.vo.MainAlim;
import semi.intranet.main.model.vo.MainDraft;

public class MainDao {
	private Properties prop = new Properties();
	String url=ChildDao.class.getResource("/config/intranetMain.properties").getPath();
	
	public MainDao() {
		try {
			prop.load(new FileReader(url));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<MainAlim> alimlist(Connection con) {
		ArrayList<MainAlim> ae = new ArrayList<MainAlim>();
		MainAlim m = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("alimlist");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				m = new MainAlim();
				System.out.println(rset);
				m.setAlimtype("알림");
				m.setChildname(rset.getInt("CNO"));
				m.setTitle(rset.getString("AL_CONTENT"));
				m.setWriter(rset.getString("AL_WRITER"));
				m.setDate(rset.getDate("AL_DATE"));
				ae.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(con);
		}
		return ae;
	}

	public ArrayList<MainDraft> draftlist(Connection con) {
		ArrayList<MainDraft> ae = new ArrayList<MainDraft>();
		MainDraft m = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("alimlist");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				m = new MainDraft();
				System.out.println(rset);
				m.setType(rset.getInt("DRAFT_TYPE"));
				m.setNow(rset.getString("DRAFT_CHK"));
				m.setTitle(rset.getString("DRAFT_TITLE"));
				m.setUser(rset.getInt("DRAFT_EMP"));
				m.setDate(rset.getDate("DRAFT_DATE"));
				ae.add(m);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(con);
		}
		return ae;
	}
}






