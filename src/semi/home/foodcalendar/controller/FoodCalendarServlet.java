package semi.home.foodcalendar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FoodCalendarServlet
 */
@WebServlet("/fcalendar.me")
public class FoodCalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FoodCalendarServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024*1024*10;
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			System.out.println("error");
		}
		
		// 3. 웹 상의 루트(최상위 경로) 경로를 활용하여 저장할 폴더의 위치 지정하기
		String root = request.getServletContext().getRealPath("/");
		System.out.println("root : " + root);
		// 게시판의 첨부파일을 저장할 폴더 이름 지정하기
		String savePath = root + "resources/homepage/images/foodimg";
		
		
		// 4. 실제 담아온 파일 기타 정보들을 활요하여
		//    MultipartRequest 생성하기
		//    request -> MultipartRequest
		
		MultipartRequest mrequest = new MultipartRequest(
										request, // 변경하기 위한 원본 객체
										savePath, // 파일 저장 경로
										maxSize,	// 저장할 파일의 최대 크기
										"UTF-8",	// 저장할 문자셋 설정
										new DefaultFileRenamePolicy()
										// 동일한 이름의 파일을 저장했을 경우
										// 기존의 파일과 구분하기 위해
										// 새로운 파일명 뒤에 숫자를 붙이는 규칙				
				);	
		
		
		String fdate = mrequest.getParameter("fooddate");
		String fcalimg = mrequest.getFilesystemName("fcalimg");
		
		System.out.println(fdate);
		System.out.println(fcalimg);
		
		
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
