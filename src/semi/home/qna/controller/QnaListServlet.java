package semi.home.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.qna.model.service.QnaService;
import semi.home.qna.model.vo.QnA;

/**
 * Servlet implementation class QnaListServlet
 */
@WebServlet("/qList.qna")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<QnA> list = new ArrayList<>();
		
		list = new QnaService().listQna();
		
		String page = "";
		System.out.println(list);
		if(list != null) {
			page = "views/homepage/qna.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/homepage/common/errorPage.jsp";
			request.setAttribute("msg", "문의 리스트 불러오기 실패..");
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
