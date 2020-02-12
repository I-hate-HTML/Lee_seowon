package semi.intranet.alimjang.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.alimjang.model.vo.AlimNote;
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
	
		int ano = Integer.parseInt(request.getParameter("ano"));
		int category = Integer.parseInt(request.getParameter("category"));
		
		System.out.println(ano);
		System.out.println(category);
		
		int empNo = 2015001;
		
		String table ="";
		String culumn = "";
		String page = "";
		
		if(category == 1) { // 아이 알림장
			
			table = "ALIMNOTE";
			culumn = "AL";
			
			AlimNote a = new AlimNote();
			Alim b = new Alim();
			
			a = new AlimService().readAlim(empNo, ano);
			b = new AlimService().readAlimCommon(empNo, ano, table, culumn);
			
			System.out.println("a : " + a);
			System.out.println("b : " + b);
			page = "views/intranet/intranetAlimNoteRead.jsp";
			request.setAttribute("a", a);
			request.setAttribute("b", b);
			
		} else if(category == 2) { // 귀가 통지서
			
		} else { // 투약 통지서
			
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
