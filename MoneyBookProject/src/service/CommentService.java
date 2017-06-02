package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import commons.Comment;
import dao.ICommentDao;
import dao.IRecommendDao;
import model.Recommend;

@Service
public class CommentService implements ICommentService {
	@Autowired
	private ICommentDao dao;
	@Autowired
	private IRecommendDao rdao;

	@Override
	public boolean commentWrite(HashMap<String, Object> params) {
		params.put(Comment.LV, 0);
		 int count= dao.commentCount((int) params.get(Comment.BOARDNO));
		params.put(Comment.DEPTH, count + 1);
		 return dao.insertComment(params);
	}
	
	@Override
	public boolean commentreplyWrite(HashMap<String, Object> params) {
		params.put("commentNo",params.get("lv"));
		 HashMap<String, Object> result= dao.selectOneComment(params); //부모꺼
		 params.remove("commentNo");
		 
		 int depth =  (int) result.get("depth");
		 System.out.println(depth);
		 dao.updatereplyComment(depth);
		params.put(Comment.DEPTH, depth+1);
		return 	dao.insertComment(params);
	}
	
	@Override
	public boolean commentDelete(int commentNo) {
		return dao.deleteComment(commentNo);
	}

	@Override
	public boolean commentUpdate(HashMap<String, Object> params) {
		return dao.updateComment(params);
	}

	@Override
	public List<HashMap<String, Object>> selectComment(int boardNo) {
		return dao.selectBoardComment(boardNo);
	}

	@Override
	public boolean checkMyComment(int commentNo, int boardNo, int id_index) {
		HashMap<String, Object> params = new HashMap<>();
		params.put(Comment.BOARDNO, boardNo);
		params.put(Comment.COMMENTNO, commentNo);

		HashMap<String, Object> result = dao.selectOneComment(params);

		if (result.get(Comment.ID_INDEX).equals(id_index)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public void commentRecommend(int commentNo) {		 
		 dao.updateRecommend(commentNo);
	}

	@Override
	public HashMap<String, Object> searchOne(int commentNo, int boardNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put(Comment.COMMENTNO,commentNo);
		params.put(Comment.BOARDNO, boardNo);
		return  dao.selectOneComment(params);
		
	}

	
}