package svc;

import java.sql.Connection;

import dao.BoardDAO;

import static db.JdbcUtil.*;
import vo.BoardBean;

public class BoardModifyProService {

	public boolean isArticleWriter(int board_num, String board_pass) throws Exception {
		// 글 번호에 해당하는 게시물에 저장된 패스워드와 입력받은 패스워드를 비교하여 일치여부 리턴
//		System.out.println("3.BoardModifyService - isArticleWriter()");

		boolean isArticleWriter = false;
		
		Connection con = getConnection();
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.setConnection(con);;
		
		// BoardDAO 클래스의 isArticleWriter() 메서드를 호출하여 패스워드 판별
		// => 파라미터 : 글번호, 패스워드    리턴타입 : boolean(isArticleWriter)
		isArticleWriter = boardDAO.isArticleWriter(board_num, board_pass);
		
		close(con);
		return isArticleWriter;
	}
	// 글 번호에 해당하는 게시물에 저장된 패스워드와 입력받은 패스워드를 비교하여 일치여부 리턴
	public boolean modifyArticle(BoardBean article) {
//		System.out.println("6.BoardModifyService - modifyArticle");
		int updateCount = 0;
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		BoardDAO boardDAO = new BoardDAO();
		boardDAO.setConnection(con);
		
		// BoardDAO 클래스의 updateArticle() 메서드를 호출하여 글 수정
		// => 파라미터 : BoardBean    리턴타입 : int(updateCount)
		updateCount = boardDAO.updateArticle(article);
				
		// updateCount 가 0보다 크면 commit 을 수행하고, isModifySuccess 를 true 로 변경 
		// 아니면 rollback 수행
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		return isModifySuccess;
	}
}
