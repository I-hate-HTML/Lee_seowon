package semi.intranet.form.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.intranet.daily.model.vo.PageInfo;
import semi.intranet.form.model.service.FormService;
import semi.intranet.form.model.vo.Form;
import semi.intranet.form.model.vo.SignList;

/**
 * Servlet implementation class FormListServlet
 */
@WebServlet("/fListSign.fo")
public class FormListSignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormListSignServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Form> flist = new ArrayList<Form>();
		Form f = (Form)request.getAttribute("form");
		
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
	
		// 기안자인지 결재자인지 구분 --> 구분에 따라 읽는 페이지 달라짐
		if (f != null && flist != null && empNo == f.getFsignId1() || empNo == f.getFsignId2() || empNo == f.getFsignId3()) {// 결재자 일 경우
			page = "views/intranet/intranetFormReadSign.jsp";
			
			request.setAttribute("list", flist);
			request.setAttribute("form", f);
			
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
