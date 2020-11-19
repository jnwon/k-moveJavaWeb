package unep.controller;

import java.sql.Date;

public class UnepVO {
	
	private String continent, title, link;
	private Date date;
	
	public UnepVO(String continent, String title, String link)
	{
		this.continent = continent;
		this.title = title;
		this.link = link;
	}
	
	public String getContinent()
	{
		return continent; 
	}

	public void setContinent(String continent)
	{
		this.continent = continent;
	}
	
	public String getTilte()
	{
		return title; 
	}

	public void setTitle(String title)
	{
		this.title = title;
	}
	
	public String getLink()
	{
		return link;
	}

	public void setLink(String link)
	{
		this.link = link;
	}
	
	public Date getDate()
	{
		return date;
	}

	public void setDate(Date date)
	{
		this.date = date;
	}
}
