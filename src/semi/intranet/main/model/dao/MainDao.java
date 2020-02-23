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

import semi.intranet.main.model.vo.MainAlim;
import semi.intranet.main.model.vo.MainDraft;

public class MainDao {
	private Properties prop = new Properties();
	String url=MainDao.class.getResource("/config/intranetMain.properties").getPath();
	
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
		System.out.println("aa5");
		ArrayList<MainAlim> ae = new ArrayList<MainAlim>();
		MainAlim m = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("alimlist");
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			System.out.println(rset);
			while(rset.next()) {
				m = new MainAlim();
				m.setAlimtype("알림");
				m.setChildname(rset.getInt(3));
				m.setTitle(rset.getString(4));
				m.setWriter(rset.getString(11));
				m.setDate(rset.getDate(12));
			
				
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
		
		String sql = prop.getProperty("pumlist");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(sql);
			
			while(rset.next()) {
				m = new MainDraft();
				m.setType(rset.getInt(2));
				m.setNow(rset.getString(12));
				m.setTitle(rset.getString(8));
				m.setUser(rset.getInt(3));
				m.setDate(rset.getDate(4));
				System.out.println("tlqkftlqkf");
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






