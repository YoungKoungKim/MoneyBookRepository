package service;

import java.util.List;

import model.ExtraBoard;

public interface IExtraService {
	public int boardWrite(ExtraBoard eBoard);
	public int boardUpdate(ExtraBoard eBoard);
	public int boardDelete(int boardNo);
	public List<ExtraBoard> searchOne(int boardNo);
	public boolean checkboardNo(int boardNo, int id_index);
 
	
}
