package semi.intranet.daily.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.daily.model.service.DailyService;
import semi.intranet.daily.model.vo.Daily;

/**
 * Servlet implementation class DeleteServletNotice
 */
@WebServlet("/nDelete.da")
public class NoticeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int category = 1;
		
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		Daily d = new Daily();
		
		int result = new DailyService().dailyDelete(dno, category);
		
		if(result > 0) {
			response.sendRedirect("nList.da");
		} else {
			String page = "views/intranet/common/intranetError.jsp";
			
			request.setAttribute("msg", "글을 삭제할 수 없습니다.");
			request.getRequestDispatcher(page).forward(request, response);
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
