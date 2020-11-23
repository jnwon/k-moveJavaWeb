package unep.controller;

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

public class UnepDAO {
	 
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public UnepDAO()
	{
		try
		{
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/MySQL");
		}
		 
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<UnepVO> listTitles()
	{
		List<UnepVO> linksList = new ArrayList<UnepVO>();
		
		try
		{
			conn = dataFactory.getConnection();
			String query = "select * from articles where source = 'UNEP'";
			//String query = "select * from articleUnep";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				String continent = rs.getString("continent");
				String title = rs.getString("title");
				String link = rs.getString("link");
				Date date = rs.getDate("date");
				UnepVO unepVO = new UnepVO(continent, title, link, date);
				linksList.add(unepVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		
		return linksList;
	}
	
	public void addUnep(UnepVO u)
	{
		try
		{
			conn = dataFactory.getConnection();
			String continent = u.getContinent();
			String title = u.getTilte();
			String link = u.getLink();
			Date date = u.getDate();
			String query = "insert into articleUnep(continent, title, email, date)" + " values(?, ?, ?, ?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, continent);
			pstmt.setString(2, title);
			pstmt.setString(3, link);
			pstmt.setDate(4, date);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
}
