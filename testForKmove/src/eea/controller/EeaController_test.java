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

import com.google.gson.Gson;


/**
 * Servlet implementation class EeaController
 */
@WebServlet("/Eea.test")
public class EeaController_test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EeaDAO eeaDAO;
	EeaCrawler eeaCrawler;
	
	public void init() throws ServletException {
		eeaDAO = new EeaDAO(); // EeaDAO�� ����
		eeaCrawler = new EeaCrawler();
	}
	 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("request").equals("crawl")) {
			doHandle2(request, response);
		}
		else if(request.getParameter("request").equals("addArticles")) {
			doHandle3(request, response);
		}
	}	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("request").equals("crawl")) {
			doHandle2(request, response);
		}
		else if(request.getParameter("request").equals("addArticles")) {
			doHandle3(request, response);
		}
	}
	
	private void doHandle1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<EeaVO> articlesList = eeaDAO.eea(); // ��û�� ���� ��縮��Ʈ�� ��ȸ
		request.setAttribute("articlesList", articlesList); // ��ȸ�� ��������� request�� ���ε�
		//RequestDispatcher dispatch = request.getRequestDispatcher("/f/eea.jsp"); 
		//dispatch.forward(request, response); // ��Ʈ�ѷ����� ǥ���ϰ��� �ϴ� JSP�� ������
	}
	
	private void doHandle2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		List<EeaVO> result = eeaCrawler.listTitleAndLink();
		request.setAttribute("articlesList", result);
		
		String gson = new Gson().toJson(result);
	    response.getWriter().write(gson);		
	}
	
	private void doHandle3(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		eeaCrawler.InsertArticles(request.getParameter("data"));
		
		String gson = new Gson().toJson("articles added");
	    response.getWriter().write(gson);		
	}	
}
