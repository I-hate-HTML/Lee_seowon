package semi.intranet.daily.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semi.intranet.daily.model.service.DailyService;
import semi.intranet.daily.model.vo.Daily;

/**
 * Servlet implementation class ModifyViewServletDaily
 */
@WebServlet("/dModifyView.da")
public class DailyModifyViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyModifyViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int category = 2;
		
		int dno = Integer.parseInt(request.getParameter("dno"));
		
		Daily d = new DailyService().dailyModifyView(dno, category);
		
		
		String page = "";
		if(d != null) {
			page = "views/intranet/intranetDailyModify.jsp";
			request.setAttribute("daily", d);
		} else {
			page = "views/intranet/common/intranetError.jsp";
			request.setAttribute("msg", "교육일지를 수정할 수 없습니다.");
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
