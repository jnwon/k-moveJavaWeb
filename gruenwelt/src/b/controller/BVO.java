package b.controller;

public class BVO {
	
	String title, link;
	
	public BVO()
	{
		System.out.println("BVO 생성자 호출");
	}
	
	public BVO(String title, String link)
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
