package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardReplyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardReplyProAction");
		
		ActionForward forward = null;
		
		// 파라미터로 전달된 데이터를 BoardBean 객체(article)에 저장
		// 단, page 는 BoardBean 객체가 아닌 변수에 저장
		String page = request.getParameter("page");
		
		BoardBean article = new BoardBean();
		article.setBoard_num(Integer.parseInt(request.getParameter("board_num")));
		article.setBoard_name(request.getParameter("board_name"));
		article.setBoard_pass(request.getParameter("board_pass"));
		article.setBoard_subject(request.getParameter("board_subject"));
		article.setBoard_content(request.getParameter("board_content"));
		article.setBoard_re_ref(Integer.parseInt(request.getParameter("board_re_ref")));
		article.setBoard_re_lev(Integer.parseInt(request.getParameter("board_re_lev")));
		article.setBoard_re_seq(Integer.parseInt(request.getParameter("board_re_seq")));

		// BoardReplyProService 클래스의 replyArticle() 메서드 호출
		// => 파라미터 : BoardBean 객체    리턴타입 : boolean(isReplySuccess)
		BoardReplyProService boardReplyProService = new BoardReplyProService();
		boolean isReplySuccess = boardReplyProService.replyArticle(article);
//		System.out.println(isReplySuccess);

		// isReplySuccess 가 false 일 경우
		// => 자바스크립트를 사용하여 "답변글 등록 실패!" 출력 및 이전페이지로 돌아가기
		// isReplySuccess 가 true 일 경우
		// => ActionForward 객체를 통해 BoardList.bo 페이지로 이동 설정(파라미터 page 전달)
		if(!isReplySuccess) {
			response.setContentType("text/html); charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('Failed to register reply')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("BoardList.bo?page=" + page);
			forward.setRedirect(true);
		}
		return forward;
	}

}
