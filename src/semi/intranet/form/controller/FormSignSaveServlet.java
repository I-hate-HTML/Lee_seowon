package semi.intranet.form.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.intranet.form.model.service.FormService;
import semi.intranet.form.model.vo.Form;

/**
 * Servlet implementation class FormSignSaveServlet
 */
@WebServlet("/fSignSave.fo")
public class FormSignSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormSignSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json; charset=UTF-8");
		
		int fno = Integer.parseInt(request.getParameter("fno"));
		String yn = request.getParameter("yn") + ",";
		String reason = request.getParameter("reason") + ",";
		String process = request.getParameter("result");
		
		System.out.println(process);
		
		int result = new FormService().updateSign(fno, yn, reason, process);
		
		if(result > 0) {
			new Gson().toJson(result, response.getWriter());
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
