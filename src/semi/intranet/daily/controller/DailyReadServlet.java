package semi.intranet.daily.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.daily.model.service.DailyService;
import semi.intranet.daily.model.vo.Daily;
import semi.intranet.daily.model.vo.PageInfo;

/**
 * Servlet implementation class DailyReadServlet
 */
@WebServlet("/dRead.da")
public class DailyReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyReadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 구별을 위한 카테고리 --> 교육일지 2
		int category = 2;
		
		
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		DailyService ds = new DailyService();
		
		Daily d = ds.selectOne(dno, category);
		
		String page = "";
		
		if(d != null) {
			page = "views/intranet/intranetDailyRead.jsp";
			request.setAttribute("daily", d);
		} else {
			page = "views/intranet/common/intranetError.jsp";
			request.setAttribute("msg", "교육일지를 읽어올 수 없습니다.");
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
