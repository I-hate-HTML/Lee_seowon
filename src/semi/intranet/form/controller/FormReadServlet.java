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
//		int empNo = Integer.parseInt(request.getParameter("empNo"));

		
		int empNo = 2015001; // 나중에 바꿀 것

		
		Form f = new FormService().readForm(fno);
		

		String page = "";
		
	
		// 기안자인지 결재자인지 구분 --> 구분에 따라 읽는 페이지 달라짐
		if(f != null && empNo == f.getfWriterId() ) { // 기안자 일 경우
			f.setType(1);
			page = "fListRead.fo";
			request.setAttribute("form", f);
			
		} else if (f != null && empNo == f.getFsignId1() || empNo == f.getFsignId2() || empNo == f.getFsignId3()) {// 결재자 일 경우
			f.setType(2);
			page = "fListRead.fo";
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
