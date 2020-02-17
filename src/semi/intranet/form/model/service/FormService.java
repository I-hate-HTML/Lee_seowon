package semi.intranet.form.model.service;

import static semi.common.JDBCTemplate.close;
import static semi.common.JDBCTemplate.commit;
import static semi.common.JDBCTemplate.getConnection;
import static semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

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
	 * 결재자 정보 가져오기
	 * @param signIdArr
	 * @return
	 */
	public SignList 
	findSignId(String[] signIdArr) {

		Connection con = getConnection();

		// 1. String[] 배열 형변환하기
		int signId1 = Integer.parseInt(signIdArr[0]);
		int signId2 = Integer.parseInt(signIdArr[1]);
		int signId3 = Integer.parseInt(signIdArr[2]);

		// 2. Dao로 보내서 해당 결재자 정보 가져오기
		ArrayList<SignList> sInfo = fd.findSignId(con, signId1, signId2, signId3);


		close(con);
		
		
		// 3. 결재자 정렬 --> 직급순 & ID 순
		Collections.sort(sInfo, new Comparator<SignList>() {

			@Override
			public int compare(SignList sInfo1, SignList sInfo2) {
				if(sInfo1.getSposition() > sInfo2.getSposition()) {
					return 1;
				} else if (sInfo1.getSposition() < sInfo2.getSposition()){
					return -1;
				} else if(sInfo1.getSposition() == sInfo2.getSposition()) {
					if(sInfo1.getScode() > sInfo2.getScode()) {
						return -1;
					} else if(sInfo1.getScode() < sInfo2.getScode()) {
						return 1;
					}
				}
				return 0;
			}
		});

		
		// 4. SignList 로 변환
		SignList s = new SignList();


		s.setSname(sInfo.get(0).getSname());
		s.setScode(sInfo.get(0).getScode()); 
		s.setSname2(sInfo.get(1).getSname()); 
		s.setScode2(sInfo.get(1).getScode()); 
		s.setSname3(sInfo.get(2).getSname()); 
		s.setScode3(sInfo.get(2).getScode());
		

		return s;
	}



	/**
	 * 품의서 작성용
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
	
	public ArrayList<Form> listAjax(int empNo) {
		
		Connection con = getConnection();

		ArrayList<Form> list = fd.listAjax(con, empNo);

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
	 * 품의서 수정할 내용 불러오기
	 * @param fno
	 * @param eno 
	 * @return
	 */
	public Form modifyViewForm(int fno, int eno) {

		Connection con = getConnection();

		Form f = fd.modifyViewForm(con, fno, eno);
		
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
	 * 결재자 품의 업데이트
	 * @param fno
	 * @param signArr
	 * @param fReturn
	 * @return
	 */
	public int updateSign(int fno, String sign1, String sign2, String sign3, String fReturn) {
		
		Connection con = getConnection();

		
		int result = fd.updateSign(con, fno, sign1, sign2, sign3, fReturn);
		
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	/**
	 * 품의서 삭제용
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














}
