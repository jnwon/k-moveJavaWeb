package log.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
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
		//List<EventVO> eventList = eventDAO.listEventsForMain();
		//request.setAttribute("eventList", eventList);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//RequestDispatcher dispatch = request.getRequestDispatcher("/LogController");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		LoginMemberVO logmemVO = new LoginMemberVO();
		logmemVO.setId(id);
		logmemVO.setPwd(pwd);
		LoginMemberDAO logmemDAO = new LoginMemberDAO();
		boolean result = logmemDAO.isExisted(logmemVO);
		
		if (session.isNew()) {
			if (id != null && pwd != null) {
				session.setAttribute("uname", id);
				session.setAttribute("pswd", pwd);
				out.println("<html><body>");
				out.println("<a href='/testForKmove/main.um'>로그인 상태 확인</a>");
				out.println("</html></body>");
			}
			else {
				//dispatch.forward(request, response);
				out.println("<html><body>");
				out.println("회원 아이디가 틀립니다.");
				out.println("</html></body>");
				session.invalidate();
			}
		}
		else {
			id = (String) session.getAttribute("uname");
			pwd = (String) session.getAttribute("pswd");
			if (id != null && id.length() != 0 && pwd != null && pwd.length() != 0) {
				out.println("안녕하세요 " + id + "님!!!");
			}
			
			else {
				out.println("<html><body>");
				out.println("회원 아이디가 틀립니다.");
				out.println("</html></body>");
				session.invalidate();
			}
		}
	}
}
