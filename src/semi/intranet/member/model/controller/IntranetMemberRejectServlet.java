package semi.intranet.member.model.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import semi.intranet.member.model.service.IntranetMemberService;

/**
 * Servlet implementation class IntranetMemberRejectServlet
 */
@WebServlet("/reject.member")
public class IntranetMemberRejectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntranetMemberRejectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String,String> returnData = new HashMap<>();
		
		IntranetMemberService ims = new IntranetMemberService();
		
		try(InputStream is = request.getInputStream();
			ByteArrayOutputStream os = new ByteArrayOutputStream()){
			int x;
	        byte[] buf = new byte[1024*8];
	        while ((x = is.read(buf)) != -1) {
	            os.write(buf, 0, x);
	        }
			byte[] ba = os.toByteArray();
			String json = new String(ba);
			
			List<String> userIdList = new Gson().fromJson(json, new TypeToken<List<String>>(){}.getType());

			for (String userId : userIdList) {
				ims.rejectMember(userId);
			}
			
			returnData.put("status", "success");
		}

		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(returnData, response.getWriter());
	}

}
