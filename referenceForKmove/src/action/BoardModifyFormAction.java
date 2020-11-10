package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.boardDetailService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 원본 게시물 내용을 가져와서 수정폼에 함께 출력
//		System.out.println("BoardModifyFormAction");
		
		// 파라미터로 전달된 글번호(board_num), 페이지번호(page) 가져와서 변수에 저장
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		// 원본 게시물을 가져오기 위해 별도의 Service 클래스를 새로 정의하지 않고
		// 기존에 정의된 BoardDetailService 클래스의 getArticle() 메서드를 호출하여 원본 게시물 내용 가져오기
		BoardBean article = null;
		boardDetailService boardDetailService = new boardDetailService();
		article = boardDetailService.getArticle(board_num);
	
//		System.out.println(article.getBoard_content());
		
		// 원본 게시물과 페이지번호를 request 객체에 저장
		request.setAttribute("article", article);
		request.setAttribute("page", page);
//		System.out.println("page : " + page);

		// ActionForward 객체를 사용하여 board 폴더 내의 qna_board_modify.jsp 페이지 이동 설정
		ActionForward forward = new ActionForward();
		forward.setPath("/board/qna_board_modify.jsp");
		
		return forward;
	}

}
