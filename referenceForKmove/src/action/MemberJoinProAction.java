package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MemberJoinProService;
import vo.ActionForward;
import vo.MemberBean;

public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("MemberJoinProAction");
		ActionForward forward = null;

		// 파라미터 4개 가져오기
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
		
		// 파라미터 4개 => MemberBean 객체에 저장
		MemberBean member = new MemberBean(name, id, pass, email);
		// MemberJoinProService 클래스의 joinMember() 메서드 호출하여 추가 작업 요청
		// => 파라미터 : MemberBean      리턴타입 : boolean
		MemberJoinProService memberJoinProService = new MemberJoinProService();
		boolean isJoinSuccess = memberJoinProService.joinMember(member);
//		System.out.println("isJoinSuccess : " + isJoinSuccess);

		if(!isJoinSuccess) {// 가입 실패
			// HTML 문서 형식으로 출력하기 위해 response 객체의 setContentType() 메서드 호출 => HTML 타입 지정
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // HTML 태그 출력을 위한 Writer 객체 가져오기
			// out 객체의 println() 메서드를 호출하여 HTML 태그 작성
			out.println("<script>"); // 자바스크립트 실행을 위한 <script> 시작 태그
			out.println("alert('Joing Membership failed!')"); // alert dialog 출력
			out.println("history.back()"); // 또는 out.println("history.go(-1)");  // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 위한 <script> 끝 태그
		} else { // 글쓰기 성공
			forward = new ActionForward(); // ActionForward 객체 생성
			forward.setPath("index.jsp"); // 서블릿 주소 지정
			forward.setRedirect(true); // Redirect 방식(true) 지정
		}
		
		return forward;
	}

}
