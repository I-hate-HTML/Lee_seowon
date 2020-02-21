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
import semi.home.gboard.model.vo.PageInfo;

/**
 * Servlet implementation class SelectGboardListServlet
 */
@WebServlet("/gboardlist")
public class SelectGboardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectGboardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	ArrayList<Gboard> list = null;
	GboardService gs = new GboardService();
	
	int startPage;
	int endPage;
	int maxPage;
	int currentPage;
	int limit;
	currentPage = 1;
	limit = 9;
	
	if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int listCount = gs.getListCount();
	
	maxPage = (int)((double)listCount/limit + 0.9);
	startPage = ((int)((double)currentPage / limit + 0.9)-1)*limit+1;
	endPage = startPage + limit -1;
	if(endPage > maxPage) {
		endPage = maxPage;
	}
	
	list = gs.selectList(currentPage,limit);
	
	
	String page ="";
	if(list != null) {
		
		page = "views/homepage/gallaryBoard.jsp";
		request.setAttribute("list", list);
		PageInfo pi = new PageInfo(currentPage,listCount,limit,maxPage,startPage,endPage);
		request.setAttribute("pi", pi);
		System.out.println("사진게시판 리스트 불러오기 완료!!");
		
	} else {
		
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
