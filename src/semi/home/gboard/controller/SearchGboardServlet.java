package semi.home.gboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.gboard.model.service.GboardService;
import semi.home.gboard.model.vo.Gboard;

/**
 * Servlet implementation class SearchGboardServlet
 */
@WebServlet("/searchgboard")
public class SearchGboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchGboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("con");
		String keyword = request.getParameter("keyword");
		
		
		ArrayList<Gboard> searchlist = new ArrayList<Gboard>();
		
		GboardService gs = new GboardService();
		
		searchlist = gs.searchGboard(category,keyword);
		
		String page = "";
		
		System.out.println(searchlist);
		if(searchlist != null) {
			page = "views/homepage/gallaryBoardSearch.jsp";
			request.setAttribute("list", searchlist);
			System.out.println("사진게시판 검색기능 완료!!");
		}else {
			page ="views/homepage/common/errorPage.jsp";
			request.setAttribute("msg", "사진게시판 검색 실패!!");
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
