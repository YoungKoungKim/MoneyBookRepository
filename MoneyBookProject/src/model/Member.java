package model;

public class Member {
	private int id_index;
	private String id;
	private String nick;
	private String pwd;
	public int getId_index() {
		return id_index;
	}
	public void setId_index(int id_index) {
		this.id_index = id_index;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	@Override
	public String toString() {
		return "Member [id_index=" + id_index + ", id=" + id + ", nick=" + nick + ", pwd=" + pwd + "]";
	}

}
