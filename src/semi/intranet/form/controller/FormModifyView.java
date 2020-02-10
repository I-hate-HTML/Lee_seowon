package semi.intranet.form.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.form.model.service.FormService;
import semi.intranet.form.model.vo.Form;

/**
 * Servlet implementation class FormModifyView
 */
@WebServlet("/fModifyView.fo")
public class FormModifyView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormModifyView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		
		Form f = new Form();
		
		f = new FormService().modifyViewForm(fno);
		
		String page = "";
		
		if(f != null) {
			page = "views/intranet/intranetFormModify.jsp";
			request.setAttribute("form", f);
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
