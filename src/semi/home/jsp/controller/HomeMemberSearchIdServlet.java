package semi.home.jsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.jsp.model.exception.MemberException;
import semi.home.jsp.model.service.HomeMemberService;
import semi.home.jsp.model.vo.Member;

/**
 * Servlet implementation class HomeMemberSearchIdServlet
 */
@WebServlet("/searchId")
public class HomeMemberSearchIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeMemberSearchIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cname = request.getParameter("cname");
		String email = request.getParameter("email");
		
		Member m = new Member(cname,email);
		
	
		HomeMemberService hms = new HomeMemberService();
		String page ="";
		try{
			page = "views/homepage/login_searchId_Fin.jsp";
			m = hms.searchId(m);
			System.out.println("아이디 찾기 완료!!");
			request.setAttribute("member", m);
			
		} catch(MemberException e) {
			page = "views/homepage/common/errorPage.jsp";
			request.setAttribute("error", "아이디 찾기중 오류 발생!!");
			request.setAttribute("exception", e);
		}
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
