package svc;

import java.sql.Connection;

import dao.BoardDAO;

import static db.JdbcUtil.*;

public class BoardDeleteProService {
	
	public boolean isArticleWriter(int board_num, String board_pass) {
//		System.out.println("BoardDeleteProService - isArticleWriter()");
		
		boolean isArticleWriter = false;
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		// BoardDAO 클래스의 isArticleWriter() 메서드를 호출하여 패스워드 일치 여부 확인
		// 파라미터 : board_num, board_pass    리턴타입 : boolean(isArticleWriter)
		isArticleWriter = boardDAO.isArticleWriter(board_num, board_pass);
		
		close(con);		
		
		return isArticleWriter;
	}
	public boolean removeArticle(int board_num) {
		boolean isRemoveSuccess = false;
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		// BoardDAO 클래스의 deleteArticle() 메서드 호출하여 게시물 삭제
		// => 파라미터 : 글번호(board_num)   리턴타입 : int(deleteCount)
		int deleteCount = boardDAO.deleteArticle(board_num);
		
		// deleteCount 가 0보다 크면 commit 수행 및 isRemoveSuccess 를 true 로 변경
		// 아니면 rollback 수행
		if(deleteCount > 0) {
			commit(con);
			isRemoveSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
				
		return isRemoveSuccess;
	}
}
