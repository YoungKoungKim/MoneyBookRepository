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
		System.out.println(comment);
		 boolean a = commentservice.commentWrite(comment);
		 System.out.println(a);
		 return "true";
	}
	
	@RequestMapping("commentUpdate.do")
	public @ResponseBody HashMap<String, Object> commentUpdate(HashMap<String, Object> comment){
		boolean result=commentservice.commentUpdate(comment);
		HashMap<String, Object> response = new HashMap<>();
		if(result == true){
			response.put("result", true);
			response.put("comment", comment.get("comment"));
			return response;
		}else{
			response.put("result", false);
			return response;
		}
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
