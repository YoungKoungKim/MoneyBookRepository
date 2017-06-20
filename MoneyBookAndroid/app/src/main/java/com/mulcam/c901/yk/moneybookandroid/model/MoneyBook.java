package com.mulcam.c901.yk.moneybookandroid.model;

import java.util.Date;

public class MoneyBook {
	private int moneyBookNo;
	private int id_index;
	private String category;
	private String detail;
	private int price;
	private Date date;
	
	public int getMoneyBookNo() {
		return moneyBookNo;
	}

	public void setMoneyBookNo(int moneyBookNo) {
		this.moneyBookNo = moneyBookNo;
	}

	public int getId_index() {
		return id_index;
	}

	public void setId_index(int id_index) {
		this.id_index = id_index;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "[moneyBookNo=" + moneyBookNo + ", id_index=" + id_index + ", category=" + category
				+ ", detail=" + detail + ", price=" + price + ", date=" + date + "]";
	}
	

}
