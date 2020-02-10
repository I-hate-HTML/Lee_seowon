package semi.intranet.form.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import semi.intranet.form.model.dao.FormDao;
import semi.intranet.form.model.vo.Form;
import semi.intranet.form.model.vo.SignList;

public class FormService {
	
	private FormDao fd = new FormDao();

	/**
	 * 결재자 리스트 불러오기 용
	 * @param empNo
	 * @return
	 */
	public ArrayList<SignList> getSignList(int empNo) {
				
		Connection con = getConnection();
		
		ArrayList<SignList> list = fd.getSignList(con, empNo);
		
		close(con);
		
		return list;
	}

	/**
	 * 품의서 작성용
	 * @param f
	 * @return
	 */
	public int insertForm(Form f) {
		
		Connection con = getConnection();
		
		int result = fd.insertForm(con, f);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/**
	 * 품의서 게시판 목록 불러오기 + 페이징 처리
	 * @param empNum 
	 * @param limitContent 
	 * @param currentPage 
	 * @return
	 */
	public ArrayList<Form> listForm(int empNum, int currentPage, int limitContent) {
		
		Connection con = getConnection();
		
		ArrayList<Form> list = fd.listForm(con, empNum, currentPage, limitContent);
		
		close(con);
		
		
		return list;
	}

	/**
	 * 총 게시글 확인
	 * @return
	 */
	public int getListCount() {
		
	Connection con = getConnection();
	
	int listCount = fd.getListCount(con);
	
	close(con);
	
		return listCount;
	}

	/**
	 * 품의서 읽기
	 * @param fno
	 * @return
	 */
	public Form readForm(int fno) {
		
		Connection con = getConnection();
		
		Form f = fd.readForm(con, fno);
		
		close(con);
		
		return f;
	}

	/**
	 * 품의서 수정할 내용 불러오기
	 * @param fno
	 * @return
	 */
	public Form modifyViewForm(int fno) {
		
		Connection con = getConnection();
		
		Form f = fd.modifyViewForm(con, fno);
		
		close(con);

		
		return f;
	}

	
	
	
	
	
	
	
	
	
	
	
}
