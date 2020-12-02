package eea.controller;

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

public class EeaDAO {
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	public EeaDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/MySQL");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<EeaVO> eea() {
		List<EeaVO> articlesList = new ArrayList();
		try {
			conn = dataFactory.getConnection();
			String query = "select * from  articles where source='EEA' limit 4"; // SQL�� �ۼ�
			System.out.println(query);
			pstmt = conn.prepareStatement(query); // PrepareStatement ��ü�� �����ϸ鼭 SQL���� ���ڷ� ���� 
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String source = rs.getString("source");
				String title = rs.getString("title");
				String link = rs.getString("link");
				EeaVO eeaVO = new EeaVO(no, source, title, link); // ��ȸ�� ��������� ���ڵ庰�� EeaVO ��ü�� �Ӽ��� ����
				articlesList.add(eeaVO); // articlesList�� eeaVO ��ü���� ���ʴ�� ����
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return articlesList;
	}

	public void addArticle(EeaVO m) {
		try {
			conn = dataFactory.getConnection();
			String source = m.getSource();
			String category = m.getCategory();
			String title = m.getTitle();
			String link = m.getLink();
			String query = "INSERT INTO articles(source, category, title, link)" + " VALUES(?, ? ,? ,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, source);
			pstmt.setString(2, category);
			pstmt.setString(3, title);
			pstmt.setString(4, link);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean isArticleInTable(String source, String category, String link) {
		
		boolean result = false;

		try {
			conn = dataFactory.getConnection();
			String query = "select * from  articles where source='" + source + "' and category='" + category + "' and link='" + link + "'";
			pstmt = conn.prepareStatement(query); // PrepareStatement ��ü�� �����ϸ鼭 SQL���� ���ڷ� ���� 
			ResultSet rs = pstmt.executeQuery();
			if (rs != null) 
			{
			  rs.last();    // moves cursor to the last row
			  if(rs.getRow() > 0) {
				  //System.out.println(query + "\n select success");
				  result = true;
			  }
			  else {
				  //System.out.println(query + "\n select failed");
				  result = false;
			  }
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
