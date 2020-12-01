package eea.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.google.gson.JsonArray;

public class EeaCrawler {
	private Document docOfTopics, docOfPublications, docOfData, docOfMedia;
	private String UrlOfTopics, UrlOfPublications, UrlOfData, UrlOfMedia;
	
	public EeaCrawler()
	{
		try
		{
			docOfTopics = null; docOfPublications = null; docOfData = null; docOfMedia = null;
			UrlOfTopics = "https://www.eea.europa.eu/themes";
			UrlOfPublications = "https://www.eea.europa.eu/publications#c7=en&c11=20&c14=&c12=&b_start=0";
			UrlOfData = "https://www.eea.europa.eu/data-and-maps";
			UrlOfMedia = "https://www.eea.europa.eu/media/audiovisuals#c8=all&c3=&b_start=0";
			
			docOfTopics = Jsoup.connect(UrlOfTopics).get();
			docOfPublications = Jsoup.connect(UrlOfPublications).get();
			docOfData = Jsoup.connect(UrlOfData).get();
			docOfMedia = Jsoup.connect(UrlOfMedia).get();
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void crawlAndInsertArticles()
	{
		try
		{
			for (Element e : docOfTopics.select("ul.list-items"))
			{
				if(!e.hasAttr("id")) {
					for (Element f : e.select("li")) {
						try {
							int no = 0;
							String source = "EEA";
							String category = "Topics";
							String title = f.getElementsByAttribute("title").attr("title");
							String link = f.getElementsByAttribute("href").attr("href");
							EeaDAO eeaDAO = new EeaDAO();
						    boolean temp = eeaDAO.isArticleInTable(source, category, link);
							if(!temp) {
								EeaVO eeaVO = new EeaVO(no, source, category, title, link);
								eeaDAO.addArticle(eeaVO);
							}
						}
						catch (Exception ee)
						{
							ee.printStackTrace();
						}
					}
				}
			}
			
			for (Element e : docOfPublications.select("div.tileContent"))
			{
				try {
					Element f = e.selectFirst("h2.tileHeadline");
					int no = 0;
					String source = "EEA";
					String category = "Publications";
					String title = f.getElementsByAttribute("title").attr("title");
					String link = f.getElementsByAttribute("href").attr("href");
					EeaDAO eeaDAO = new EeaDAO();
				    boolean temp = eeaDAO.isArticleInTable(source, category, link);
					if(!temp) {
						EeaVO eeaVO = new EeaVO(no, source, category, title, link);
						eeaDAO.addArticle(eeaVO);
					}
				}
				catch (Exception ee)
				{
					ee.printStackTrace();
				}
			}
			
			for (Element e : docOfData.select("div.photoAlbumEntry"))
			{
				try {
					int no = 0;
					String source = "EEA";
					String category = "Data";
					String title = e.getElementsByAttribute("title").attr("title");
					String link = e.getElementsByAttribute("href").attr("href");
					EeaDAO eeaDAO = new EeaDAO();
				    boolean temp = eeaDAO.isArticleInTable(source, category, link);
					if(!temp) {
						EeaVO eeaVO = new EeaVO(no, source, category, title, link);
						eeaDAO.addArticle(eeaVO);
					}
				}
				catch (Exception ee)
				{
					ee.printStackTrace();
				}
			}
			
			for (Element e : docOfMedia.select("div.photoAlbumEntry"))
			{
				try {
					int no = 0;
					String source = "EEA";
					String category = "Media";
					String title = e.getElementsByAttribute("title").attr("title");
					String link = e.getElementsByAttribute("href").attr("href");
					EeaDAO eeaDAO = new EeaDAO();
				    boolean temp = eeaDAO.isArticleInTable(source, category, link);
					if(!temp) {
						EeaVO eeaVO = new EeaVO(no, source, category, title, link);
						eeaDAO.addArticle(eeaVO);
					}
				}
				catch (Exception ee)
				{
					ee.printStackTrace();
				}
			}
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
}
