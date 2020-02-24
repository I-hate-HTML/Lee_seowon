package semi.intranet.form.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;

import semi.intranet.form.model.dao.FormDao;
import semi.intranet.form.model.vo.Form;
import semi.intranet.form.model.vo.SignList;

public class FormService {

	private FormDao fd = new FormDao();

	/**
	 * 결재자 리스트 불러오기 용 --> 사용
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
	 * 품의서 작성용 --> 사용
	 * @param f
	 * @param signIdArr 
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
	 * 품의서 게시판 진행중인 품의글 목록 불러오기 + 페이징 처리 --> 사용
	 * @param empNum 
	 * @param limitContent 
	 * @param currentPage 
	 * @return
	 */
	public ArrayList<Form> listForm(int empNum, int currentPage, int limitContent) {

		Connection con = getConnection();

		ArrayList<Form> list = fd.listForm(con, empNum, currentPage, limitContent);

		close(con);
		
		Form f = new Form();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getFcategory() == 1) {
				f = list.get(i);
				f.setCategory("지출결의서");
				list.set(i, f);
			} else if(list.get(i).getFcategory() == 2) {
				f = list.get(i);
				f.setCategory("휴가신청서");
				list.set(i, f);
			} else if(list.get(i).getFcategory() == 3) {
				f = list.get(i);
				f.setCategory("교구신청서");
				list.set(i, f);
			} else {
				f = list.get(i);
				f.setCategory("기타");
				list.set(i, f);
			}
			
			
		}
		

		return list;
	}
	
	/**
	 * 품의서 게시판 내 품의글 목록 불러오기 + 페이징 처리 --> 사용
	 * @param empNo
	 * @param currentPage
	 * @param limitContent
	 * @return
	 */
	public ArrayList<Form> myListForm(int empNo, int currentPage, int limitContent) {
		
		Connection con = getConnection();

		ArrayList<Form> list = fd.myListForm(con, empNo, currentPage, limitContent);

		close(con);
		
		Form f = new Form();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getFcategory() == 1) {
				f = list.get(i);
				f.setCategory("지출결의서");
				list.set(i, f);
			} else if(list.get(i).getFcategory() == 2) {
				f = list.get(i);
				f.setCategory("휴가신청서");
				list.set(i, f);
			} else if(list.get(i).getFcategory() == 3) {
				f = list.get(i);
				f.setCategory("교구신청서");
				list.set(i, f);
			} else {
				f = list.get(i);
				f.setCategory("기타");
				list.set(i, f);
			}
			
			
		}

		return list;
	}
	
	
	
	/**
	 * 품의서 게시판 완료된 품의글 목록 불러오기 + 페이징 처리 --> 사용
	 * @param empNo
	 * @param currentPage
	 * @param limitContent
	 * @return
	 */
	public ArrayList<Form> FinListForm(int empNo, int currentPage, int limitContent) {
		
		Connection con = getConnection();

		ArrayList<Form> list = fd.finListForm(con, empNo, currentPage, limitContent);

		close(con);
		
		Form f = new Form();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getFcategory() == 1) {
				f = list.get(i);
				f.setCategory("지출결의서");
				list.set(i, f);
			} else if(list.get(i).getFcategory() == 2) {
				f = list.get(i);
				f.setCategory("휴가신청서");
				list.set(i, f);
			} else if(list.get(i).getFcategory() == 3) {
				f = list.get(i);
				f.setCategory("교구신청서");
				list.set(i, f);
			} else {
				f = list.get(i);
				f.setCategory("기타");
				list.set(i, f);
			}
			
			
		}

		return list;
	}

	
	
	/**
	 * 총 게시글 확인 --> 사용
	 * @param query 
	 * @param empNo 
	 * @return
	 */
	public int getListCount(int chk) {

		Connection con = getConnection();

		int listCount = fd.getListCount(con, chk);

		close(con);

		return listCount;
	}
	
	
	/**
	 * 내가 쓴 품의 총 게시글 확인 --> 사용
	 * @param empNo
	 * @return
	 */
	public int getMyListCount(int empNo) {
		
		Connection con = getConnection();

		int listCount = fd.getMyListCount(con, empNo);

		close(con);

		return listCount;
	}

	/**
	 * 품의서 읽기 --> 확인
	 * @param fno
	 * @return
	 */
	public Form readForm(int fno) {

		Connection con = getConnection();

		Form f = fd.readForm(con, fno);
		
		if(f.getFcategory() == 1) {
			f.setCategory("지출결의서");
		} else if(f.getFcategory() == 2) {
			f.setCategory("휴가신청서");
		} else if(f.getFcategory() == 3) {
			f.setCategory("교구신청서");
		} else {
			f.setCategory("기타");
		}

		close(con);

		return f;
	}

	
	/**
	 * 결재자 품의 업데이트 --> 사용
	 * @param fno
	 * @param reason 
	 * @param process 
	 * @param signArr
	 * @return
	 */
	public int updateSign(int fno, String yn, String reason, String process) {
		
		Connection con = getConnection();

		// 1. 저장되어있는 결재 내용 가져오기
		SignList pre = fd.getSignContent(con, fno);
		
		// 2. 기존 결재 내용에 새로운 결재 내용 붙이기
		String newMsg = null;
		String newYn = null;
		
		if(pre.getSmsg() != null) {
			newMsg = pre.getSmsg()+reason;
		} else {
			newMsg = reason;
		}
		
		if(pre.getSyn() != null) {
			newYn = pre.getSyn()+yn;
		} else {
			newYn = yn;
		}
		
				
		// 3. 새로운 결재내용 저장
		int result = 0;
		if(process == "반려" || process == "승인") {
			result = fd.updateSign(con, fno, newYn, newMsg, process, "Y");
		} else {
			result = fd.updateSign(con, fno, newYn, newMsg, process, "N");
		}
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	
	

	/**
	 * 품의서 삭제용 --> 사용
	 * @param fno
	 * @param eno 
	 * @return
	 */
	public int deleteForm(int fno, int eno) {
		
		Connection con = getConnection();
		
		int result = fd.deleteForm(con, fno, eno);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		
		return result;
	}

	/**
	 * 결재자 ID 정렬 --> 사용
	 * @param signList
	 * @return
	 */
	public String signListSort(String signList) {
				
		String[] sort = signList.split(",");
		
		String list="";
		
		
		// 3. 결재자 정렬 --> 낮은 연차순
		
		Arrays.sort(sort, Collections.reverseOrder());
			
		for(String a : sort) {
			
			list += a + ",";
			
		}
		
		return list;
	}

	/**
	 * READ용 결재자 리스트 가져오기 --> 사용
	 * @param list
	 * @param msg 
	 * @param yn 
	 * @param len 
	 * @return
	 */
	public ArrayList<SignList> getSignSelect(String list, String yn, String msg) {
		
		
		Connection con = getConnection();

		ArrayList<SignList> SignList = fd.getSignSelect(con, list);
		
		
		// 결재 유무 넣기
		if(yn != null) {
			
			SignList a = new SignList();
			
			String[] ynList = yn.split(",");
			
			
			for(int i = 0; i < ynList.length; i++) {
				SignList.get(i).setSyn(ynList[i]);
			}
		} 
		
		// 결재 메시지 넣기
		if(msg != null) {
			
			SignList a = new SignList();
			
			String[] msgList = msg.split(",");
			
			for(int i = 0; i < msgList.length; i++) {				
				SignList.get(i).setSmsg(msgList[i]);
			}
		}
		
		close(con);
		
		return SignList;
	}


	


	

	

	



}
