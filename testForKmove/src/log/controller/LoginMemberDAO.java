package log.controller;

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

public class LoginMemberDAO {
	
	private DataSource dataFactory;
	private Connection conn;
	private PreparedStatement pstmt;
	
	public LoginMemberDAO()
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
	
	public boolean isExisted(LoginMemberVO logmemVO)
	{
		boolean result = false;
		String id = logmemVO.getId();
		String pwd = logmemVO.getPwd();
		
		try
		{
			conn = dataFactory.getConnection();
			String query = "select * from articles";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				Date joinDate = rs.getDate("joinDate");
				LoginMemberVO memberVO = new LoginMemberVO(id, pwd, name, email, joinDate);
				membersList.add(memberVO);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		
		return membersList;
	}
}
