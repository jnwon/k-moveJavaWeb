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
			String query = "select * from articles where source = 'UNEP'";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				String title = rs.getString("title");
				String link = rs.getString("link");
				UnepVO unepVO = new UnepVO(title, link);
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
}
