package semi.intranet.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.qna.model.vo.QnA;
import semi.intranet.qna.service.IntranetQnaService;

/**
 * Servlet implementation class IntranetQnaSelectOneServlet
 */
@WebServlet("/selectOne.qna")
public class IntranetQnaSelectOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntranetQnaSelectOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		IntranetQnaService iqs = new IntranetQnaService();
		
		QnA q = iqs.selectOne(qno);
		
		String page = "";
		if(q != null) {
			page = "views/notice/intranetAdviceDetail.jsp";
			request.setAttribute("qna", q);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상세보기 실패!");
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
