package semi.intranet.daily.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.intranet.daily.model.service.DailyService;
import semi.intranet.daily.model.vo.Daily;

/**
 * Servlet implementation class ModifyServletDaily
 */
@WebServlet("/dModifySave.da")
public class ModifySaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifySaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파일 처리용 서블릿
		// 전송할 최대 크기
		int maxSize = 1024 * 1024 * 10;
		
		// multipart/form-data형식으로 전송되었는지 확인!
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 올바른 형식으로 전송되지 않았을 경우
			// 콘솔창에 띄우기
			System.out.println("파일 전송 오류");
		}
		
		// 웹상의 루트 경로를 활용하여 저장할 폴더 위치 지정
		String root = request.getServletContext().getRealPath("/");
		
		// 게시판의 첨부파일을 저장할 폴더 이름 지정하기
		String savePath = root + "resources/intranet/uploadFiles/Daily";

		// 실제 담아온 파일 기타 정보들을 활용하여 MultipartRequest 생성하기
		MultipartRequest mrequest = new MultipartRequest(
											request, 	// 변경하기 위한 원본 객체
											savePath, 	// 파일 저장 경로
											maxSize,  	// 저장할 파일의 최대 크기
											"UTF-8",	// 저장할 문자셋 설정
											new DefaultFileRenamePolicy()
														// 만약 동일한 이름의
														// 파일을 저장했을 경우
											
														// 기존의 파일과 구분하기 위해
														// 새로운 파일명 뒤에 숫자를 붙이는 규칙
				);
		
		
		int category = Integer.parseInt(mrequest.getParameter("category"));		
		int dno = Integer.parseInt(mrequest.getParameter("dno"));
		
		String writer = mrequest.getParameter("writer");
		int writerCode = Integer.parseInt(mrequest.getParameter("writerId"));
		String title = mrequest.getParameter("subject");
		String content = mrequest.getParameter("content");
		
		String file = mrequest.getFilesystemName("file");

		
		DailyService ds = new DailyService();
		
		Daily d = new Daily(title, content, writer, category, file, writerCode);
		
		
		int result = ds.dailyModifySave(dno, d);
			
		if(result > 0) {
			if(category == 1) { // 공지사항
				response.sendRedirect("nList.da");						
			} else if (category == 2) { // 교육일지
				response.sendRedirect("dList.da");	
			}
			
			
		} else {
			request.setAttribute("msg", "게시글 작성 실패!");
			request.getRequestDispatcher("").forward(request, response);;
			
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
