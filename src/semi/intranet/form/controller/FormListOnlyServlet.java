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
import semi.intranet.form.model.vo.SignList;

/**
 * Servlet implementation class FormListServlet
 */
@WebServlet("/fListOnly.fo")
public class FormListOnlyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormListOnlyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		listCount = new FormService().getListCount();
		
		maxPage = (int)((double)listCount / limitContent + 0.9);
		startPage = ((int)((double) currentPage / limitPage + 0.9) -1) * limitPage + 1;
		
		endPage = startPage + limitPage - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 게시판 글목록 리스트
		flist = new FormService().listForm(empNo, currentPage, limitContent);
		
		String page = "";
		
		if(flist != null) {
			page = "views/intranet/intranetFormList.jsp";
			request.setAttribute("list", flist);
			
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
