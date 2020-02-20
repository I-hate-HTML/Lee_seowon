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
 * Servlet implementation class SelectGboardSelectOneServlet
 */
@WebServlet("/gboardselectone.go")
public class SelectGboardSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectGboardSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int gno = Integer.parseInt(request.getParameter("gno"));
		
		GboardService gs = new GboardService();
		Gboard g = gs.selectOne(gno);
		
		String[] gfile = new String[] {"1"}; 
		if(g.getGfile()!=null) {
			gfile = g.getGfile().split(",");
		}
		
		String page = "";
		
		if(g!=null) {
			page = "views/homepage/gallaryread.jsp";
			request.setAttribute("Gboard", g);
			request.setAttribute("Gfile", gfile);
		}else {
			page = "views/homepage/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 상세보기 실패!");
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
