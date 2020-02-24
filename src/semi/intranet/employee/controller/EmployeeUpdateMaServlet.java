package semi.intranet.employee.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyRenamePolicy;
import semi.home.jsp.model.exception.MemberException;
import semi.home.jsp.model.service.HomeMemberService;
import semi.home.jsp.model.vo.Member;
import semi.intranet.employee.model.exception.EmployeeException;
import semi.intranet.employee.model.service.EmployeeService;
import semi.intranet.employee.model.vo.Employee;

/**
 * Servlet implementation class EmployeeUpdateMaServlet
 */
@WebServlet("/maUpdate.emp")
public class EmployeeUpdateMaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeUpdateMaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024*1024*10;
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "multipart를 통한 전송이 아닙니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + "resources/intranet/image";		

		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyRenamePolicy());

		mrequest.getFilesystemName("empimg");
		
		String empEmail = mrequest.getParameter("empEmail");
		String empPhone = mrequest.getParameter("hp1")+"-"
					+ mrequest.getParameter("hp2")+"-"
					+ mrequest.getParameter("hp3");
		
		String empAddr = mrequest.getParameter("homezipcode")+", "
						+ mrequest.getParameter("homeaddress")+", "
						+ mrequest.getParameter("homeaddress2");
		
		
		//HttpSession session = request.getSession(false);
		
		Employee empl = new Employee();
		
		ArrayList filelist = MyRenamePolicy.Filenamechange;
		//이름 변경?
		String empimg="";
		
		for(int i=0; i<filelist.size();i++) {
			if(i==filelist.size()-1) {
				empimg+=filelist.get(i);
			}else {
				empimg+=filelist.get(i)+",";
			}
		}
		
		empl.setEmpimg(empimg);
		empl.setEmpEmail(empEmail);
		empl.setEmpPhone(empPhone);
		empl.setEmpAddr(empAddr);
		
		
		int result = new EmployeeService().updateEmployeeByMa(empl);
		
		if(result > 0 ) {
			MyRenamePolicy.Filenamechange.clear();
			System.out.println("회원정보 수정 완료!");
			
			response.sendRedirect("views/intranet/intranetMain.jsp");
			
		} else{
			request.setAttribute("msg", "회원정보 수정 실패!!");
			request.getRequestDispatcher("views/homepage/common/errorPage.jsp").forward(request, response);
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
