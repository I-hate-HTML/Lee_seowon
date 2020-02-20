package semi.home.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.board.model.vo.Board;
import semi.home.board.model.vo.PageInfo;
import semi.home.board.service.BoardService;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/boardlsit.do")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Board> list = null;
		BoardService bs = new BoardService();
		
		int startPage;
		int endPage;
		int maxPage;
		int currentPage;
		int limit;
		currentPage = 1;
		limit = 10;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = bs.getListCount();
		
		maxPage = (int)((double)listCount/limit + 0.9);
		startPage = ((int)((double)currentPage / limit + 0.9)-1)*limit+1;
		endPage = startPage + limit -1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		list = bs.selectList(currentPage,limit);
		
		String page = "";
		
		
		if(list!= null) {
			page = "views/homepage/board.jsp";
			request.setAttribute("list", list);
			
			PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
			
			request.setAttribute("pi",pi);
		}else {
			request.setAttribute("msg", "에러발생");
			page = "views/homepage/board.jsp";
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
