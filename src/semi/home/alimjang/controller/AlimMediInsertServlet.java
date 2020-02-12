package semi.home.alimjang.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.alimjang.model.service.AlimjangService;
import semi.home.alimjang.model.vo.AlimMedi;
import semi.home.jsp.model.vo.Member;

/**
 * Servlet implementation class AlimMediInsertServlet
 */
@WebServlet("/amInsert.al")
public class AlimMediInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlimMediInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		String almd_con = request.getParameter("almd_con");
		String almd_type = request.getParameter("almd_type");
		String almd_vol = request.getParameter("almd_vol");
		String almd_num = request.getParameter("almd_num");
		String almd_time = request.getParameter("almd_time");
		String almd_temp = request.getParameter("almd_temp");
		String almd_ps = request.getParameter("almd_ps");
		
		AlimMedi am = new AlimMedi();
		
		am.setAlmd_con(almd_con);
		am.setAlmd_type(almd_type);
		am.setAlmd_vol(almd_vol);
		am.setAlmd_num(almd_num);
		am.setAlmd_time(almd_time);
		am.setAlmd_temp(almd_temp);
		am.setAlmd_ps(almd_ps);
		am.setAlmd_writer(m.getUserId());
		
		System.out.println(am);
		
		int result = new AlimjangService().insertAlimMedi(m, am);
		
		if(result > 0) {
			// 알림장 등록완료
			response.sendRedirect("views/homepage/homeindex.jsp");
			// 등록 완료 페이지 올릴까 말까
		}else {
			// 알림장 등록 실패
			request.setAttribute("msg", "알림장 등록 실패");			
			//request.getRequestDispatcher("views/homepage/common/errorPage.jsp").forward(request, response); 에러요놈안대내;;
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
