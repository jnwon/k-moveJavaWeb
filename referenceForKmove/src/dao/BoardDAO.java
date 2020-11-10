package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import vo.BoardBean;

import static db.JdbcUtil.*;

public class BoardDAO {
	// ----------------------------------------------------
	// 싱글톤 패턴을 활용한 BoardDAO 인스턴스 생성 및 리턴
	public BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() { 
		return instance;
	}
	// ----------------------------------------------------
	Connection con;

	// 외부로부터 Connection 객체를 전달받아 저장할 setConnection 메서드
	public void setConnection(Connection con) {
		this.con = con;
	}

	// ============ 글 쓰기 ============= 
	public int insertArticle(BoardBean boardBean) {
//		System.out.println("BoardDAO - insertArticle()");
		int insertCount = 0; // executeUpdate() 메서드를 통해 글쓰기 작업 수행 결과를 저장할 변수

		PreparedStatement pstmt = null;
		
		try {
			// INSERT 구문을 사용하여 전달된 항목들 및 기타 데이터를 board 테이블에 추가
			// 글번호(board_num) : 자동 증가 옵션이 설정되어 있으므로 null 값 전달(쿼리에서 직접 전달)
			// 작성자(board_name), 패스워드(board_pass), 제목(board_subject), 본문(board_content), 파일명(board_file)
			// 참조글 번호(board_re_ref) : 자동증가로 인해 글 번호 식별이 불가능하므로 임시번호 -1 지정
			// 들여쓰기 레벨(board_re_lev) : 현재 글이 원본 글이므로 0 사용
			// 답글 순서 번호(board_re_seq) : 현재 글이 원본 글이므로 0 사용
			// 조회수(board_readcount) : 새 글이므로 0 사용
			// 작성일(board_date) : 현재 DB 의 날짜 및 시각 정보 전달(now() 함수를 사용하여 쿼리에서 직접 전달)

			String sql = "INSERT INTO board VALUES (null,?,?,?,?,?,?,?,?,?,now());";
			
			// Connection 객체로부터 PreparedStatement 객체 가져와서 쿼리 전달
			pstmt = con.prepareStatement(sql);
			// ? 파라미터값 채우기
			pstmt.setString(1, boardBean.getBoard_name());
			pstmt.setString(2, boardBean.getBoard_pass());
			pstmt.setString(3, boardBean.getBoard_subject());
			pstmt.setString(4, boardBean.getBoard_content());
			pstmt.setString(5, boardBean.getBoard_file());
			pstmt.setInt(6, -1);// board_re_ref(새 글에 참조글 번호는 자기 자신 => 임시번호로 -1 부여)
			pstmt.setInt(7, 0); // board_re_lev
			pstmt.setInt(8, 0); // board_re_seq
			pstmt.setInt(9, 0); // board_readcount
			// 쿼리 실행
			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("insertArticle() error : " + e.getMessage());
		} finally {
			close(pstmt);
		}

		return insertCount;
	}

