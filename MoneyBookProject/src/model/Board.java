package model;

import java.util.Date;

public class Board {
	private int boardNo;
	private String title;
	private String content;
	private String annotation;
	private Date date;
	private String ageType;
	private String nick;
	private int id_index;
	private int viewNo;
	private int recommend;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAnnotation() {
		return annotation;
	}
	public void setAnnotation(String annotation) {
		this.annotation = annotation;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getAgeType() {
		return ageType;
	}
	public void setAgeType(String ageType) {
		this.ageType = ageType;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getId_index() {
		return id_index;
	}
	public void setId_index(int id_index) {
		this.id_index = id_index;
	}
	public int getViewNo() {
		return viewNo;
	}
	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", annotation=" + annotation
				+ ", date=" + date + ", ageType=" + ageType + ", nick=" + nick + ", id_index=" + id_index + ", viewNo="
				+ viewNo + ", recommend=" + recommend + "]";
	}
	
}
