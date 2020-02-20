package semi.home.gboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.home.gboard.model.service.GboardService;
import semi.home.gboard.model.vo.Gboard;

/**
 * Servlet implementation class DeleteGboardServlet
 */
@WebServlet("/deletegboard")
public class DeleteGboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteGboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int gno = Integer.parseInt(request.getParameter("gno"));
		int result = new GboardService().gboardDelete(gno);
	
		if(result > 0) {
			System.out.println("사진게시판 삭제 성공!!");
			response.sendRedirect("gboardlist");
		}else {
			request.setAttribute("msg", "사진게시판 삭제 실패!!");
			request.getRequestDispatcher("views/homepage/common/errorPage.jsp").forward(request, response);;
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
