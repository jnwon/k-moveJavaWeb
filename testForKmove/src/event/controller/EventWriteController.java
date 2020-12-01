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
		//doGet(request, response);		
		doHandle2(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");		
		RequestDispatcher dispatch = request.getRequestDispatcher("/event/eventForm2.jsp");
		dispatch.forward(request, response);
		
	}
	
	private void doHandle2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//int numOfMaxMembers = Integer.parseInt(request.getParameter("numOfMaxMembers"));
		String numOfMaxMembers = request.getParameter("numOfMaxMembers");
		//eventVO.setNumOfMaxMembers(numOfMaxMembers);
		//int insertCount = eventDAO.insertArticle(eventVO);
		//System.out.println("insertCount" + insertCount);
		System.out.println("numOfMaxMembers: " + numOfMaxMembers);
		
		RequestDispatcher dispatch = request.getRequestDispatcher("/event/community.jsp");
		dispatch.forward(request, response);
		
	}

}
