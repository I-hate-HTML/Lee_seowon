package semi.home.gboard.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyRenamePolicy;
import semi.home.gboard.model.service.GboardService;

/**
 * Servlet implementation class UpdateGboardServlet
 */
@WebServlet("/updategboard")
public class UpdateGboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGboardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int maxSize = 1024 * 1024 * 10; 
		
		String root = request.getServletContext().getRealPath("/");
		String savePath = root + "resources/homepage/images/gboardUploadFiles";	
		
		MultipartRequest mrequest
	    = new MultipartRequest(request, savePath,
							   maxSize, "UTF-8",
							   new MyRenamePolicy());
		
		int gno = Integer.parseInt(mrequest.getParameter("gno"));
		String gcontent = mrequest.getParameter("gcontent");
		String gfile = mrequest.getParameter("orifile");
		mrequest.getFilesystemName("gfile");
	
		ArrayList filelist = MyRenamePolicy.Filenamechange;
		
		String newfile="";
		
		for(int i=0;i<filelist.size();i++) {
			if(i==filelist.size()-1) {
				newfile+=filelist.get(i);
			}else {
				newfile+=filelist.get(i)+",";
			}
		}
		
		gfile = gfile+","+newfile;
	
		int result = new GboardService().updateGboard(gno,gcontent,gfile);
		MyRenamePolicy.Filenamechange.clear();
		
		if(result>0) {
			System.out.println("사진게시판 업데이트 성공!!");
			response.sendRedirect("gboardlist");
		}else {
			System.out.println("수정 오류 발생!");
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
