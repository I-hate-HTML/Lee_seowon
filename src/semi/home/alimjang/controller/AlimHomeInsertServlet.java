package semi.home.alimjang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.alimjang.model.service.AlimjangService;
import semi.home.alimjang.model.vo.AlimHome;
import semi.home.jsp.model.vo.Member;

/**
 * Servlet implementation class AlimHomeInsertServlet
 */
@WebServlet("/ahInsert.al")
public class AlimHomeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlimHomeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		String alhm_wayhome = request.getParameter("alhm_wayhome");
		String alhm_time= request.getParameter("alhm_time");
		String alhm_status = request.getParameter("alhm_status");
		String alhm_phone = request.getParameter("alhm_phone");
		String alhm_status2 = request.getParameter("alhm_status2");
		String alhm_phone2 = request.getParameter("alhm_phone2");
		
		AlimHome ah = new AlimHome();
		
		ah.setAlhm_wayhome(alhm_wayhome);
		ah.setAlhm_time(alhm_time);
		ah.setAlhm_status(alhm_status);
		ah.setAlhm_phone(alhm_phone);
		ah.setAlhm_status2(alhm_status2);
		ah.setAlhm_phone2(alhm_phone2);
//		ah.setAlhm_writer(m.getUserId());
		
		System.out.println(ah);
		
		int result = new AlimjangService().insertAlimHome(m, ah);
		
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
