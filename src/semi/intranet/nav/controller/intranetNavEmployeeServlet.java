package semi.intranet.nav.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import semi.home.jsp.model.vo.Member;
import semi.intranet.nav.model.dao.IntranetNavService;
import semi.intranet.nav.model.vo.NavEmployeeInfo;

/**
 * Servlet implementation class intranetNavEmployeeServlet
 */
@WebServlet("/iNavEmployee.in")
public class intranetNavEmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public intranetNavEmployeeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		int empNo = Integer.parseInt(m.getUserId());
		
		NavEmployeeInfo info = new IntranetNavService().getTClass(empNo);
		
				
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("info", info);
		
		new Gson().toJson(hmap, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
