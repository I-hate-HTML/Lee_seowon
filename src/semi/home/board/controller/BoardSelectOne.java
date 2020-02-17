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
 * Servlet implementation class BoardSelectOne
 */
@WebServlet("/selectOne.bo")
public class BoardSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelectOne() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		Board b  = new BoardService().selectOne(bno);
		
		String[] bfile= new String[] {"1"};
		// 만약 사진첨부를 안하고 글을 썼을때 null 값이 들어오기 때문에 구분해줄 수 있는 문구를 넣고 배열을 만들어줌
		if(b.getBfile()!= null) {
			 bfile = b.getBfile().split(",");
		}
		// , 로 구분되어있는 bfile 이름들을 String 배열에 각각 집어넣는 과정
		
		
		String path="";
		if(b != null) {
			path="views/homepage/boardread.jsp";
			request.setAttribute("board", b);
			request.setAttribute("bfile",bfile);
			// String 배열을 게시글을 읽는 페이지로 보낸다
			request.getRequestDispatcher(path).forward(request, response);
			
		}else {
			path="views/homepage/boardread.jsp";
			request.setAttribute("board", b);
			request.getRequestDispatcher(path).forward(request, response);
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
