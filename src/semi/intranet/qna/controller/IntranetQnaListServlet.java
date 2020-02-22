package semi.intranet.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.qna.model.vo.QnA;
import semi.intranet.qna.service.IntranetQnaService;

/**
 * Servlet implementation class IntranetQnaListServlet
 */
@WebServlet("/list.qna")
public class IntranetQnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntranetQnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지사항 글 여러 개를 받아
		//목록 형태로(ArrayList형태로)
		//데이터를 전달하는 서블릿
		
		ArrayList<QnA> list = new ArrayList<QnA>();
		
		IntranetQnaService qs = new IntranetQnaService();
		
		list = qs.selectList();
		
		String page ="";
		
		if(list != null) {
			page = "views/intranet/intranetAdviceBoard.jsp";
			request.setAttribute("list", list);
			System.out.println(list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "목록 불러오기 에러!");
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
