package semi.intranet.employee.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.intranet.employee.model.service.EmployeeService;
import semi.intranet.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeInsertServlet
 */
@WebServlet("/empInsert.em")

public class EmployeeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeInsertServlet() {  
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

		String hiredate = mrequest.getParameter("hireDate");

		
		String empName = mrequest.getParameter("empName");
		String empJob = mrequest.getParameter("empJob");
		String empNo = mrequest.getParameter("empNo1")+"-"+mrequest.getParameter("empNo2");
		String empPhone = mrequest.getParameter("empPhone");
		String empEmail = mrequest.getParameter("empEmail");
		String empAddr = mrequest.getParameter("empAddr1")+" "+mrequest.getParameter("empAddr2")+" "+mrequest.getParameter("empAddr3");
		String empClass= mrequest.getParameter("empClass");
		String empimg = mrequest.getFilesystemName("empimg");


		Employee em = new Employee(empName,empJob,empNo,empPhone,empEmail,empAddr,hiredate,empClass,empimg);



		EmployeeService es = new EmployeeService();

		int result  = es.insertEmployee(em);

		if(result > 0) {
			response.sendRedirect("views/intranet/intranetRegisterTeacher.jsp");
		}else {
			request.setAttribute("msg", "게시글 작성 실패!");
			request.getRequestDispatcher("views/intranet/intranetRegisterTeacher.jsp")
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
