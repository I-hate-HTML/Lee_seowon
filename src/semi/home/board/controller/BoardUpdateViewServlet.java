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
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/bupdateview.bo")
public class BoardUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pbno = Integer.parseInt(request.getParameter("pbno"));
		
		Board b = new Board();
		b = new BoardService().updateView(pbno);
		
		if( b != null) {
			request.setAttribute("board", b);
			request.getRequestDispatcher("views/homepage/boardupdate.jsp").forward(request, response);
		}else {
			System.out.println("Board가 비어있다");
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
