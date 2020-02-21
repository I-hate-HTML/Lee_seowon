package semi.intranet.form.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.home.jsp.model.vo.Member;
import semi.intranet.form.model.service.FormService;

/**
 * Servlet implementation class FormDeleteServlet
 */
@WebServlet("/fDelete.fo")
public class FormDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		int eno = Integer.parseInt(m.getUserId());
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		int result = new FormService().deleteForm(fno, eno);
		
		String page = "";
		
		if(result > 0) {
			response.sendRedirect("fList.fo");
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
