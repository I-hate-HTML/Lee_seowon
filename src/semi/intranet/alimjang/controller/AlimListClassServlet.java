package semi.intranet.alimjang.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.jsp.model.vo.Member;
import semi.intranet.alimjang.model.service.AlimService;
import semi.intranet.alimjang.model.vo.Alim;
import semi.intranet.alimjang.model.vo.PageInfo;

/**
 * Servlet implementation class AlimjangListServlet
 */
@WebServlet("/aListClass.al")
public class AlimListClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlimListClassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Alim> list = new ArrayList<Alim>();
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		int empNo = Integer.parseInt(m.getUserId());
		
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
		
		// 총 글 수
		listCount = new AlimService().getClassListCount(empNo);
		
		
		// 가장 마지막 페이지
		maxPage = (int)((double)listCount / limitContent + 0.9);
		
		// 시작 페이지
		startPage = ((int)((double)currentPage/limitPage + 0.9) - 1) * limitPage + 1;
		
		// 한번에 보이는 마지막 페이지
		endPage = startPage + limitPage - 1;
		
		// 만약 마지막 페이지보다 현재 게시글이 끝나는 페이지가 적다면
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		list = new AlimService().selectListClass(empNo, currentPage, limitContent);
		
		String page = "";
		
		if(list != null) {
			page = "views/intranet/intranetAlimListClass.jsp";
			request.setAttribute("list", list);
			
			PageInfo pi = new PageInfo(currentPage, listCount, limitContent, limitPage, maxPage, startPage, endPage);
			request.setAttribute("pi", pi);
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
