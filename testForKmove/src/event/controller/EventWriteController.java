package event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** 
 * Servlet implementation class EventWriteController
 */
@WebServlet("/EventWriteController")
public class EventWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventDAO eventDAO;
	EventVO eventVO;

    /**
     * @see HttpServlet#HttpServlet()
     */
	public void init() throws ServletException {
		eventDAO = new EventDAO();
		eventVO = new EventVO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int insertCount = eventDAO.insertArticle(eventVO);
		
		System.out.println("insertCount" + insertCount);
		eventVO.setWriter(request.getParameter("writter"));
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/event/eventForm2.jsp");
		dispatch.forward(request, response);
		
	}
}
