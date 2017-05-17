package dao;

import java.util.List;

import model.ExtraBoard;
 
public interface IExtraBoardDao {
	public int insertExtraBoard(ExtraBoard extraboard);
	public int updateExtraBoard(ExtraBoard extraboard);			
	public int deleteExtraBoard(int boardNo);
	public List<ExtraBoard> selectOne(int boardNo);
	 
	public int deleteExtraBoardById_index(int id_index);
}
