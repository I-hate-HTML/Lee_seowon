package semi.intranet.child.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.intranet.child.model.service.ChildService;
import semi.intranet.child.model.vo.Child;
import semi.intranet.employee.model.service.EmployeeService;
import semi.intranet.employee.model.vo.Employee;

/**
 * Servlet implementation class ChildInsertServlet
 */
@WebServlet("/Cinsert.ch")
public class ChildInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChildInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int maxSize = 1024 * 1024 * 10;


		String root = request.getServletContext().getRealPath("/");

		// 게시판의 첨부파일을 저장할 폴더 이름 지정하기
		String savePath = root + "resources/intranet/image";

		MultipartRequest mrequest = new MultipartRequest(
				request, // 변경하기 위한 원본 객체
				savePath, // 파일 저장 경로
				maxSize,  // 저장할 파일의 최대 크기
				"UTF-8", // 저장할 문자셋 설정
				new DefaultFileRenamePolicy()
				// 만약 동일한 이름의 
				// 파일을 저장했을 경우
				// 기존의 파일과 구분하기 위해
				// 새로운 파일명 뒤에 숫자를 붙이는 규칙
				);

		

		
		String name = mrequest.getParameter("stuname");
		String gender = mrequest.getParameter("stugen");
		String stuno = mrequest.getParameter("stuno1")+"-"+mrequest.getParameter("stuno2");
		String birth = mrequest.getParameter("stubirth");
		String entdate = mrequest.getParameter("stuent");
		String stuaddr = mrequest.getParameter("stuaddr1")+" "+mrequest.getParameter("stuaddr2")+" "+mrequest.getParameter("stuaddr3");
		int age = Integer.parseInt(mrequest.getParameter("stuage"));
		String state = mrequest.getParameter("stustate");
		String stuclass= mrequest.getParameter("stuClass");
		String stuimg = mrequest.getFilesystemName("stuimg");


		Child ch = new Child(name,gender,stuno,birth,entdate,stuaddr,age,state,stuclass,stuimg);



		ChildService cs = new ChildService();

		int result = cs.insertChild(ch);

		if(result > 0) {
			response.sendRedirect("views/intranet/intranetRegisterStudent.jsp");
		}else {
			request.setAttribute("msg", "게시글 작성 실패!");
			request.getRequestDispatcher("views/intranet/intranetRegisterStudent.jsp")
			.forward(request, response);
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
