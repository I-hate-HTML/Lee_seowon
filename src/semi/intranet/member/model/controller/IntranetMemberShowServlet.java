package semi.intranet.member.model.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.jsp.model.vo.Member;
import semi.intranet.member.model.service.IntranetMemberService;

/**
 * Servlet implementation class IntranetMemberShowServlet
 */
@WebServlet("/showmem.list")
public class IntranetMemberShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntranetMemberShowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		ArrayList<Member> list = new ArrayList<Member>();
		
		IntranetMemberService ims = new IntranetMemberService();
		
		list = ims.selectList();
		
		String page = "";
		if(list != null) {
			page = "views/intranet/intranetMember.jsp";
			request.setAttribute("Member", list);
		}else {
			page = "views/common/errorPage.jsp";//이거 안 돼있나
			request.setAttribute("msg", "공지사항 상세보기 실패!");
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
