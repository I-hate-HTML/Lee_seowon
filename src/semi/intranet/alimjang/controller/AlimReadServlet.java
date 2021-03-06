package semi.intranet.alimjang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.alimjang.model.vo.AlimHome;
import semi.home.alimjang.model.vo.AlimMedi;
import semi.home.alimjang.model.vo.AlimNote;
import semi.home.jsp.model.vo.Member;
import semi.intranet.alimjang.model.service.AlimService;
import semi.intranet.alimjang.model.vo.Alim;

/**
 * Servlet implementation class AlimReadServlet
 */
@WebServlet("/aRead.al")
public class AlimReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlimReadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		int empNo = Integer.parseInt(m.getUserId());
		
		int ano = Integer.parseInt(request.getParameter("ano"));
		int category = Integer.parseInt(request.getParameter("category"));
		
		String page = "";
		
		if(category == 1) { // 아이 알림장
			
			
			AlimNote a = new AlimNote();
			Alim b = new Alim();
			
			a = new AlimService().readAlimNote(empNo, ano);
			b = new AlimService().readAlimCommon(empNo, ano, category);
			
			page = "views/intranet/intranetAlimReadNote.jsp";
			request.setAttribute("a", a);
			request.setAttribute("b", b);
			
		} else if(category == 2) { // 귀가 통지서
			
			AlimHome a = new AlimHome();
			Alim b = new Alim();
			
			a = new AlimService().readAlimHome(empNo, ano);
			b = new AlimService().readAlimCommon(empNo, ano, category);
			
			page = "views/intranet/intranetAlimReadHome.jsp";
			request.setAttribute("a", a);
			request.setAttribute("b", b);
			
		} else if(category == 3) { // 투약 통지서
			
			AlimMedi a = new AlimMedi();
			Alim b = new Alim();
			
			a = new AlimService().readAlimMedi(empNo, ano);
			b = new AlimService().readAlimCommon(empNo, ano, category);

			page = "views/intranet/intranetAlimReadMedi.jsp";
			request.setAttribute("a", a);
			request.setAttribute("b", b);
			
		} else {
				 
			page = "views/intranet/common/intranetError.jsp";
			request.setAttribute("msg", "게시글을 가져올 수 없습니다.");

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
