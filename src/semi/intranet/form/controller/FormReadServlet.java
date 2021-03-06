package semi.intranet.form.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import semi.home.jsp.model.vo.Member;
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

		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		int empNo = Integer.parseInt(m.getUserId());

		
		Form f = new FormService().readForm(fno);
		

		String page = "";
		
	
		// 기안자인지 결재자인지 구분 --> 구분에 따라 읽는 페이지 달라짐
		if(f != null && empNo == f.getfWriterId() ) { // 기안자 일 경우
			page = "views/intranet/intranetFormRead.jsp";
			request.setAttribute("form", f);
			
		} else if (f != null && empNo != f.getfWriterId()) {// 결재자 일 경우
			page = "views/intranet/intranetFormReadSign.jsp";
			request.setAttribute("form", f);
		} else {
			page = "views/intranet/common/intranetError.jsp";
			request.setAttribute("msg", "품의서 게시글을 가져올 수 없습니다.");
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
