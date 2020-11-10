package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import svc.MemberLoginService;
import vo.ActionForward;
import vo.BoardBean;
import vo.MemberBean;
import vo.BoardBean;

public class MemberLoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("MemberLoginProAction");
		ActionForward forward = null;
		
		// 전달받은 파라미터(id, passwd) 가져오기
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
//		System.out.println("pass : " + pass);
		
		MemberBean member = new MemberBean(id, pass);
		
		MemberLoginService memberLoginService = new MemberLoginService();
		int loginResult = memberLoginService.isLoginMember(member);
		
		if(loginResult == 0) {
//			System.out.println("아이디 없음!");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('No ID')");
			out.println("history.back()");
			out.println("</script>");

		} else if(loginResult == -1) {
//			System.out.println("패스워드 틀림!");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Password incorrect')");
			out.println("history.back()");
			out.println("</script>");
		} else {
//			System.out.println("로그인 성공!");
			
			// 세션을 사용하여 로그인 한 ID 정보를 저장
			// JSP 페이지에서는 내장객체가 존재하므로 session.XXX() 메서드를 호출하면 되지만
			// 자바에서는 HttpSession 인터페이스를 사용하여 request 객체로부터 session 객체를 가져와야함
			HttpSession session = request.getSession();
			// HttpSession 객체의 setAttiribute() 메서드를 호출하여 세션 정보 저장
			session.setAttribute("sid", id);
			
			// index.jsp 로 이동
			forward = new ActionForward();
//			forward.setPath("index.jsp");
			forward.setPath("index.jsp"); // MVC_Board 프로젝트의 홈으로 이동 = index.jsp
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
