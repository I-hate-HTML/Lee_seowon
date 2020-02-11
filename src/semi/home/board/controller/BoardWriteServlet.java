package semi.home.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.board.model.vo.Board;
import semi.home.board.service.BoardService;

/**
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/bwrite.do")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String btitle = request.getParameter("btitle");
		String bwriter = "admin";//request.getParameter("userId");
		String bcontent = request.getParameter("bcontent");
		String bfile = request.getParameter("bfile");
		
		Board b = new Board();
		
		b.setBtitle(btitle);
		b.setBwriter(bwriter);
		b.setBcontent(bcontent);
		b.setBfile(bfile);
		
		int result = new BoardService().BoardWrite(b);
		
		if(result>0) {
			response.sendRedirect("boardlsit.do");
		}else {
			System.out.println("오류발생");
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
