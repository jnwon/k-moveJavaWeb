package eea.controller;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class EeaCrawler {
	private Document docOfTopics, docOfPublications, docOfData, docOfAudiovisuals;
	private Elements eleOfTopics, eleOfPublications, eleOfData, eleOfAudiovisuals;
	private String UrlOfTopics, UrlOfPublications, UrlOfData, UrlOfAudiovisuals;
	
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
}
