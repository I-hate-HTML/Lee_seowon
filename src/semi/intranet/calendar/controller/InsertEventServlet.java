package semi.intranet.calendar.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import semi.intranet.calendar.model.service.EventService;

/**
 * Servlet implementation class InsertEventServlet
 */
@WebServlet("/InsertEvent.ev")
public class InsertEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertEventServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EventService ev = new EventService();
		int result = 0;
		JSONArray alljson = new JSONArray();
		
		String jsonstr = request.getParameter("event");
		JSONParser parser = new JSONParser();
		System.out.println("시발");
		
		try {
			try(BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream("C:\\Users\\user2\\git\\Lee_seowon\\web\\views\\intranet\\data.json"),"UTF8"))) {
				alljson = (JSONArray)parser.parse(reader);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			Object obj = parser.parse(jsonstr);
			JSONObject jsonobj = (JSONObject)obj;
			alljson.add(jsonobj);
			
			result = ev.InsertEvent(alljson.toString());
			System.out.println(alljson.toString());
			
			if(result>0) {
				try ( BufferedWriter file = new BufferedWriter(
	                    new OutputStreamWriter(
	                            new FileOutputStream("C:\\Users\\user2\\git\\Lee_seowon\\web\\views\\intranet\\data.json"),"UTF8"))){
					file.write(alljson.toJSONString());
					file.flush();
					file.close();
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
		} catch (ParseException e) {
			e.printStackTrace();
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
