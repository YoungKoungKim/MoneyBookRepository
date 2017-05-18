package service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import model.Board;
import model.Member;

public interface ISecondBoardService {
	public int boardRecommand(int boardNo);
	public int boardUpdate(Board board);
	public void boardReadCount(int boardNo);
	public List<Board> boardSearch(String type, String search_content);
	public boolean checkMyText(Member member, int id_index);
	public HashMap<String, Object> searchText(int boardNo);
	public List<Board> bestView(int count);
	public void boardWrite(Board board);
	public HashMap<String, Object> getboardList(int page, String category, String content);
	public int boardDelete(int boardNo);
}
