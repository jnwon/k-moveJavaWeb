package unep.controller;

public class UnepVO {
	
	private String title, link;
	
	public UnepVO(String title, String link)
	{
		this.title = title;
		this.link = link;
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
}
