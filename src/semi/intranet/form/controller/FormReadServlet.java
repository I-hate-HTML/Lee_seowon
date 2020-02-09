package semi.intranet.form.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.daily.model.vo.PageInfo;
import semi.intranet.form.model.service.FormService;
import semi.intranet.form.model.vo.Form;

/**
 * Servlet implementation class FormReadServlet
 */
@WebServlet("/fRead.fo")
public class FormReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FormReadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int fno = Integer.parseInt(request.getParameter("fno"));

		ArrayList<Form> flist = new ArrayList<Form>();

		int empNo = 2015001; // 나중에 수정할 것!!

		int currentPage;
		int listCount;
		int limitContent;
		int limitPage;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;
		limitContent = 5;
		limitPage = 3;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		listCount = new FormService().getListCount();

		maxPage = (int) ((double) listCount / limitContent + 0.9);
		startPage = ((int) ((double) currentPage / limitPage + 0.9) - 1) * limitPage + 1;

		endPage = startPage + limitPage - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}

		// 게시판 글목록 리스트
		flist = new FormService().listForm(empNo, currentPage, limitContent);

		Form f = new FormService().readForm(fno);

		String page = "";
		
		  if(f != null) { 
			/* page = "views/intranet/intranetFormRead.jsp"; */ 
			  page = "/fListTest.fo"; 
		  
			  request.setAttribute("form", f); 
		 }
		  
		 request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
