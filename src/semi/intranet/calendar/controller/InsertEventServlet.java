package semi.intranet.calendar.controller;

import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.calendar.model.service.EventService;

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
		EventService es = new EventService();
		String cJson = request.getParameter("json");
		FileWriter fw;
		
		int result = 0;
		result = es.InsertEvent(cJson);
		
		if(result > 0) {
			try {
				fw = new FileWriter("../../resources/intranet/ajax/data.json",false);
				fw.write(cJson);
				fw.close();
			}catch(Exception e) {
				e.printStackTrace();
				request.setAttribute("msg", "시발");
				request.getRequestDispatcher("/views/intranet/intranetCalender.jsp").forward(request, response);
			}
			
			response.sendRedirect("/views/intranet/intranetCalender.jsp");
			
		}else {
			request.setAttribute("msg", "시발");
			request.getRequestDispatcher("/views/intranet/intranetCalender.jsp").forward(request, response);
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
