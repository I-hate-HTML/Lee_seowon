package semi.intranet.member.model.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.intranet.alimjang.model.service.AlimService;

/**
 * Servlet implementation class IntranetMemberAcceptServlet
 */
@WebServlet("/approve.member")
public class IntranetMemberAcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntranetMemberAcceptServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		int empNo = 2015001; // 나중에 수정할 것!!
		
		String read = request.getParameter("result");
		int ano = Integer.parseInt(request.getParameter("ano"));
		int category = Integer.parseInt(request.getParameter("category"));
		
		
		int result = new AlimService().readAlimCheck(empNo, read, ano, category);
		
		new Gson().toJson(result, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
