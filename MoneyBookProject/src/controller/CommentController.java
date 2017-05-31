package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import commons.Comment;
import service.ICommentService;
import service.IRecommendService;

@Controller
public class CommentController {

	@Autowired
	private ICommentService commentservice;
	@Autowired
	private IRecommendService recommendService;
	
	@RequestMapping("commentWrite.do")
	public @ResponseBody String commentWrite(int boardNo, @RequestParam("nick1")String nick, @RequestParam("content1")String content, HttpSession session ){
		HashMap<String, Object> comment = new HashMap<>();
		int id_index = (int) session.getAttribute("id_index");

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
	
	
	@RequestMapping("commentRecommend.do")
	public @ResponseBody HashMap<String, Object> commentRecommend(int commentNo, HttpSession session, int boardNo){
		HashMap<String, Object> params = new HashMap<>();
		if(session.getAttribute("id_index") != null){
			
	
		int id_index = (int) session.getAttribute("id_index");
		 try {
			 if( recommendService.Searchrecommend(boardNo, id_index, commentNo) == false){
				 	commentservice.commentRecommend(commentNo);
				 	recommendService.Writerecommend(boardNo, id_index, commentNo);
				 	 params.put("code", 0);
				 	 params.put("recommend",commentservice.searchOne(commentNo, boardNo).get("recommend"));
			 }
			 else{
				 params.put("code", 1);
				params.put("recommend", commentservice.searchOne(commentNo, boardNo).get("recommend"));
			 }
				return params;
		} catch (NullPointerException e) {
			// TODO: handle exception
			}
		 
		}else{
			params.put("code", 3);
			return params ;			
		}
		return params;
	}
	
	@RequestMapping("getCommentList.do")
	public @ResponseBody List<HashMap<String, Object>> getCommentList(int boardNo) {
		return commentservice.selectComment(boardNo);
	}
}
