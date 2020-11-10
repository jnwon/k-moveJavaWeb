package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("2.BoardModifyProAction");
		
		ActionForward forward = null;
		
		// 파라미터로 전달된 글번호(board_num), 페이지번호(page) 가져와서 변수에 저장
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		// 게시물 수정을 위한 본인 확인 작업 => BoardModifyProService 클래스의 isArticleWriter() 메서드 호출
		// => 파라미터 : 글번호(board_num) & 패스워드(board_pass), 리턴타입 : boolean(isRightUser)
		BoardModifyProService boardModifyProService = new BoardModifyProService();
		boolean isRightUser = boardModifyProService.isArticleWriter(board_num, request.getParameter("board_pass"));
//		System.out.println("3.BoardModifyProAction - isArticleWriter");
		// 리턴된 isRightUser 가 false 일 경우
		// 자바스크립트를 사용하여 "수정 권한이 없습니다!" 출력 후 이전 페이지로 이동
		// 아니면 "수정 완료!" 출력
		if(!isRightUser) {
			// HTML 문서 형식으로 출력하기 위해 response 객체의 setContentType() 메서드 호출 => HTML 타입 지정
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();// HTML 태그 출력을 위한 Writer 객체 가져오기
			// out 객체의 println() 메서드를 호출하여 HTML 태그 작성
			out.println("<script>"); // 자바스크립트 실행을 위한 <script> 시작 태그
			out.println("alert('You do not have edit permission!')"); // alert dialog 출력
			out.println("history.back()");// 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 위한 <script> 끝 태그
		} else {
			// 본인 확인 완료 시 BoardBean 객체에 수정된 게시물 내용 저장 후
			// BoardModifyProService 클래스의 modifyArticle() 메서드를 호출
			// => 파라미터 : BoardBean   리턴타입 : boolean(isModifySuccess)
			BoardBean article = new BoardBean();
			article.setBoard_num(board_num);
			article.setBoard_subject(request.getParameter("board_subject"));
			article.setBoard_content(request.getParameter("board_content"));
			
			boolean isModifySuccess = boardModifyProService.modifyArticle(article);
//			System.out.println("5.BoardModifyProAction - modifyArticle");
			if(!isModifySuccess) {
				// 리턴받은 수정 결과(isModifySuccess)가 false 일 경우
				// => 자바스크립트를 사용하여 "글 수정 실패!" 출력 후 이전 페이지로 이동
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('Post edit failed')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				// 리턴받은 수정 결과(isModifySuccess)가 true 일 경우
				// => ActionForward 객체를 사용하여 수정된 게시물로 이동(Redirect 방식)
				//    (URL : BoardDetail.bo?board_num=x&page=y)
				forward = new ActionForward();
				forward.setPath("BoardDetail.bo?board_num=" + board_num + "&page=" + page);
				forward.setRedirect(true);
			}
			
		}

		return forward;
	}

}
