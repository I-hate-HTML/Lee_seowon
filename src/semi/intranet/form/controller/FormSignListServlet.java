package semi.intranet.form.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.form.model.service.FormService;
import semi.intranet.form.model.vo.SignList;

/**
 * Servlet implementation class FormSignListServlet
 */
@WebServlet("/fSignList.fo")
public class FormSignListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormSignListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int empNo = 2015001; // 나중에 바꾸기!!
		
		ArrayList<SignList> list = new ArrayList<SignList>();
		
		list = new FormService().getSignList(empNo);
		
		String page = "";
		if(list != null) {
			page = "views/intranet/intranetFormWrite.jsp";
			request.setAttribute("sign", list);
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
