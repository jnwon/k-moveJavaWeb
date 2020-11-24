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
			String query = "SELECT * from events WHERE no=?";
			//String query = "SELECT e.no, e.title, m.name, e.publishedDate, e.isOpened, e.password, e.numOfMaxMembers, e.numOfJoiningMembers, e.numOfComment, e.numOfViews, e.numOfLikes from events as e join Members as m where e.writer = m.no order by publishedDate DESC";

			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			
			pstmt.setInt(1, no);
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
				
//				detailedEvent = new EventVO();
//				detailedEvent.setNo(rs.getInt("e.no"));
//				detailedEvent.setTitle(rs.getString("e.title"));
//				detailedEvent.setWriter(rs.getString("m.name"));
//				detailedEvent.setPublishedDate(rs.getString("e.publishedDate"));
//				detailedEvent.setIsOpened(rs.getInt("e.isOpened"));
//				//detailedEvent.setIsLocked(rs.getInt("isLocked"));
//				//detailedEvent.setPassword(rs.getInt("password"));
//				detailedEvent.setIsLocked(rs.getInt("e.password") > 0 ? 1 : 0);
//				detailedEvent.setNumOfMaxMembers(rs.getInt("e.numOfMaxMembers"));
//				detailedEvent.setNumOfJoiningMembers(rs.getInt("e.numOfJoiningMembers"));
//				detailedEvent.setNumOfComment(rs.getInt("e.numOfComment"));
//				detailedEvent.setNumOfViews(rs.getInt("e.numOfViews"));
//				detailedEvent.setNumOfLikes(rs.getInt("e.numOfLikes"));
//				//detailedEvent.setNumOfAttachLinks(rs.getInt("numOfAttachLinks"));
//				//detailedEvent.setContents(rs.getString("contents"));
				
			}
			rs.close();
			pstmt.close();
 
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return detailedEvent;
	}
	//INSERT INTO `events` (`no`, `title`, `writer`, `publishedDate`, `isOpened`, `password`, `contents`, `numOfAttachLinks`, `numOfMaxMembers`, `numOfJoiningMembers`, `numOfComment`, `numOfViews`, `numOfLikes`) VALUES

}