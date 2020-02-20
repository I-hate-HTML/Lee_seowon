package semi.home.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import semi.common.MyRenamePolicy;
import semi.home.board.model.vo.Board;
import semi.home.board.service.BoardService;

/**
 * Servlet implementation class BoardUpdateServlet
 */
@WebServlet("/bupdate.bo")
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		String root = request.getServletContext().getRealPath("/");
		
		String savePath = root + "resources/homepage/images/boardUploadFiles";

		MultipartRequest mrequest
		    = new MultipartRequest(request, savePath,
								   maxSize, "UTF-8",
								   new MyRenamePolicy());
		
		
		
		
		
		int pbno = Integer.parseInt(mrequest.getParameter("pbno"));
		String bcontent = mrequest.getParameter("bcontent");
		String bfile = mrequest.getParameter("orifile");
		mrequest.getFilesystemName("bfile");
		
		ArrayList filelist = MyRenamePolicy.Filenamechange;
		
		String newfile="";
		
		for(int i=0;i<filelist.size();i++) {
			if(i==filelist.size()-1) {
				newfile+=filelist.get(i);
			}else {
				newfile+=filelist.get(i)+",";
			}
		}
		System.out.println(bfile.isEmpty());
		
		if(bfile.isEmpty()) {
			bfile=newfile;
		}else {
			bfile= bfile+","+newfile;
		}
		
		int result = new BoardService().updateBoard(pbno,bcontent,bfile);
		MyRenamePolicy.Filenamechange.clear();
		
		if(result>0) {
			response.sendRedirect("boardlsit.do");
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
