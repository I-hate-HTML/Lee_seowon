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
 * Servlet implementation class HomeMemberInsertServlet
 */
@WebServlet("/homeinsert")
public class HomeMemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeMemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String address = request.getParameter("addrNo")+", "
						+request.getParameter("addr1")+", "
						+request.getParameter("addr2");
		
		String cname = request.getParameter("cname");
		String cgender = request.getParameter("cgender");
		int cclass = Integer.parseInt(request.getParameter("cclass"));
		String cbdate = request.getParameter("cbdate");
		
		Date writerDate = null;
		
		String [] dateArr = cbdate.split("-"); 
		int [] intArr = new int[dateArr.length];
		
		for(int i=0; i<dateArr.length;i++) {
			intArr[i] = Integer.parseInt(dateArr[i]);
		}
		
		writerDate = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		
		Member m = new Member(userId,userPwd,userName,gender,email,phone,address,cname,writerDate,cgender,cclass);
		
		System.out.println("가입 회원 정보 확인 : " + m);
		
		HomeMemberService hms = new HomeMemberService();
		
		
		try {
		 hms.homeMemberInsert(m);
		 System.out.println("회원 가입 완료!");	
		 
		 response.sendRedirect("views/homepage/join_Fin.jsp");
		} catch(MemberException e) {
			request.setAttribute("error", "회원가입실패!!");
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
