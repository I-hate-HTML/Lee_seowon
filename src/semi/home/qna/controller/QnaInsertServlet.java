package semi.home.qna.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.jsp.model.vo.Member;
import semi.home.qna.model.service.QnaService;
import semi.home.qna.model.vo.QnA;


/**
 * Servlet implementation class QnaInsertServlet
 */
@WebServlet("/qInsert.qna")
public class QnaInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QnaInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		String qtitle = request.getParameter("qtitle");
		String qcontent = request.getParameter("qcontent");
		String ask_date = request.getParameter("ask_date");
		
		String [] dateArr = ask_date.split("-");
		int [] intArr = new int[dateArr.length];
		
		for(int i=0; i<dateArr.length;i++) {
			intArr[i] = Integer.parseInt(dateArr[i]);
		}		
		Date meetingDate = new Date(new GregorianCalendar(intArr[0], intArr[1]-1, intArr[2]).getTimeInMillis());
		
		QnA qna = new QnA();
		qna.setQtitle(qtitle);
		qna.setQcontent(qcontent);
		qna.setQwriter(m.getUserId());
		qna.setAsk_date(meetingDate);
		
		int result = new QnaService().insertQna(qna);
		
		if(result > 0) {
			// 문의 등록 완료
			response.sendRedirect("views/homepage/homeindex.jsp");
		}else {
			request.setAttribute("msg", "문의 사항 등록 실패");
			request.getRequestDispatcher("views/homepage/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