	public void updateBoard_re_ref(BoardBean boardBean) {
		// 등록된 새 글을 조회 후 해당 글 번호(board_num)를 사용하여 참조글번호(board_re_ref) 업데이트
//		System.out.println("BoardDAO - updateBoard_re_ref()");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 1. 새 글에 대한 번호(board_num) 조회 => 작성자(board_name)와 참조글번호(board_re_ref)를 사용
			//    => 작성자는 BoardBean 객체에 저장된 이름을 사용하여, 참조글번호는 -1 사용
			String sql = "SELECT board_num FROM board WHERE board_name=? AND board_re_ref=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, boardBean.getBoard_name());
			pstmt.setInt(2, -1);
			rs = pstmt.executeQuery();

			if(rs.next()) {
//				System.out.println("BoardDAO sed sql: updateBoard_re_ref");
				int board_num = rs.getInt(1);// 새 글의 번호 가져오기
				// 2. 새 글에 대한 참조글번호 업데이트 수행
				// => 작성자(board_name)와 참조글번호(board_re_ref)를 사용하여 새 글 번호로 업데이트
				sql = "UPDATE board SET board_re_ref=? WHERE board_name=? AND board_re_ref=?";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, board_num);
				pstmt.setString(2, boardBean.getBoard_name());
				pstmt.setInt(3, -1);
				pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}	
	}

	public int selectListCount() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int listCount = 0;
		try {
			String sql = "SELECT count(*) FROM board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<BoardBean> selectArticleList(int page, int limit) {
		// 게시물 목록 조회 후 리턴
		ArrayList<BoardBean> articleList = new ArrayList<BoardBean>();
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		/* 
		 * 전체 게시물 중 원하는 페이지의 게시물 첫번째 row 번호 설정
		 * - 원본 글 번호(board_re_ref) 기준으로 내림차순 정렬
		 * - 글 순서번호(board_re_seq) 기준으로 오름차순 정렬
		 * - 조회할 게시물 갯수 : 첫번째 게시물 위치 ~ limit 수 만큼
		 *   첫번째 게시물 위치 = (현재페이지 - 1) * 10
		 * 
		 * ex) 현재 페이지(page) 가 1 페이지 일 경우 : 게시물 조회 결과의 0번 행부터 10개 가져오기
		 */
		int startRow = (page - 1) * 10;// 첫번째 게시물 행(row) 번호 계산
		
		try {
			// 조회 결과(ResultSet) 객체가 존재할 경우
			// 반복문을 사용하여 1개 게시물 정보(패스워드 제외한 나머지)를 BoardBean 객체에 저장하고
			// BoardBean 객체를 ArrayList<BoardBean> 객체에 저장 반복
			String sql = "SELECT * FROM board ORDER BY board_re_ref DESC, board_re_seq ASC LIMIT ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, limit);
			rs = pstmt.executeQuery();
            // ResultSet 객체 내의 모든 레코드를 각각 레코드별로 BoardBean 에 담아서 ArrayList 객체에 저장
            // => 패스워드 제외
			while(rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setBoard_num(rs.getInt("board_num"));
                boardBean.setBoard_name(rs.getString("board_name"));
                boardBean.setBoard_subject(rs.getString("board_subject"));
                boardBean.setBoard_content(rs.getString("board_content"));
                boardBean.setBoard_file(rs.getString("board_file"));
                boardBean.setBoard_re_ref(rs.getInt("board_re_ref"));
                boardBean.setBoard_re_lev(rs.getInt("board_re_lev"));
                boardBean.setBoard_re_seq(rs.getInt("board_re_seq"));
                boardBean.setBoard_readcount(rs.getInt("board_readcount"));
                boardBean.setBoard_date(rs.getDate("board_date"));
			
                articleList.add(boardBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return articleList;
	}
	// ============ 게시물 상세 내용 조회 ============
	public BoardBean selectArticle(int board_num) {
		// 게시물 상세 내용 조회 후 BoardBean 객체(article)에 저장
		// SELECT 문을 사용하여 게시물 조회 후 정보를 BoardBean 객체에 저장(패스워드 제외)
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		BoardBean article = null;
		// 글번호(board_num)에 해당하는 게시물 정보 조회
		try {
			String sql = "SELECT * FROM board WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();

			// 게시물이 존재할 경우 BoardBean 객체에 저장
			if(rs.next()) {
				article = new BoardBean();
				article.setBoard_num(rs.getInt("board_num"));
				article.setBoard_name(rs.getString("board_name"));
				article.setBoard_subject(rs.getString("board_subject"));
				article.setBoard_content(rs.getString("board_content"));
				article.setBoard_file(rs.getString("board_file"));
				article.setBoard_re_ref(rs.getInt("board_re_ref"));
				article.setBoard_re_lev(rs.getInt("board_re_lev"));
				article.setBoard_re_seq(rs.getInt("board_re_seq"));
				article.setBoard_readcount(rs.getInt("board_readcount"));
				article.setBoard_date(rs.getDate("board_date"));
			}
//			System.out.println(article.getBoard_subject());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return article;
	}

	public int updateReadcount(int board_num) {
		// 게시물 조회 수 1 증가 후 결과(updateCount) 리턴
		// UPDATE 문을 사용하여 게시물 조회수(readcount) 를 1 증가시킴
		PreparedStatement pstmt = null;
		int updateCount = 0;

		// board_num 에 해당하는 board_readcount 값을 1 증가
		try {
			String sql = "UPDATE board SET board_readcount = board_readcount + 1 WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return updateCount;
	}
	public boolean isArticleWriter(int board_num, String board_pass) {
		// 글 수정을 위한 본인 확인
		// => 게시물 번호(board_num)에 해당하는 패스워드를 읽어와서 입력받은 패스워드(board_pass)와 비교

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		boolean isArticleWriter = false;
		
		try {
			// == 게시물 번호를 기준으로 패스워드를 조회 후 if문을 사용하여 패스워드 판별하는 방법 ==
//			String sql = "SELECT board_pass FROM board WHERE board_num=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, board_num);
//			rs = pstmt.executeQuery();
//			
//			if(rs.next()) {
//				if(board_pass.equals(rs.getString("board_pass"))) { // 패스워드 일치 여부 판별
//					isArticleWriter = true;
//				}
//			}
			
			// == 게시물 번호와 패스워드를 사용하여 바로 판별하는 방법 ==
			// => 아무 컬럼이나 조회 대상으로 지정해도 무관

			String sql = "SELECT board_pass FROM board WHERE board_num=? AND board_pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, board_pass);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {// 조회 결과가 있을 경우 패스워드가 일치하는 게시물이므로 true 설정
				isArticleWriter = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return isArticleWriter;
	}
	public int updateArticle(BoardBean article) {
		int updateCount = 0;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "UPDATE board SET board_subject=?,board_content=? WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBoard_subject());
			pstmt.setString(2, article.getBoard_content());
			pstmt.setInt(3, article.getBoard_num());
			
			updateCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return updateCount;
	}
	// ========== 글 삭제 ===========
	// => 삭제를 위한 패스워드 확인은 글 수정의 isArticleWriter() 메서드 함께 사용
	public int deleteArticle(int board_num) {
		// 글 번호(board_num) 에 해당하는 게시물 삭제
		int deleteCount = 0;
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM board WHERE board_num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return deleteCount;
	}
	// =========== 답변글 등록 ============
	public int insertReplyArticle(BoardBean article) {
		int insertCount = 0;
		
		PreparedStatement pstmt = null;
		
		// 답변글 등록에 필요한 정렬 작업을 위해 ref, lev, seq 파라미터 가져오기
		int board_re_ref = article.getBoard_re_ref();
		int board_re_lev = article.getBoard_re_lev();
		int board_re_seq = article.getBoard_re_seq();
		
		// 원본글과 ref가 같고, 원본글보다 seq 가 큰 레코드에 대해 seq 를 1씩 증가시킴
		String sql = "UPDATE board SET board_re_seq=board_re_seq+1 WHERE board_re_ref=? AND board_re_seq>?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_re_ref);
			pstmt.setInt(2, board_re_seq);
			int updateCount = pstmt.executeUpdate();
//			System.out.println(updateCount);
			// updateCount 가 0보다 크면 commit 수행
			if(updateCount > 0) {
				commit(con);
			}
			
			// 순서번호(board_re_seq) 와 들여쓰기 레벨(board_re_lev) 변수를 모두 1씩 증가시킴
			board_re_seq += 1;
			board_re_lev += 1;
			
			// 답변글 등록 작업 수행 후 결과를 insertCount 에 리턴
			// => 단, 답변글에는 파일 업로드 기능이 없으므로 파일명을 널스트링("") 으로 설정
			sql = "INSERT INTO board VALUES (null,?,?,?,?,?,?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getBoard_name());
			pstmt.setString(2, article.getBoard_pass());
			pstmt.setString(3, article.getBoard_subject());
			pstmt.setString(4, article.getBoard_content());
			pstmt.setString(5, "");
			pstmt.setInt(6, board_re_ref);
			pstmt.setInt(7, board_re_lev);
			pstmt.setInt(8, board_re_seq);
			pstmt.setInt(9, 0);
			
			insertCount = pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return insertCount;
	}
}
