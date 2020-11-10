package svc;

import java.sql.Connection;

import dao.BoardDAO;

import static db.JdbcUtil.*;
import vo.BoardBean;

public class BoardReplyProService {

	public boolean replyArticle(BoardBean article) {
//		System.out.println("BoardReplyProService-replyArticle");
		boolean isReplySuccess = true;
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con); // DAO 객체에 Connection 객체 전달
		
		
		// BoardDAO 클래스의 insertReplyArticle() 메서드를 호출하여 답변글 등록 작업 수행
		// => 파라미터 : BoardBean 객체     리턴타입 : int(insertCount)
		int insertCount = boardDAO.insertReplyArticle(article);
//		System.out.println(insertCount);
		// insertCount 가 0보다 크면 commit 작업 수행, isReplySuccess 를 true 로 변경
		// 아니면 rollback 수행
		if(insertCount > 0) {
			commit(con);
			isReplySuccess = true;
		} else {
			rollback(con);
		}

		close(con);
		
		return isReplySuccess;
	}
}
