package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import commons.Comment;
import commons.SecondComment;
import dao.IRecommendDao;
import dao.ISecondCommentDao;

@Service
public class SecondCommentService implements ISecondCommentService{
	
	@Autowired
	private ISecondCommentDao dao;
	@Autowired
	private IRecommendDao rdao;

	@Override
	public boolean commentWrite(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		params.put(SecondComment.LV, 0);
		int count= dao.commentCount((int) params.get(SecondComment.BOARDNO));
		params.put(SecondComment.DEPTH, count + 1);
		return dao.insertComment(params);
	}

	@Override
	public boolean commentreplyWrite(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
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
		// TODO Auto-generated method stub
		return dao.deleteComment(commentNo);
	}

	@Override
	public boolean commentUpdate(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		int commentno = (int) params.get("commentNo");
		String content = (String) params.get("content");
		int boardno = dao.selectCommentLoc(commentno);
		params.put("boardNo", boardno);
		
		HashMap<String, Object> tmp = dao.selectOneComment(params);
		tmp.put("commentNo", commentno);
		tmp.put("boardNo", boardno);
		tmp.put("content", content);
		
		return dao.updateComment(tmp);
	}

	@Override
	public boolean checkMyComment(int commentNo, int boardNo, int id_index) {
		// TODO Auto-generated method stub
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
	public List<HashMap<String, Object>> selectComment(int boardNo) {
		// TODO Auto-generated method stub
		return dao.selectBoardComment(boardNo);
	}

	@Override
	public void commentRecommend(int commentNo) {
		// TODO Auto-generated method stub
		dao.updateRecommend(commentNo);
		
	}

	@Override
	public HashMap<String, Object> searchOne(int commentNo, int boardNo) {
		// TODO Auto-generated method stub
		HashMap<String, Object> params = new HashMap<>();
		params.put(Comment.COMMENTNO,commentNo);
		params.put(Comment.BOARDNO, boardNo);
		return  dao.selectOneComment(params);
	}

}
