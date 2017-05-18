package dao;

import java.util.HashMap;
import java.util.List;

import model.Board;

public interface ISecondBoardDao {
	public int insertBoard(Board board);
	public int updateBoard(Board board);			
	public int updateRecommendBoard(int boardNo);
	public int deleteBoard(int boardNo);
	public List<Board> selectBest(int count);		
	public Board selectOneBoard(int boardNo);		
	public List<Board> selectByNick(String nick);
	public List<Board> selectByWhat(HashMap<String, Object> params);			
	public List<Board> selectboardLimit(HashMap<String, Object> params);
	public int getBoardCount(HashMap<String, Object> params);
	public Board selectMaxRecommend();
	public List<Integer> selectBoardNo(int id_index);
	public int deleteBoardById_index(int id_index);
}
