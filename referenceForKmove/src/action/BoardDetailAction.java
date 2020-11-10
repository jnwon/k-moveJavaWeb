package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.boardDetailService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("BoardDetailAction : execute()");
		
		// URL 을 사용하여 전달받은 파라미터(board_num, page) 가져오기
		// => board_num 은 int형 변수, page 는 String형 변수에 저장
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		// BoardDetailService 클래스의 getArticle() 메서드를 호출하여 게시물 정보 가져오기
		// => 파라미터로 글 번호(board_num) 전달, 리턴타입 BoardBean
		boardDetailService boardDetailService = new boardDetailService();
		BoardBean article = boardDetailService.getArticle(board_num);
//		System.out.println("action article : " + article);
		// 게시물 정보(BoardBean 객체), 페이지번호(page) 를 request 객체에 저장
		if(article != null) {
			boardDetailService.plusReadCount(board_num);
		}
		
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		
		// ActionForward 객체를 생성하여 board 폴더 내의 qna_board_view.jsp 로 이동 설정
		ActionForward action = new ActionForward();
		action.setPath("/board/qna_board_view.jsp");
		
		return action;
	}

}
