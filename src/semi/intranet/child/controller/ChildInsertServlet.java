package semi.intranet.child.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.intranet.child.model.service.ChildService;
import semi.intranet.child.model.vo.Child;

/**
 * Servlet implementation class ChildInsertServlet
 */
@WebServlet("/Cinsert.ch")
public class ChildInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChildInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cName = request.getParameter("cName");
		String cGender = request.getParameter("cGender");
		String cNo = request.getParameter("cNo1")+"-"+request.getParameter("cNo2");
		String cBirth = request.getParameter("cYear")+"."
					+request.getParameter("cMonth")+"."
					+request.getParameter("cDate");
		String cAddr = request.getParameter("cAddr1")
					+request.getParameter("cAddr2")
					+request.getParameter("cAddr3");
		String cImage = request.getParameter("cUrl");
		String cClass = request.getParameter("cClass");
		
		Child c = new Child(cName,cGender,cNo,cBirth,cAddr,cImage,cClass);
		
		ChildService cs = new ChildService();
		int result = cs.insertChild(c);
		
		if(result>0) {
			request.setAttribute("msg", "아이 등록 완료");
			request.getRequestDispatcher("views/intranet/intranetRegisterStudent.jsp");
		}else {
			request.setAttribute("msg", "아이 등록 실패!");
			request.getRequestDispatcher("views/intranet/intranetRegisterStudent.jsp");
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
