package semi.intranet.form.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import semi.intranet.form.model.service.FormService;
import semi.intranet.form.model.vo.SignList;

/**
 * Servlet implementation class FormSignListServlet
 */
@WebServlet("/fSignList.fo") // 결재자 리스트 가져오기  --> gson
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
		
		
		response.setContentType("application/json; charset=UTF-8");
		
		int empNo = 2015001; // 나중에 수정할 것!!
		
		ArrayList<SignList> list = new FormService().getSignList(empNo);
		
		
		new Gson().toJson(list, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}