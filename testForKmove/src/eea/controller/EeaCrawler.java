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
	private Document docOfTopics, docOfPublications, docOfData, docOfAudiovisuals;
	private Elements eleOfTopics, eleOfPublications, eleOfData, eleOfAudiovisuals;
	private String UrlOfTopics, UrlOfPublications, UrlOfData, UrlOfAudiovisuals;
	//EeaDAO eeaDAO;

	public void init() throws ServletException {
	//	eeaDAO = new EeaDAO();
	}		
	
	public EeaCrawler()
	{
		try
		{
			docOfTopics = null; docOfPublications = null; docOfData = null; docOfAudiovisuals = null;
			UrlOfTopics = "https://www.eea.europa.eu/themes";
			UrlOfPublications = "https://www.eea.europa.eu/publications#c7=en&c11=20&c14=&c12=&b_start=0";
			UrlOfData = "https://www.eea.europa.eu/data-and-maps";
			UrlOfAudiovisuals = "https://www.eea.europa.eu/media/audiovisuals#c8=all&c3=&b_start=0";
			
			docOfTopics = Jsoup.connect(UrlOfTopics).get();
			docOfPublications = Jsoup.connect(UrlOfPublications).get();
			docOfData = Jsoup.connect(UrlOfData).get();
			docOfAudiovisuals = Jsoup.connect(UrlOfAudiovisuals).get();
			
			//eleOfTopics = docOfTopics.select("div.list-items");
			eleOfPublications = docOfPublications.select("div.result_items");
			eleOfData = docOfData.select("div.result_items");
			eleOfAudiovisuals = docOfAudiovisuals.select("div.result_items");			
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public List<EeaVO> listTitleAndLink()
	{
		List<EeaVO> titlesAndlinkslist = new ArrayList<EeaVO>();
		
		try
		{
			for (Element e : docOfTopics.select("ul.list-items"))
			{	
				if(!e.hasAttr("id")) {
					for (Element f : e.select("li")) {
						int no = 0;
						String source = "EEA";
						String category = "Topics";
						String title = f.getElementsByAttribute("title").attr("title");
						String link = f.getElementsByAttribute("href").attr("href");
						EeaVO eeaVO = new EeaVO(no, source, category, title, link);
						titlesAndlinkslist.add(eeaVO);
					}
				}
			}
			
		}
		
		catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return titlesAndlinkslist;
	}
	
	public void InsertArticles(String jsonData)
	{
		int result = -1;
		JsonParser parser = new JsonParser();
		JsonArray elements = (JsonArray)parser.parse(jsonData);
		//JsonObject rootObj = parser.parse(jsonData).getAsJsonObject();
		//JsonArray elements = rootObj.getAsJsonArray();
		try
		{
			for (JsonElement element : elements )
			{
				try {
					JsonObject e = element.getAsJsonObject();
					int no = 0;
					String source = e.get("source").getAsString();
				    String category = e.get("category").getAsString();
				    String title = e.get("title").getAsString();
				    String link = e.get("link").getAsString();
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
