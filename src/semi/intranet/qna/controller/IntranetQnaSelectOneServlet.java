package semi.intranet.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.jsp.model.vo.Member;
import semi.home.qna.model.vo.QnA;
import semi.intranet.qna.model.vo.IntranetQna;
import semi.intranet.qna.service.IntranetQnaService;

/**
 * Servlet implementation class IntranetQnaSelectOneServlet
 */
@WebServlet("/qSelectOne.qna")
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
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		int empNo = Integer.parseInt(m.getUserId());
		
		int qno = Integer.parseInt(request.getParameter("qno"));
		
		IntranetQnaService iqs = new IntranetQnaService();
		
		IntranetQna q = iqs.selectOne(qno);
		
		String page = "";
		if(q != null) {
			page = "views/intranet/intranetAdviceDetail.jsp";
			request.setAttribute("qna", q);
		}else {
			page = "views/intranet/common/intranetError.jsp";
			request.setAttribute("msg", "문의사항 글을 읽어올 수 없습니다.");
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
