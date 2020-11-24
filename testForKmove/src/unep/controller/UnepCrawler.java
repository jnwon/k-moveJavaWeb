package unep.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class UnepCrawler {

	private Document docOfAfrica, docOfAsia, docOfEurope, docOfAmerica;
	private Elements eleOfAfrica, eleOfAsia, eleOfEurope, eleOfAmerica;
	private String UrlOfAfrica, UrlOfAsia, UrlOfEurope, UrlOfAmerica;
	private Connection conn;
	private DataSource dataFactory;
	private PreparedStatement pstmt;
	
	public UnepCrawler()
	{
		try
		{
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/MySQL");
			
			docOfAfrica = null; docOfAsia = null; docOfEurope = null; docOfAmerica = null;
			UrlOfAfrica = "https://www.unep.org/resources?f%5B0%5D=region%3A61";
			UrlOfAsia = "https://www.unep.org/resources?f%5B0%5D=region%3A62&f%5B1%5D=region%3A66";
			UrlOfEurope = "https://www.unep.org/resources?f%5B0%5D=region%3A63";
			UrlOfAmerica = "https://www.unep.org/resources?f%5B0%5D=region%3A64&f%5B1%5D=region%3A65";
			
			docOfAfrica = Jsoup.connect(UrlOfAfrica).get();
			docOfAsia = Jsoup.connect(UrlOfAsia).get();
			docOfEurope = Jsoup.connect(UrlOfEurope).get();
			docOfAmerica = Jsoup.connect(UrlOfAmerica).get();
			
			eleOfAfrica = docOfAfrica.select("div.result_items");
			eleOfAsia = docOfAsia.select("div.result_items");
			eleOfEurope = docOfEurope.select("div.result_items");
			eleOfAmerica = docOfAmerica.select("div.result_items");
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void listTitleAndLink()
	{
		try
		{
			conn = dataFactory.getConnection();
			
			for (Element e : eleOfAfrica.select("div.result_item_title"))
			{
				Iterator<Element> dateTake = eleOfAfrica.select("span.date").iterator();
				
				String continent = "africa";
				String title = eleOfAfrica.text();
				String link = "https://www.unep.org/" + e.getElementsByAttribute("href").attr("href");
				
				String[] dateSplit = dateTake.next().text().split(" ");
				String day = dateSplit[0];
				String month = "";
				switch (dateSplit[1])
				{
					case "Jan": month = "1";
						break;
					case "Feb": month = "2";
						break;
					case "Mar": month = "3";
						break;
					case "Apr": month = "4";
						break;
					case "May": month = "5";
						break;
					case "Jun": month = "6";
						break;
					case "Jul": month = "7";
						break;
					case "Aug": month = "8";
						break;
					case "Sep": month = "9";
						break;
					case "Oct": month = "10";
						break;
					case "Nov": month = "11";
						break;
					case "Dec": month = "12";
						break;
				}
				String year = dateSplit[2];
				
				String date = year + "-" + month + "-" + day;
				
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
	}
	/*
	public void addUnep(UnepVO u)
	{
		try
		{
			conn = dataFactory.getConnection();
			String continent = u.getContinent();
			String title = u.getTilte();
			String link = u.getLink();
			String date = u.getDate();
			String query = "insert into articleUnep(continent, title, email, date)" + " values(?, ?, ?, ?)";
			System.out.println(query);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, continent);
			pstmt.setString(2, title);
			pstmt.setString(3, link);
			pstmt.setString(4, date);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}*/
}
