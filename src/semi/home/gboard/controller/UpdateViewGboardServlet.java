package semi.home.gboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.gboard.model.service.GboardService;
import semi.home.gboard.model.vo.Gboard;

/**
 * Servlet implementation class UpdateViewGboardServlet
 */
@WebServlet("/updateviewgboard")
public class UpdateViewGboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateViewGboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int gno = Integer.parseInt(request.getParameter("gno"));
	Gboard g = new Gboard();
	
	g = new GboardService().upDateView(gno);

	
	String[] gfile = new String[] {"1"};
	
	if(g.getGfile() != null) {
		gfile = g.getGfile().split(",");
	}
	
	if(g != null) {
		request.setAttribute("Gboard", g);
		request.setAttribute("gfile", gfile);
		request.getRequestDispatcher("views/homepage/gallaryupdate.jsp").forward(request, response);
	}else {
		request.setAttribute("msg", "갤러리 수정 중 오류발생!!");
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
