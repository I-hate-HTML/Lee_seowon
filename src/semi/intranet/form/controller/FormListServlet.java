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
import semi.intranet.form.model.vo.SignList;

/**
 * Servlet implementation class FormListServlet
 */
@WebServlet("/fList.fo")
public class FormListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Form> flist = new ArrayList<Form>();
		ArrayList<SignList> list = new ArrayList<SignList>();
		
		int empNo = 2015001; // 나중에 수정할 것!!
		
		flist = new FormService().listForm(empNo);
		list = new FormService().getSignList(empNo);
		
				
		String page = "";
		
		if(list != null && flist != null) {
			page = "views/intranet/intranetFormWrite.jsp";
			request.setAttribute("list", flist);
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
