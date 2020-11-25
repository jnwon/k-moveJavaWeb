package unep.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.google.gson.Gson;

@WebServlet("/UnepController")
public class UnepController extends HttpServlet {
	 
	private static final long serialVersionUID = 1L;
	UnepDAO unepDAO;
	UnepCrawler unepCrawler;
	
	public void init() throws ServletException
	{
		unepDAO = new UnepDAO();
		unepCrawler = new UnepCrawler();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doHandle1(request, response);
		doHandle2(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doHandle1(request, response);
		doHandle2(request, response);
	}
	
	private void doHandle1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");

		List<UnepVO> linksList = unepDAO.listTitles();
		request.setAttribute("linksList", linksList);
		String gson = new Gson().toJson(linksList);
	    response.getWriter().write(gson);
	   
	}
	
	private void doHandle2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		List<UnepVO> titlesAndlinkslist = unepCrawler.listTitleAndLink();
		request.setAttribute("titlesAndlinkslist", titlesAndlinkslist);
		
	}
	
}
