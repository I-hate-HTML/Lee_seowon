package semi.intranet.employee.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.employee.model.service.EmployeeService;

/**
 * Servlet implementation class EmployeeEditServlet
 */
@WebServlet("/editEmp.em")
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
		int code = Integer.parseInt(request.getParameter("editcode"));
		String phone = request.getParameter("editphone");
		String email = request.getParameter("editemail");
		String addr = request.getParameter("editaddr");
		String enddate = request.getParameter("editentdate");
		System.out.println(enddate);
		if(enddate != null) {
			System.out.println("재직 중 확인");
			enddate ="1998";
		}else {
			System.out.println("퇴사 여부 확인됨");
			
		}
		
		EmployeeService es = new EmployeeService();
		int result = es.editEmployee(code,phone,email,addr,enddate);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
