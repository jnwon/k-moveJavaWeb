package eea.controller;

import java.sql.Date;

public class EeaVO {
	private int no;
	private String source;
	private String category;
	private String title;
	private String link;
	
	public EeaVO() {
		System.out.println("EeaVO ������ ȣ��");
	}
	
	// ���� �� ���� ���� �����ڸ� ����ϴ�.

	public EeaVO(int no, String source, String title, String link) {
		super();
		this.no = no;
		this.source = source;
		this.title = title;
		this.link = link;
	}
	
	public EeaVO(int no, String source, String category, String title, String link) {
		super();
		this.no = no;
		this.source = source;
		this.category = category;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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
