package semi.intranet.calendar.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import semi.intranet.calendar.model.service.EventService;
import semi.intranet.calendar.model.vo.Calendar;

/**
 * Servlet implementation class InsertEventServlet
 */
@WebServlet("/InsertEvent.ev")
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
		JSONObject obj = new JSONObject();
		Calendar cl = null;
		
		String jsonParam = request.getParameter("json");

		obj = (JSONObject)JSONValue.parse(jsonParam);
		
		String title = (String)obj.get("title");
		String start = (String)obj.get("start");
		String end = (String)obj.get("end");
		String type = (String)obj.get("type");
		String user = (String)obj.get("user");
		
		
		cl = new Calendar(title,start,end,type,user);
		
		int result = new EventService().InsertEvent(cl);
		
		if(result > 0) {
			
			
			request.getRequestDispatcher("views/intranet/intranetCalendar.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msg", "시발");
			request.getRequestDispatcher("views/intranet/intranetCalendar.jsp").forward(request, response);
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
