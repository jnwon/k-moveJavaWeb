package event.controller;

import java.sql.Date;

public class EventVO {
	private	String title;
	private	String writer;
	private	String publishedDate;
	private	int isOpened;
	private	int isLocked;
	private	int password;
	private	int numOfMaxMembers;
	private	int numOfJoiningMembers;
	private	int numOfComment;
	private	int numOfViews;
	private	int numOfLikes;
	
	public EventVO(String title, String writer, String publishedDate, int isOpened, int isLocked, int numOfMaxMembers, int numOfJoiningMembers, int numOfComment, int numOfViews, int numOfLikes) {
		super();
		this.title = title;
		this.writer = writer;
		this.publishedDate = publishedDate;
		this.isOpened = isOpened;
		this.isLocked = isLocked;
		this.numOfMaxMembers = numOfMaxMembers;
		this.numOfJoiningMembers = numOfJoiningMembers;
		this.numOfComment = numOfComment;
		this.numOfViews = numOfViews;
		this.numOfLikes = numOfLikes;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setPublishedDate(String publishedDate) {
		this.publishedDate = publishedDate;
	}

	public void setIsOpened(int isOpened) {
		this.isOpened = isOpened;
	}

	public void setIsLocked(int isLocked) {
		this.isLocked = isLocked;
	}

	public void setPassword(int password) {
		this.password = password;
	}

	public void setNumOfMaxMembers(int numOfMaxMembers) {
		this.numOfMaxMembers = numOfMaxMembers;
	}

	public void setNumOfJoiningMembers(int numOfJoiningMembers) {
		this.numOfJoiningMembers = numOfJoiningMembers;
	}

	public void setNumOfComment(int numOfComment) {
		this.numOfComment = numOfComment;
	}

	public void setNumOfViews(int numOfViews) {
		this.numOfViews = numOfViews;
	}

	public void setNumOfLikes(int numOfLikes) {
		this.numOfLikes = numOfLikes;
	}	

	public String setTitle() {
		return title;
	}

	public String setWriter() {
		return writer;
	}

	public String setPublishedDate() {
		return publishedDate;
	}

	public int setIsOpened() {
		return isOpened;
	}

	public int setIsLocked() {
		return isLocked;
	}

	public int setPassword() {
		return password;
	}

	public int setNumOfMaxMembers() {
		return numOfMaxMembers;
	}

	public int setNumOfJoiningMembers() {
		return numOfJoiningMembers;
	}

	public int setNumOfComment() {
		return numOfComment;
	}

	public int setNumOfViews() {
		return numOfViews;
	}

	public int setNumOfLikes() {
		return numOfLikes;
	}

}