package semi.intranet.child.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.child.model.service.ChildService;
import semi.intranet.employee.model.service.EmployeeService;

/**
 * Servlet implementation class ChildEditServlet
 */
@WebServlet("/editstu.do")
public class ChildEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChildEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("editcode"));
		String state = request.getParameter("editstate");
		String addr = request.getParameter("editaddr");
		String graduate = request.getParameter("editgradu");
		System.out.println(graduate);
		if(graduate != null) {
			System.out.println("재직 중 확인");
			graduate ="1900";
		}else {
			System.out.println("퇴사 여부 확인됨");
			
		}
		
		ChildService cs = new ChildService();
		int result = cs.editChild(code,state,addr,graduate);
		
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
