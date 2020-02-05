package semi.intranet.daily.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.daily.model.service.DailyService;
import semi.intranet.daily.model.vo.Daily;

/**
 * Servlet implementation class DailyInsertServlet
 */
@WebServlet("/dWrite.da")
public class DailyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int bcategory = Integer.parseInt(request.getParameter("category"));
		String bwriter = request.getParameter("writer");
		int bwriterCode = Integer.parseInt(request.getParameter("writerId"));
		String btitle = request.getParameter("subject");
		String bcontent = request.getParameter("content");
		String bfile = request.getParameter("filename");
		
		
		DailyService ds = new DailyService();
		
		Daily b = new Daily(btitle, bcontent, bwriter, bwriterCode, bcategory, bfile);
		
		int result = ds.dailyInsert(b);
		
		if(result > 0) {
			
		} else {
			
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
