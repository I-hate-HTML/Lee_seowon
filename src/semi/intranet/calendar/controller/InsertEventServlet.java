package semi.intranet.calendar.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.calendar.model.service.EventService;
import semi.intranet.calendar.model.vo.Calendar;

/**
 * Servlet implementation class InsertEventServlet
 */
@WebServlet("/insertEvent.ev")
public class InsertEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertEventServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("eventTitle");
		String content = request.getParameter("eventContent");
		String startdate = request.getParameter("startDate");
		String enddate = request.getParameter("endDate");
		String type = request.getParameter("eventType");
		String user = request.getParameter("user");

		Calendar cc = new Calendar();
		Date start = null;
		Date end = null;

		cc.setTitle(title);
		cc.setContent(content);
		
		// 시작일 선언
		String[] startArr = startdate.split("-");     
		int[] starArr = new int[startArr.length];

		for(int i=0; i < startArr.length;i++) {
			starArr[i] = Integer.parseInt(startArr[i]);
		}

		start = new Date(new GregorianCalendar(
				starArr[0],starArr[1]-1,starArr[2]
				).getTimeInMillis());

		if(enddate != "" && enddate != null) { 
			String[] dateArr = enddate.split("-");     
			int[] intArr = new int[dateArr.length];


			for(int i=0; i < dateArr.length;i++) {
				intArr[i] = Integer.parseInt(dateArr[i]);
			}

			end = new Date(new GregorianCalendar(
					intArr[0],intArr[1]-1,intArr[2]
					).getTimeInMillis());

		}else {
			// 종료 날짜가 들어오지 않으면
			
			end = new Date(new GregorianCalendar().getTimeInMillis());
		}
		
		cc.setTitle(title);
		cc.setContent(content);
		cc.setStart(start);
		cc.setEnd(end);
		cc.setType(type);
		cc.setUser(user);
		
		EventService es = new EventService();
		int result = es.InsertEvent(cc);
		
		if(result > 0) {
			request.getRequestDispatcher("views/intranet/intranetCalnedar").forward(request, response);
		}else {
			request.setAttribute("msg", "등록 실패!");
			request.getRequestDispatcher("views/intranet/intranetCalnedar").forward(request, response);
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
