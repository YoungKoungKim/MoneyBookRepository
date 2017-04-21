package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import service.CommentService;
import service.MemberService;

@Controller
public class CommentController {

	@Autowired
	private CommentService commentservice;
	
	@RequestMapping("commentWrite.do")
	public String commentWrite(HashMap<String, Object> comment){
		commentservice.commentWrite(comment);
		return "redirect:boardDetailView.do";
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
	public String commentDelete(int commentNo){
		commentservice.commentDelete(commentNo);
		return "redirect:boardDetailView.do";
	}
}
