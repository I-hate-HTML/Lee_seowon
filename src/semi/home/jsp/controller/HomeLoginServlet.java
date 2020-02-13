package semi.home.jsp.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.jsp.model.service.HomeMemberService;
import semi.home.jsp.model.vo.Member;

/**
 * Servlet implementation class HomePgaeLogin
 */
@WebServlet("/homelogin")
public class HomeLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member m = new Member(userId,userPwd);
		System.out.println(m);
		HomeMemberService hms = new HomeMemberService();
		
		m = hms.selectMember(m);
		
		if(m != null) {
		
			System.out.println("홈페이지 로그인 성공!!");
			
			HttpSession session = request.getSession();
			
			session.setAttribute("member", m);
		
			response.sendRedirect("views/homepage/homeindex.jsp");
		
		} else {
			String error = "";
			
			request.setAttribute("error", "아이디랑 비번을 확인해 주세요!");
			request.getRequestDispatcher("index.jsp").forward(request, response);
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
