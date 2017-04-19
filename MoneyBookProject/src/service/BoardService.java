package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.IBoardDao;
import dao.IMemberDao;
import model.Board;
import model.Member;

@Component
public class BoardService implements IBoardService{

	@Autowired
	private IBoardDao bDao;
	@Autowired
	private IMemberDao mDao;
	
	@Override
	public int boardRecommand(int boardNo) {
		int result = bDao.updateRecommendBoard(boardNo);
		if (result > 0)
			return 4001;
		else
			return 4002;
	}

	@Override
	public int boardUpdate(Board board) {
		int result = bDao.updateBoard(board);
		if (result > 0)
			return 4001;
		else
			return 4002;
	}

	@Override
	public List<Board> boardSearch(String type,  String search_content) {
		List<Board> list = new ArrayList<Board>();
		
		if(type.equals("nick")){
			list = bDao.selectByNick(search_content);
			
		}else if(type.equals("title")){
			HashMap<String, Object> params = new HashMap<>();
			params.put("title", search_content);
			list = bDao.selectByTitle(params);
			
		}else if(type.equals("ageType")){
			list = bDao.selectByAgeType(search_content);
		}
		return list;
	}

	@Override
	public boolean checkMyText(Member member,int id_index) {
		//내가 쓴 댓글인지 확인
		if(mDao.selectIdIndex(member.getId()) == id_index)
			return true;
		else
			return false;
	}

	@Override
	public Board searchText(int boardNo) {
		//게시글 불러오기(하나)
		Board board = bDao.selectOneBoard(boardNo);
		return board;
	}
	
	@Override
	public Board bestView() {
		return bDao.selectBest();
	}

	@Override
	public int boardWrite(Board board) {
		int result = bDao.insertBoard(board);
		if (result > 0)
			return 3001;
		else
			return 3002;
	}

}
