package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.boardDetailService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("BoardReplyFormAction");
		ActionForward forward = null;
		
		// 파라미터 2개 가져오기
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		// BoardDetailService 클래스의 getArticle() 메서드를 호출하여 원본글 상제 정보 가져오기
		// 파라미터 : 글번호(board_num)     리턴타입 : BoardBean(article)
		boardDetailService boardDetailService = new boardDetailService();
		BoardBean article = boardDetailService.getArticle(board_num);
		
		// request 객체의 setAttribute() 메서드를 호출하여 BoardBean 객체, page 저장
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		
		// ActionForward 객체를 생성하여 board 폴더 내의 qna_board_reply.jsp 로 이동 설정
		forward = new ActionForward();
		forward.setPath("/board/qna_board_reply.jsp");
		
		return forward;
	}

}
