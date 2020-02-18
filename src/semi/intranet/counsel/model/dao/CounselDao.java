package semi.intranet.counsel.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.util.Properties;



	public class CounselDao {

	private Properties prop;
	
	public CounselDao() {
		prop = new Properties();
		
		String filePath = Notice.class.getResource("/config/intranetCounsel-query.properties").getPath();
		
		try {
			prop.load(new FileReader(filePath));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int deleteCounsel(Connection con, int cno) {
		// TODO Auto-generated method stub
		return 0;
	}

}
