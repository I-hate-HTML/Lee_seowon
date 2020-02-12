package semi.home.alimjang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.alimjang.model.service.AlimjangService;
import semi.home.alimjang.model.vo.AlimNote;
import semi.home.jsp.model.vo.Member;

/**
 * Servlet implementation class AlimNoteInsertServlet
 */
@WebServlet("/anInsert.al")
public class AlimNoteInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlimNoteInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");		
		
		
		String al_content = request.getParameter("al_content");
		String al_feel = request.getParameter("al_feel");
		String al_health = request.getParameter("al_health");
		String al_temp = request.getParameter("al_temp");
		String al_meal = request.getParameter("al_meal");
		String al_sleep = request.getParameter("al_sleep");
		String al_poop = request.getParameter("al_poop");		
		
		AlimNote an = new AlimNote();
		
		an.setAl_content(al_content);
		an.setAl_feel(al_feel);
		an.setAl_health(al_health);
		an.setAl_temp(al_temp);
		an.setAl_meal(al_meal);
		an.setAl_sleep(al_sleep);
		an.setAl_poop(al_poop);
//		an.setAl_writer(m.getUserId());
		
		System.out.println(an);
		
		int result = new AlimjangService().insertAlimNote(m, an);
		
		if(result > 0) {
			// 알림장 등록완료
			response.sendRedirect("views/homepage/homeindex.jsp");
			// 등록 완료 페이지 올릴까 말까
		}else {
			// 알림장 등록 실패
			request.setAttribute("msg", "알림장 등록 실패");			
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
