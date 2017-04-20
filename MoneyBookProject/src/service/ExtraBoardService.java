package service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.IExtraBoardDao;
import model.ExtraBoard;

@Component
public class ExtraBoardService implements IExtraService{
	
	@Autowired
	private IExtraBoardDao dao;
	
	@Override
	public int boardWrite(ExtraBoard eBoard) {
		// TODO Auto-generated method stub
		int result = dao.insertExtraBoard(eBoard); 
		if(result > 0)
			return 3301;
		else
			return 3302;
	}

	@Override
	public int boardUpdate(ExtraBoard eBoard) {
		// TODO Auto-generated method stub
		int result = dao.updateExtraBoard(eBoard);
		if(result > 0)
			return 4201;
		else
			return 4202;
	}

	@Override
	public int boardDelete(int boardNo) {
		// TODO Auto-generated method stub
		int result = dao.deleteExtraBoard(boardNo);
		if(result > 0 )
			return 5201;
		else
			return 5202;
	}

	
	@Override
	public List<ExtraBoard> searchOne(int boardNo) {
		// TODO Auto-generated method stub
		List<ExtraBoard> list = dao.selectOne(boardNo);
		return list;
	}

	@Override
	public boolean checkboardNo(int boardNo, int id_index) {
		List<ExtraBoard> list = dao.selectOne(boardNo);
		if(list.get(0).getId_index() == id_index)
		{
			return true;
		}
		else{			
			return false;
		}
	}

}
