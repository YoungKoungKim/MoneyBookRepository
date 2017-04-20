package model;

import java.util.Date;
 
public class ExtraBoard {
	private int id_index;
	private int boardNo;
	private String category;
	private int price;
	private Date month;
	
	public int getId_index() {
		return id_index;
	}
	public void setId_index(int id_index) {
		this.id_index = id_index;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getMonth() {
		return month;
	}
	public void setMonth(Date month) {
		this.month = month;
	}
	 
	
	
}
