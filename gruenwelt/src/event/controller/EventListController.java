package event.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class EventListController
 */
@WebServlet("/EventListController")
public class EventListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	EventDAO eventDAO;

	public void init() throws ServletException {
		eventDAO = new EventDAO();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//List<EventVO> eventList = eventDAO.listEventsForMain();
		//request.setAttribute("eventList", eventList);
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		RequestDispatcher dispatch = request.getRequestDispatcher("/event/community.jsp");
		dispatch.forward(request, response);
	}

}
