package svc;

import java.sql.Connection;

import dao.BoardDAO;

import static db.JdbcUtil.*;
import vo.BoardBean;

public class boardDetailService {

	public BoardBean getArticle(int board_num) {
//		System.out.println("boardDetailService : getArticle");
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		// BoardDAO 클래스의 selectArticle() 메서드 호출하여 DB 작업 수행
		// => 파라미터 : board_num, 리턴타입 : BoardBean
		BoardBean article = boardDAO.selectArticle(board_num);
		
		close(con);
		
		return article;
	}

	public void plusReadCount(int board_num) throws Exception{
//		System.out.println("BoardDetailService - plusReadCount()");
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		// BoardDAO 클래스의 updateReadcount() 메서드 호출하여 DB 작업 수행
		// => 파라미터 : board_num, 리턴타입 : int
		int updateCount = boardDAO.updateReadcount(board_num);
		
		// 리턴된 결과(updateCount) 가 0보다 크면 commit, 아니면 rollback 수행 
		if(updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
				
	}
}
