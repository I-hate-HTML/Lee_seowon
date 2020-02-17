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
 * Servlet implementation class BoardWriteServlet
 */
@WebServlet("/bwrite.do")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// jsp 페이지에서 form 형태를 multi-request 형태로 보내줘서 받아야함.
		
		int maxSize = 1024 * 1024 * 10; // 10MB
		
		String root = request.getServletContext().getRealPath("/");
		
		String savePath = root + "resources/homepage/images/boardUploadFiles";

		MultipartRequest mrequest
		    = new MultipartRequest(request, savePath,
								   maxSize, "UTF-8",
								   new MyRenamePolicy());
		
		
		String btitle = mrequest.getParameter("btitle");
		String bwriter = "admin";//request.getParameter("userId");
		String bcontent = mrequest.getParameter("bcontent");
		mrequest.getFilesystemName("bfile");
		// mrequest.getFilesystemName(태그네임); 을 불러올때 파일이 저장이 되고
		// 이때 기존의 방법대신 강사님이 사용하신 MyRenamePolicy를 이용
		

		Board b = new Board();

		
		ArrayList filelist = MyRenamePolicy.Filenamechange;
		// MyRenamePlicy에서 저장해놓은 이름을 가져와서 꺼냄
		String bfile="";
		
		for(int i=0;i<filelist.size();i++) {
			if(i==filelist.size()-1) {
				bfile+=filelist.get(i);
			}else {
				bfile+=filelist.get(i)+",";
			}
		}
		// list로 저장해놓은 파일이름은 , 구분자로 String 형태로 변환시키는 작업
		
		
		b.setBtitle(btitle);
		b.setBwriter(bwriter);
		b.setBcontent(bcontent);
		b.setBfile(bfile);
		// 변환시킨 값을 Board 객체에 넣어서 서비스로 보내줄 준비 
		

		int result = new BoardService().BoardWrite(b);
		
		if(result>0) {
			response.sendRedirect("boardlsit.do");
		}else {
			System.out.println("오류발생");
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
