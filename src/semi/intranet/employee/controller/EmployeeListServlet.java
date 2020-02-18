package semi.intranet.employee.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import semi.intranet.employee.model.service.EmployeeService;
import semi.intranet.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeListServlet
 */
@WebServlet("/empCall.do")
public class EmployeeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmployeeService es = new EmployeeService();
		List<Employee> ae = new ArrayList<>();
		
		ae = es.emplistAll();
		
		JSONObject empInfo = null;
		JSONArray result = new JSONArray();
		
		for(Employee emp : ae) {
			empInfo = new JSONObject();
			
			empInfo.put("empCode", emp.getEmpCode());
			empInfo.put("empJob", emp.getEmpJob());
			empInfo.put("empName", emp.getEmpName());
			empInfo.put("empPhone", emp.getEmpPhone());
			empInfo.put("hireDate", emp.getHireDate());
			empInfo.put("entDate", emp.getEntDate());
			empInfo.put("empClass", emp.getEmpClass());
			empInfo.put("hobong", emp.getHobong());
			empInfo.put("entYN", emp.getEntYN()==1?"Y":"N");
			
			result.add(empInfo);
		}
		
		response.getWriter().print(result.toJSONString());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
