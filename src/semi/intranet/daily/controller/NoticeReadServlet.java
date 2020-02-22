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
 * Servlet implementation class ReadServletNotice
 */
@WebServlet("/nRead.da")
public class NoticeReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeReadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 구별을 위한 카테고리 --> 공지사항 1
		int category = 1;
		
		
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		DailyService ds = new DailyService();
		
		Daily d = ds.selectOne(dno, category);
		
		String page = "";
		
		if(d != null) {
			page = "views/intranet/intranetNoticeRead.jsp";
			request.setAttribute("daily", d);
		} else {
			page = "views/intranet/common/intranetError.jsp";
			request.setAttribute("msg", "공지사항 글을 읽어올 수 없습니다.");
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
