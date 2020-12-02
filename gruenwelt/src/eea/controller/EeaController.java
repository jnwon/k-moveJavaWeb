package eea.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Calendar;
import java.util.Timer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

/**
 * Servlet implementation class EeaController
 */
@WebServlet("/Eea.do")
public class EeaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EeaDAO eeaDAO;
	EeaCrawler eeaCrawler;
	Calendar datetime;
	
	public void init() throws ServletException {
		eeaDAO = new EeaDAO(); // EeaDAO를 생성
		eeaCrawler = new EeaCrawler();
		
		datetime = Calendar.getInstance();
		datetime.set(Calendar.HOUR_OF_DAY, 7);
		datetime.set(Calendar.MINUTE, 0);
		datetime.set(Calendar.SECOND, 0);
		datetime.set(Calendar.MILLISECOND, 0);
		
		Timer timer = new Timer();
		timer.schedule(eeaCrawler, datetime.getTime(), 1000*86400);
		System.out.println("EEA crawler set timer: " + datetime.getTime());
	}
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		List<EeaVO> articlesList = eeaDAO.eea(); // 요청에 대해 기사리스트를 조회
		request.setAttribute("articlesList", articlesList); // 조회한 기사정보를 request에 바인딩
		String gson = new Gson().toJson(articlesList);
		response.getWriter().write(gson);
		
		/*
		 * RequestDispatcher dispatch = request.getRequestDispatcher("/f/eea.jsp");
		 * dispatch.forward(request, response); // 컨트롤러에서 표시하고자 하는 JSP로 포워딩
		 */		
	}
	
		
}
