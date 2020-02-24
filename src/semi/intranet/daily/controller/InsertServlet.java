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
 * Servlet implementation class DailyInsertServlet
 */
@WebServlet("/dWrite.da")
public class InsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DailyService ds = new DailyService();
		
		// 파일 처리용 서블릿
		// 전송할 최대 크기
		int maxSize = 1024 * 1024 * 30;
		
		// multipart/form-data형식으로 전송되었는지 확인!
		if(!ServletFileUpload.isMultipartContent(request)) {
			// 올바른 형식으로 전송되지 않았을 경우
			// 콘솔창에 띄우기
			System.out.println("파일 전송 오류");
		}
		
		// 웹상의 루트 경로를 활용하여 저장할 폴더 위치 지정
		String root = request.getServletContext().getRealPath("/");
		
		// 게시판의 첨부파일을 저장할 폴더 이름 지정하기
		String savePath = root + "resources/intranet/uploadFiles/DailyFile";

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
			
		// 파일 업로드 실시
		// 기본 전송값 처리하기
		int category = Integer.parseInt(mrequest.getParameter("category"));
		String title = mrequest.getParameter("subject");
		int writerCode = Integer.parseInt(mrequest.getParameter("writerId"));
		// 선생님 이름 가져오기
		String writer = ds.dailyWriterName(writerCode);
		// 선생님 담당반 가져오기
		int writerClass = ds.dailyClass(writerCode);
		String content = mrequest.getParameter("content");
		
		// 전달받은 파일을 먼저 저장하고, 그 파일의 이름을 가져오는 메소드를 실행한다.
		String bfile = mrequest.getFilesystemName("file");
		
		
		Daily b = new Daily(writerClass, title, content, writer, category, bfile, writerCode);
		
		
		System.out.println(b.toString());
		
		
		int result = ds.dailyInsert(b);		
		
		if(result > 0) {
			if(category == 1) { // 공지사항
				response.sendRedirect("nList.da");						
			} else if (category == 2) { // 교육일지
				response.sendRedirect("dList.da");	
			}
			
			
		} else {
			String page = "views/intranet/common/intranetError.jsp";
			request.setAttribute("msg", "해당 글을 등록 할 수 없습니다.");
			request.getRequestDispatcher(page).forward(request, response);
			
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
