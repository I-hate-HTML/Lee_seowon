package semi.intranet.form.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.form.model.service.FormService;

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
		
		int fno = Integer.parseInt(request.getParameter("formNum"));
		
		String[] signArr = request.getParameterValues("formLineP");
		
		String sign1 = "";
		String sign2 = "";
		String sign3 = "";
		
		int size = signArr.length;
		
		
		switch(size) {
		case 1 : sign1 = signArr[0]; break;
		case 2 : sign1 = signArr[0];
				 sign2 = signArr[1]; break;
		case 3 : sign1 = signArr[0];
				 sign2 = signArr[1];
				 sign3 = signArr[2]; break;
		}
		
		
		String fReturn = request.getParameter("formReturn");
		
		int result = new FormService().updateSign(fno, sign1, sign2, sign3, fReturn);
		
		String page = "";
		
		if(result > 0) {
			page = "fReadSign.fo";
			request.setAttribute("fno", fno);
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
