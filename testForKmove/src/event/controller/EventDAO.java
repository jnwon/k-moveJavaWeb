package event.controller;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class EventDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;

	public EventDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/MySQL");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<EventVO> listEventsForMain() {
		List<EventVO> eventsList = new ArrayList();
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT e.no, e.title, m.name, e.publishedDate, e.isOpened, e.password, e.numOfMaxMembers, e.numOfJoiningMembers, e.numOfComment, e.numOfViews, e.numOfLikes from events as e join Members as m where e.writer = m.no order by publishedDate DESC";
			//System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("e.no");
				String title = rs.getString("e.title");
				String writer = rs.getString("m.name");
				String publishedDate = rs.getString("e.publishedDate");
				int isOpened = rs.getInt("e.isOpened");
				int isLocked = rs.getInt("e.password") > 0 ? 1 : 0;
				int numOfMaxMembers = rs.getInt("e.numOfMaxMembers");
				int numOfJoiningMembers = rs.getInt("e.numOfJoiningMembers");
				int numOfComment = rs.getInt("e.numOfComment"); 
				int numOfViews = rs.getInt("e.numOfViews");
				int numOfLikes = rs.getInt("e.numOfLikes");
				EventVO eventVO = new EventVO(no, title, writer, publishedDate, isOpened, isLocked, numOfMaxMembers, numOfJoiningMembers, numOfComment, numOfViews, numOfLikes);
				eventsList.add(eventVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return eventsList;
	}
	
	public EventVO getDetailedEvent(int no) {
		
		EventVO detailedEvent = null;
		
		try {
			conn = dataFactory.getConnection();
			//String query = "SELECT * from events WHERE no=?";
			String query = "SELECT * from events WHERE no="+no;
			System.out.println("no from DAO" + no);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			//pstmt.setInt(1, no);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				detailedEvent = new EventVO();
				detailedEvent.setNo(rs.getInt("no"));
				detailedEvent.setTitle(rs.getString("title"));
				detailedEvent.setWriter(rs.getString("writer"));
				detailedEvent.setPublishedDate(rs.getString("publishedDate"));
				detailedEvent.setIsOpened(rs.getInt("isOpened"));
				//detailedEvent.setIsLocked(rs.getInt("isLocked"));
				detailedEvent.setPassword(rs.getInt("password"));
				//detailedEvent.setIsLocked(rs.getInt("password") > 0 ? 1 : 0);
				detailedEvent.setNumOfMaxMembers(rs.getInt("numOfMaxMembers"));
				detailedEvent.setNumOfJoiningMembers(rs.getInt("numOfJoiningMembers"));
				detailedEvent.setNumOfComment(rs.getInt("numOfComment"));
				detailedEvent.setNumOfViews(rs.getInt("numOfViews"));
				detailedEvent.setNumOfLikes(rs.getInt("numOfLikes"));
				detailedEvent.setNumOfAttachLinks(rs.getInt("numOfAttachLinks"));
				detailedEvent.setContents(rs.getString("contents"));
				detailedEvent.setStartTime(rs.getString("startTime"));
				detailedEvent.setEndTime(rs.getString("endTime"));
				detailedEvent.setEventPlace(rs.getString("eventPlace"));
				
			}
			rs.close();
			pstmt.close();
 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return detailedEvent;
	}
	
	public int insertArticle(EventVO eventVO) {
		
		int insertCount = 0; // executeUpdate() 메서드를 통해 글쓰기 작업 수행 결과를 저장할 변수
		
		try {
			conn = dataFactory.getConnection();
			// INSERT 구문을 사용하여 전달된 항목들 및 기타 데이터를 board 테이블에 추가
			// 글번호(board_num) : 자동 증가 옵션이 설정되어 있으므로 null 값 전달(쿼리에서 직접 전달)
			// 작성자(board_name), 패스워드(board_pass), 제목(board_subject), 본문(board_content), 파일명(board_file)
			// 참조글 번호(board_re_ref) : 자동증가로 인해 글 번호 식별이 불가능하므로 임시번호 -1 지정
			// 들여쓰기 레벨(board_re_lev) : 현재 글이 원본 글이므로 0 사용
			// 답글 순서 번호(board_re_seq) : 현재 글이 원본 글이므로 0 사용
			// 조회수(board_readcount) : 새 글이므로 0 사용
			// 작성일(board_date) : 현재 DB 의 날짜 및 시각 정보 전달(now() 함수를 사용하여 쿼리에서 직접 전달)

			String query = "INSERT INTO events VALUES (null,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			
			// Connection 객체로부터 PreparedStatement 객체 가져와서 쿼리 전달
			pstmt = conn.prepareStatement(query);
			// ? 파라미터값 채우기
			pstmt.setString(1, eventVO.getTitle());
			pstmt.setString(2, eventVO.getWriter());
			pstmt.setString(3, eventVO.getPublishedDate());
			pstmt.setString(4, eventVO.getContents());
			pstmt.setString(5, eventVO.getStartTime());
			pstmt.setString(6, eventVO.getEndTime());
			pstmt.setString(7, eventVO.getEventPlace());
			pstmt.setInt(8, eventVO.getIsOpened());
			pstmt.setInt(9, eventVO.getIsLocked());
			pstmt.setInt(10, eventVO.getPassword());
			pstmt.setInt(11, eventVO.getNumOfMaxMembers());
			pstmt.setInt(12, eventVO.getNumOfJoiningMembers());
//			pstmt.setInt(6, -1);// board_re_ref(새 글에 참조글 번호는 자기 자신 => 임시번호로 -1 부여)
//			pstmt.setInt(7, 0); // board_re_lev
//			pstmt.setInt(8, 0); // board_re_seq
			pstmt.setInt(13, 0); // board_readcount
			// 쿼리 실행
			insertCount = pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return insertCount;
	}

}