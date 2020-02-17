package semi.intranet.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.intranet.employee.model.exception.EmployeeException;
import semi.intranet.employee.model.service.EmployeeService;
import semi.intranet.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeEditServlet
 */
@WebServlet("/empEdit.em")
public class EmployeeEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 회원 정보 수정용 데이터 꺼내오기
		String pwd = request.getParameter("userPwd");
		String email = request.getParameter("email");
		String phone1 = request.getParameter("tel1") + "-"
			     + request.getParameter("tel2") + "-"
			     + request.getParameter("tel3");
		/*String phone2 = request.getParameter("tel1") + "-"
				+ request.getParameter("tel2") + "-"
				+ request.getParameter("tel3");*/
		String address = request.getParameter("zipCode") + ", "
			       + request.getParameter("address1") + ", "
			       + request.getParameter("address2");
		
		// 해당 회원을 구분짓는 ID 받아오기
		HttpSession session = request.getSession(false);
		
		Employee e = (Employee)session.getAttribute("employee");
		
		// 기존의 회원정보를 새로운 값으로 변경하기
		e.setUserPwd(pwd);
		e.setEmail(email);
		e.setPhone1(phone);
		/*e.setPhone2(phone);*/
		e.setAddress(address);
		
		
		System.out.println("변경한 회원 정보 확인 : " + e);
		
		EmployeeService es = new EmployeeService();
		
		try {
			es.updateEmployee(e);
			System.out.println("회원 정보 수정 완료!");
			
			response.sendRedirect("index.jsp");
			
		} catch (EmployeeException e) {
		
			request.setAttribute("msg", "회원정보 수정 중 에러 발생!");
			request.setAttribute("exception", e);
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
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
