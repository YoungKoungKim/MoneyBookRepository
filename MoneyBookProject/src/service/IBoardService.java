package service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import model.Board;
import model.Member;

public interface IBoardService {
	public int boardRecommand(int boardNo);
	public int boardUpdate(Board board);
	public void boardReadCount(int boardNo);
	public List<Board> boardSearch(String type, String search_content);
	public boolean checkMyText(Member member, int id_index);
	public HashMap<String, Object> searchText(int boardNo);
	public List<Board> bestView(int count);
	public void boardWrite(Board board, Date date2);
	public HashMap<String, Object> getboardList(int page, String ageType, String category,
			String content);
	public int boardDelete(int boardNo);
	
}