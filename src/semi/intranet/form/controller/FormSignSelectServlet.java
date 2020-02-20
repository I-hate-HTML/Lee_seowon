package semi.intranet.form.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.intranet.form.model.service.FormService;
import semi.intranet.form.model.vo.SignList;

/**
 * Servlet implementation class FormSignSelectServlet
 */
@WebServlet("/fSignSelect.fo")
public class FormSignSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormSignSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("application/json; charset=UTF-8");
		
		
		String name = request.getParameter("sign");
		String yn = request.getParameter("yn");
		String msg = request.getParameter("msg");
	
		
		ArrayList<SignList> listArr = new FormService().getSignSelect(name, yn, msg);
		
		Map<String, Object> hmap = new HashMap<String, Object>();
		
		hmap.put("signList", listArr);
		
		new Gson().toJson(hmap, response.getWriter());
		
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
