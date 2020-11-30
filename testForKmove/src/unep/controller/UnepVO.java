package unep.controller;

public class UnepVO {
	
	private int no;
	private String continent, title, link, date;
	
	public UnepVO(String continent, String title, String link, String date)
	{
		super();
		this.continent = continent;
		this.title = title;
		this.link = link;
		this.date = date;
	}
	
	public UnepVO(int no, String continent, String title, String link, String date)
	{
		super();
		this.no = no;
		this.continent = continent;
		this.title = title;
		this.link = link;
		this.date = date;
	}
	
	public int getNo()
	{
		return no; 
	}

	public void setNo(int no)
	{
		this.no = no;
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
	
	public String getDate()
	{
		return date;
	}

	public void setDate(String date)
	{
		this.date = date;
	}

}
