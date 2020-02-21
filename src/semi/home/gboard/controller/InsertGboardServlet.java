package semi.home.gboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyRenamePolicy;
import semi.home.gboard.model.service.GboardService;
import semi.home.gboard.model.vo.Gboard;

/**
 * Servlet implementation class InsertGboardServlet
 */
@WebServlet("/insertgboard")
public class InsertGboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertGboardServlet() {
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
		String savePath = root + "resources/homepage/images/gboardUploadFiles";		

		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyRenamePolicy());
		
		
		
		String gtitle = mrequest.getParameter("gtitle");
		String gname = mrequest.getParameter("userId");
		String gcontent = mrequest.getParameter("gcontent");
		mrequest.getFilesystemName("gfile");
		
		Gboard g = new Gboard();
		
		ArrayList filelist = MyRenamePolicy.Filenamechange;
		// MyRenamePlicy에서 저장해놓은 이름을 가져와서 꺼냄
		String gfile="";
		
		for(int i=0;i<filelist.size();i++) {
			if(i==filelist.size()-1) {
				gfile+=filelist.get(i);
			}else {
				gfile+=filelist.get(i)+",";
			}
		}
		
		
		g.setGtitle(gtitle);
		g.setGcontent(gcontent);
		g.setGwriter(gname);
		g.setGfile(gfile);
		
		
		int result = new GboardService().insertgboard(g);
		
		
		if(result > 0) {
			MyRenamePolicy.Filenamechange.clear();
			System.out.println("사진 게시글 작성 완료!!");
			response.sendRedirect("gboardlist");
		}else {
			request.setAttribute("msg", "사진게시글 작성 중 오류 발생!!");
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
