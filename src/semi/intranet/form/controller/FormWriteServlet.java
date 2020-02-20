package semi.intranet.form.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.intranet.form.model.service.FormService;
import semi.intranet.form.model.vo.Form;
import semi.intranet.form.model.vo.SignList;

/**
 * Servlet implementation class FormWriteServlet
 */
@WebServlet("/fWrite.fo")
public class FormWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FormWriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int maxSize = 1024 * 1024 * 10;

		if(!ServletFileUpload.isMultipartContent(request)) {
			System.out.println("파일 전송 오류");
		}

		String root = request.getServletContext().getRealPath("/");

		String savePath = root + "resources/intranet/uploadFiles/FormFile";

		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",new DefaultFileRenamePolicy());


		String date = mrequest.getParameter("formDate");
		
		Date writeDate = null;
		
		if(date != "" && date != null) {
			// 날짜가 들어오면
			
			// String --> int
			String[] dateArr = date.split("-"); 
			int[] intArr = new int[dateArr.length];
			
			// split한 String 문자들을 생성한 int 배열의 각 인덱스에 각각 대입하기
			
			for(int i = 0; i < dateArr.length; i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}
			
			writeDate = new Date(new GregorianCalendar(
					intArr[0],intArr[1]-1,intArr[2]
					).getTimeInMillis());
			
		} else {
			// 날짜가 들어오지 않으면
			writeDate = new Date(new GregorianCalendar().getTimeInMillis());
			
		}

		int category = Integer.parseInt(mrequest.getParameter("formCategory"));
		String writer = mrequest.getParameter("formName");
		int writerId = Integer.parseInt(mrequest.getParameter("writerId"));
		String title = mrequest.getParameter("formTitle"); 
		String signList = mrequest.getParameter("signList_fin");
		
		// 낮은 연차순으로 정렬
		signList = new FormService().signListSort(signList);
		
		String content = mrequest.getParameter("formContent"); 
		String file = mrequest.getParameter("formFile");
		
		
		Form f = new Form(category, writer, writerId, writeDate, signList, title, content, file);
		
		
		int result = new FormService().insertForm(f);
		
		if(result > 0) {
			response.sendRedirect("fList.fo");
		}

		


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
