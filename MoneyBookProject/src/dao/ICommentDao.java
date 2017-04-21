package dao;

import java.util.HashMap;
import java.util.List;

public interface ICommentDao {
	public boolean insertComment(HashMap<String, Object> params);

	public boolean updateComment(HashMap<String, Object> params);

	public boolean deleteComment(int commentNo);

	public int selectWriterIndex(String nick);

	public int selectCommentLoc(int commentNo);

	public List<HashMap<String, Object>> selectBoardComment(int boardNo);

	// 코멘트 번호랑 게시글 번호
	public HashMap<String, Object> selectOneComment(HashMap<String, Object> params);
}
