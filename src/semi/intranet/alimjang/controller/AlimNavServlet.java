package semi.intranet.alimjang.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import semi.home.jsp.model.vo.Member;
import semi.intranet.alimjang.model.service.AlimService;
import semi.intranet.alimjang.model.vo.Alim;

/**
 * Servlet implementation class AlimNavServlet
 */
@WebServlet("/aNav.al")
public class AlimNavServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlimNavServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("member");
		
		int emp = Integer.parseInt(m.getUserId());

		ArrayList<Alim> navList = new ArrayList<Alim>();
		
		
		// 확인 안한 알림 갯수 가져오기
		int newAlimCount = new AlimService().newAlimCount(emp); 
		
		
		// 확인 안한 알림 리스트 가져오기
		navList = new AlimService().navListAlim(emp);
		
		Map<String,Object> hmap = new HashMap<String, Object>();
		
		hmap.put("aCount", newAlimCount);
		hmap.put("aList", navList);
		
		
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
