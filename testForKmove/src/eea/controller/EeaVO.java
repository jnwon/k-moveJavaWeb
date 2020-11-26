package eea.controller;

import java.sql.Date;

public class EeaVO {
	private int no;
	private String source;
	private String title;
	private String link;
	
	public EeaVO() {
		System.out.println("EeaVO 생성자 호출");
	}
	
	// 인자 네 개를 갖는 생성자를 만듭니다.

	public EeaVO(int no, String source, String title, String link) {
		super();
		this.no = no;
		this.source = source;
		this.title = title;
		this.link = link;
	}

	
	/*
	 * * EeaVO eVO = new EeaVO(); int a = eVO.getNo();
	 */
	
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}	
}
