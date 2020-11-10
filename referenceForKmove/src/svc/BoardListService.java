package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;

import static db.JdbcUtil.*;
import vo.BoardBean;

public class BoardListService {

	public int getListCount() {
//		System.out.println("BoardListService - getListCount()");
		int listCount = 0; // 총 게시물 수 저장할 변수
		// 1. Connection 객체 가져오기
		Connection con = getConnection();
		// 2. DAO 객체 가져오기(싱글톤 패턴)
		BoardDAO boardDAO = BoardDAO.getInstance();
		// 3. DAO 객체에 Connection 객체 전달하기
		boardDAO.setConnection(con);
		// 4. DB 작업을 위한 DAO 객체의 메서드 호출
		// => selectListCount() 메서드를 호출하여 게시물 수 리턴받기
		listCount = boardDAO.selectListCount();

		// 5. Connection 객체 반환하기
		close(con);
		
		return listCount;
	}

	public ArrayList<BoardBean> getArticleList(int page, int limit) {
//		System.out.println("BoardListService - getArticleList()");
		ArrayList<BoardBean> articleList = null;
		// 1. Connection 객체 가져오기
		Connection con = getConnection();
		// 2. DAO 객체 가져오기(싱글톤 패턴)
		BoardDAO boardDAO = BoardDAO.getInstance();
		// 3. DAO 객체에 Connection 객체 전달하기
		boardDAO.setConnection(con);
		// 4. DB 작업을 위한 DAO 객체의 메서드 호출
		// => BoardDAO 객체의 selectArticleList() 메서드를 호출하여 게시물 목록 가져오기
		// => 파라미터 : page, limit, 리턴타입 : ArrayList<BoardBean>
		articleList = boardDAO.selectArticleList(page, limit);
		// 5. Connection 객체 반환하기
		close(con);
		return articleList;
	}
	

}
