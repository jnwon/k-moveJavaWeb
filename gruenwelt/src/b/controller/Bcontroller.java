package b.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Bcontroller")
public class Bcontroller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	BDAO bDAO;
	
	public void init() throws ServletException
	{
		bDAO = new BDAO();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doHandle(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<BVO> linksList = bDAO.listTitles();
		request.setAttribute("linksList", linksList);
		RequestDispatcher dispatch = request.getRequestDispatcher("/b/unep.jsp");
		dispatch.forward(request, response);
	}
	
}
