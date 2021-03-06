package semi.home.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import semi.home.jsp.model.vo.Member;
import semi.home.qna.model.dao.QnaDao;
import semi.home.qna.model.vo.QnA;
import static semi.common.JDBCTemplate.*;

public class QnaService {
	private QnaDao qd = new QnaDao();



	/**문의 작성
	 * @param qna
	 * @return
	 */
	public int insertQna(QnA qna) {
		Connection con = getConnection();
		
		int result = qd.insertQna(con,qna);
		
		if(result > 0) commit(con);
		else rollback(con);
			
		return result;
	}

	public ArrayList<QnA> listQna(Member m) {
		Connection con = getConnection();
		
		ArrayList<QnA> list = qd.listQna(con, m);
		
		close(con);

		return list;
	}


}
