package semi.home.jsp.controller;

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
		HomeMemberService hms = new HomeMemberService();
		
		try {
			m = hms.selectMember(m);
//			회원가입 권환부여 로직 
			if(m.getMstatus().equals("N")) {
				MemberException e = new MemberException("아이디에 권한이 없습니다.");
				request.setAttribute("exception", e);
				request.getRequestDispatcher("views/homepage/common/errorPage.jsp").forward(request, response);
				return;
			}
			System.out.println("홈페이지 로그인 성공!!");
			
			HttpSession session = request.getSession();
			session.setAttribute("member", m);
			response.sendRedirect("views/homepage/homeindex.jsp");
			
		} catch(MemberException e) {
			request.setAttribute("error", "아이디랑 비밀번호를 확인해 주세요!");
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
