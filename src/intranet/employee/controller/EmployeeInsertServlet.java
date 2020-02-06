package intranet.employee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import intranet.employee.model.exception.EmployeeException;
import intranet.employee.model.service.EmployeeService;
import intranet.employee.model.vo.Employee;

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
		String empName = request.getParameter("empName");
		String empJob = request.getParameter("empJob");
		String empNo = request.getParameter("empNo1")+"-"+request.getParameter("empNo2");
		String empPhone = request.getParameter("empPhone1")+"-"
						+request.getParameter("empPhone2")+"-"
						+request.getParameter("empPhone3");
		String empAddr = request.getParameter("empAddr1")+" "+request.getParameter("empAddr2")+" "+request.getParameter("empAddr3");
		String empClass= request.getParameter("empClass");
		
		Employee em = new Employee(empName,empJob,empNo,empPhone,empAddr,empClass);
		
		EmployeeService es = new EmployeeService();
		 
		int result  = es.insertEmployee(em);
		 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
