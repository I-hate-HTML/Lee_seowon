package semi.intranet.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.jsp.model.exception.MemberException;
import semi.home.jsp.model.service.HomeMemberService;
import semi.home.jsp.model.vo.Member;
import semi.intranet.employee.model.exception.EmployeeException;
import semi.intranet.employee.model.service.EmployeeService;
import semi.intranet.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeUpdateMaServlet
 */
@WebServlet("/maUpdate.emp")
public class EmployeeUpdateMaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeUpdateMaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("empEmail");
		String phone = request.getParameter("tel1")+"-"
					+ request.getParameter("tel2")+"-"
					+ request.getParameter("tel3");
		
		String address = request.getParameter("addrNo")+", "
						+ request.getParameter("addr1")+", "
						+ request.getParameter("addr2");
		
		
		HttpSession session = request.getSession(false);
		
		Employee e = (Employee)session.getAttribute("employee");
		
		e.setEmpEmail(email);
		e.setEmpPhone(phone);
		e.setEmpAddr(address);
		
		
		EmployeeService es = new EmployeeService();
		
		try {
			es.updateEmployee(e);
			System.out.println("회원정보 수정 완료!");
			
			response.sendRedirect("views/homepage/homeindex.jsp");
			
		} catch(EmployeeException e) {
			request.setAttribute("error", "회원정보 수정 실패!!");
			request.setAttribute("exception", e);
			request.getRequestDispatcher("views/homepage/common/errorPage.jsp").forward(request, response);
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
