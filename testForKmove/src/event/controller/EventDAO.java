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
			String query = "SELECT e.title, m.name, e.publishedDate, e.isOpened, e.password, e.numOfMaxMembers, e.numOfJoiningMembers, e.numOfComment, e.numOfViews, e.numOfLikes from events as e join Members as m where e.writer = m.no order by publishedDate DESC";
			//System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
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
				EventVO eventVO = new EventVO(title, writer, publishedDate, isOpened, isLocked, numOfMaxMembers, numOfJoiningMembers, numOfComment, numOfViews, numOfLikes);
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
}