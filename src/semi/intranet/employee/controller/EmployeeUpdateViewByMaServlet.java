package semi.intranet.employee.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.intranet.employee.model.service.EmployeeService;
import semi.intranet.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeUpdateViewByMaServlet
 */
@WebServlet("/empUpdateView")
public class EmployeeUpdateViewByMaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeUpdateViewByMaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
/*		ArrayList<Employee> list = new ArrayList<Employee>();

		EmployeeService es = new EmployeeService();
		
		list = es.updateViewShowingByMa();
		String page = "";
		
		if(list != null) {
			page = "views/intranet/intranetEdit.jsp";
			request.setAttribute("employee", list);
		}else {
			page = "views/intranet/intranetEdit.jsp";
			request.setAttribute("msg", "불러오기 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		*/
		response.setContentType("application/json; charset=UTF-8"); 
		
		EmployeeService es = new EmployeeService();
		List<Employee> ae = new ArrayList<>();
		
		
		ae = es.emplistAll();
		System.out.println(ae);
		String json = new Gson().toJson(ae);
		System.out.println(json);
		
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
