package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.MemberJoinProAction;
import action.MemberLoginProAction;
import action.MemberLogoutAction;
import vo.ActionForward;

@WebServlet("*.me")
public class MemberFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("MemberFrontController");
		
		request.setCharacterEncoding("UTF-8");// 한글 처리
		
		String command = request.getServletPath(); // 서블릿 주소 가져오기
				
		Action action = null;
		ActionForward forward = null;
	
		if(command.equals("/LoginForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/loginForm.jsp");
			
		} else if(command.equals("/LoginPro.me")) {
//			System.out.println("loginPro.me");
			action = new MemberLoginProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/Logout.me")) {
			action = new MemberLogoutAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/JoinForm.me")) {
			forward = new ActionForward();
			forward.setPath("/member/joinForm.jsp");
		} else if(command.equals("/JoinPro.me")) {
			action = new MemberJoinProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				// isRedirect() 가 true 일 경우 = Redirect 방식일 경우
				// response 객체의 sendRedirect() 메서드를 호출하여 포워딩 주소를 전달하여 포워딩 수행
				response.sendRedirect(forward.getPath());
			}else { // isRedirect() 가 false 일 경우 = Dispatch 방식일 경우
				// request 객체로부터 getRequestDispatcher() 메서드를 호출하여 객체를 리턴받음
				// => 파라미터로 포워딩 주소를 전달

				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				// RequestDispatcher 객체의 forward() 메서드를 호출하여 포워딩(이동) 수행
				// => 파라미터로 request 객체와 response 객체 전달
				dispatcher.forward(request, response);
			}
		} else {
			System.out.println("-- ActionForward object value is null --");
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
