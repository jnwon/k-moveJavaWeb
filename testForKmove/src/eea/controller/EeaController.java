package eea.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EeaController
 */
@WebServlet("/Eea.do")
public class EeaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EeaDAO eeaDAO;
	
	public void init() throws ServletException {
		eeaDAO = new EeaDAO(); // EeaDAO를 생성
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
		response.setContentType("text/html;charset=utf-8");
		List<EeaVO> articlesList = eeaDAO.eea(); // 요청에 대해 기사리스트를 조회
		request.setAttribute("articlesList", articlesList); // 조회한 기사정보를 request에 바인딩
		RequestDispatcher dispatch = request.getRequestDispatcher("/f/eea.jsp"); 
		dispatch.forward(request, response); // 컨트롤러에서 표시하고자 하는 JSP로 포워딩
		
	}
	
		
}
