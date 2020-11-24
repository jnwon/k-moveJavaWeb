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
	
	public int insertEvent(int eventsNo) {
		
		EventVO eventVO = null;
		
		int insertCount = 0;
		try {
			conn = dataFactory.getConnection();
			String query = "SELECT * from events WHERE no=?";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			pstmt.setInt(1, eventsNo);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				eventVO = new EventVO();
				eventVO.setNo(rs.getInt("no"));
				eventVO.setTitle(rs.getString("title"));
				eventVO.setWriter(rs.getString("writer"));
				eventVO.setPublishedDate(rs.getString("publishedDate"));
				eventVO.setIsOpened(rs.getInt("isOpened"));
				eventVO.setIsLocked(rs.getInt("isLocked"));
				eventVO.setPassword(rs.getInt("password"));
				eventVO.setNumOfMaxMembers(rs.getInt("numOfMaxMembers"));
				eventVO.setNumOfComment(rs.getInt("numOfComment"));
				eventVO.setNumOfViews(rs.getInt("numOfViews"));
				eventVO.setNumOfLikes(rs.getInt("numOfLikes"));
				eventVO.setContents(rs.getString("contents"));

			}
			

		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return insertCount;
	}
	//INSERT INTO `events` (`no`, `title`, `writer`, `publishedDate`, `isOpened`, `password`, `contents`, `numOfAttachLinks`, `numOfMaxMembers`, `numOfJoiningMembers`, `numOfComment`, `numOfViews`, `numOfLikes`) VALUES
}