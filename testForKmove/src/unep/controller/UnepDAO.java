package unep.controller;

import java.sql.Connection;
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
			String query = "select * from articleUnep";
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				int no = rs.getInt("no");
				String continent = rs.getString("continent");
				String title = rs.getString("title");
				String link = rs.getString("link");
				String date = rs.getString("date");
				UnepVO unepVO = new UnepVO(no, continent, title, link, date);
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
	/*
	public void insertUnep(List<UnepVO> titlesAndlinkslist)
	{
		try
		{
			conn = dataFactory.getConnection();
			for (int i = 0; i < titlesAndlinkslist.size(); i++)
			{
				String continent = titlesAndlinkslist.get(i).getContinent();
				String title = titlesAndlinkslist.get(i).getTilte();
				String link = titlesAndlinkslist.get(i).getLink();
				String date = titlesAndlinkslist.get(i).getDate();
				String query = "insert into articleUnep(continent, title, link, date)" + " values(?, ?, ?, ?)";
				System.out.println(query);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, continent);
				pstmt.setString(2, title);
				pstmt.setString(3, link);
				pstmt.setString(4, date);
				pstmt.executeUpdate();
				pstmt.close();
			}
			conn.close();
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}*/
}
