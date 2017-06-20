package model;

import java.util.Date;
 
public class Board {
	private int boardNo;
	private String title;
	private String content;
	private Date b_date;
	private String ageType;
	private String nick;
	private int id_index;
	private int viewNo;
	private int recommend;
	private int commentNum;
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
	public Date getB_date() {
		return b_date;
	}
	public void setB_date(Date b_date) {
		this.b_date = b_date;
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
	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", title=" + title + ", content=" + content + ", b_date=" + b_date
				+ ", ageType=" + ageType + ", nick=" + nick + ", id_index=" + id_index + ", viewNo=" + viewNo
				+ ", recommend=" + recommend + ", commentNum=" + commentNum + "]";
	}
	
	
}
