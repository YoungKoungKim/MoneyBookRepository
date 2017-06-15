package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import commons.SecondComment;
import service.ICommentService;
import service.IRecommendService;
import service.ISecondCommentService;
import service.ISecondRecommendService;

@Controller
public class SecondCommentController {
	
	@Autowired
	private ISecondCommentService commentservice;
	@Autowired
	private ISecondRecommendService recommendService;
	
	@RequestMapping("secondCommentWrite.do")
	public @ResponseBody String commentWrite(int boardNo, @RequestParam("nick1")String nick, 
														@RequestParam("content1")String content, HttpSession session ){
		HashMap<String, Object> comment = new HashMap<>();
		int id_index = (int) session.getAttribute("id_index");

		comment.put(SecondComment.ID_INDEX, id_index);
		comment.put(SecondComment.BOARDNO, boardNo);
		comment.put(SecondComment.NICK, nick);
		comment.put(SecondComment.CONTENT, content);
		commentservice.commentWrite(comment);
		return "true";
	}
	@RequestMapping("secondCommentreplyWrite.do")
	public @ResponseBody String commentreplyWrite(int boardNo, @RequestParam("nick1")String nick,
															@RequestParam("content1")String content, HttpSession session, int commendNo){
		HashMap<String, Object> comment = new HashMap<>();
		int id_index = (int) session.getAttribute("id_index");

		comment.put(SecondComment.ID_INDEX, id_index);
		comment.put(SecondComment.BOARDNO, boardNo);
		comment.put(SecondComment.NICK, nick);
		comment.put(SecondComment.CONTENT, content);
		comment.put(SecondComment.LV, commendNo);
		 commentservice.commentreplyWrite(comment);
		 return "true";
	}
	@RequestMapping("secondCommentUpdate.do")
	public @ResponseBody String commentUpdate(int commentNo, String content){
		HashMap<String, Object> comment = new HashMap<>();
		comment.put("content", content);
		comment.put("commentNo", commentNo);
		commentservice.commentUpdate(comment);
		return "true";
	}
	@RequestMapping("secondCommentDelete.do")
	public @ResponseBody String commentDelete(int commentNo){
		commentservice.commentDelete(commentNo);
		return "true";
	}
	
	
	@RequestMapping("secondCommentRecommend.do")
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
	
	@RequestMapping("getSecondCommentList.do")
	public @ResponseBody List<HashMap<String, Object>> getCommentList(int boardNo) {
		return commentservice.selectComment(boardNo);
	}
	

}
