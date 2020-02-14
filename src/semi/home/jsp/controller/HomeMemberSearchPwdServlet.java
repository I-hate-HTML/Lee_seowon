package semi.home.jsp.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

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
@WebServlet("/searchPwd")
public class HomeMemberSearchPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeMemberSearchPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String cbdate = request.getParameter("cbdate");
		
		Date writerDate = null;
		
		String [] dateArr = cbdate.split("-"); 
		int [] intArr = new int[dateArr.length];
		
		for(int i=0; i<dateArr.length;i++) {
			intArr[i] = Integer.parseInt(dateArr[i]);
		}
		
		writerDate = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		
		Member m = new Member(userId,writerDate);
		
		
	
		HomeMemberService hms = new HomeMemberService();
		String page ="";
		try{
			page = "views/homepage/login_searchPwd_Fin.jsp";
			int result = hms.searchPwd(m);
			System.out.println("비밀번호 찾기 완료");
			System.out.println(result);
			
			
			request.setAttribute("member", m);
			
		} catch(MemberException e) {
			page = "views/homepage/common/errorPage.jsp";
			request.setAttribute("error", "비밀번호 찾기중 오류 발생!!");
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
