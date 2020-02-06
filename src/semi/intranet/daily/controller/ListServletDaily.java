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

/**
 * Servlet implementation class DailyListServlet
 */
@WebServlet("/dList.da")
public class ListServletDaily extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListServletDaily() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Daily> list = new ArrayList<Daily>();
		
		DailyService ds = new DailyService();
		
		int currentPage; 	// 현재 페이지                 
		int listCount;		// 총 게시글 수                 
		int limitContent;	// 페이지당 게시글 수 
		int limitPage;		// 한번에 보여질 페이지 수
		int maxPage;		// 전체 페이지 중 마지막 페이지       
		int startPage;		// 한번에 표시할 페이지 중 앞 페이지    
		int endPage;		// 한번에 표시할 페이지 중 마지막 페이지 
		
		// 처음 접속 시 페이지는 1페이지 부터 시작한다.
		currentPage = 1;
		
		// 글 개수 --> 페이지당 10개
		limitContent = 10;
		
		// 페이지 수 --> 한번에 보여질 페이지 수
		limitPage = 3;
		
		// 만약에 사용자가 현재 페이지의 정보를 들고 왔다면
		// currentPage를 1에서 특정 페이지로 수정해주어야한다.
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 페이징 처리
		
		// 총 페이지 수
		listCount = ds.getListCount();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
