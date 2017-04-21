package service;

import java.util.HashMap;
import java.util.List;

import model.Board;
import model.Member;

public interface IBoardService {
	public int boardRecommand(int boardNo);
	public int boardUpdate(Board board);
	public List<Board> boardSearch(String type, String search_content);
	public boolean checkMyText(Member member, int id_index);
	public Board searchText(int boardNo);
	public Board bestView();
	public int boardWrite(Board board);
	public HashMap<String, Object> getboardList(int page, String ageType);
}
