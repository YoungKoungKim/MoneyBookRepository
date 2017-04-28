package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import commons.Comment;
import service.ICommentService;

@Controller
public class CommentController {

	@Autowired
	private ICommentService commentservice;
	
	@RequestMapping("commentWrite.do")
	public @ResponseBody String commentWrite(int boardNo, @RequestParam("nick1")String nick, @RequestParam("content1")String content, int id_index ){
		HashMap<String, Object> comment = new HashMap<>();

		comment.put(Comment.ID_INDEX, id_index);
		comment.put(Comment.BOARDNO, boardNo);
		comment.put(Comment.NICK, nick);
		comment.put(Comment.CONTENT, content);
		 commentservice.commentWrite(comment);
		 return "true";
	}
	
	@RequestMapping("commentUpdate.do")
	public @ResponseBody String commentUpdate(String content, int commentNo){
		HashMap<String, Object> comment = new HashMap<>();
		comment.put("content", content);
		comment.put("commentNo", commentNo);
		commentservice.commentUpdate(comment);
		return "true";
		
	}
	@RequestMapping("commentDelete.do")
	public @ResponseBody String commentDelete(int commentNo){
		commentservice.commentDelete(commentNo);
		return "true";
	}
	
	@RequestMapping("getCommentList.do")
	public @ResponseBody List<HashMap<String, Object>> getCommentList(int boardNo) {
		return commentservice.selectComment(boardNo);
	}
}
