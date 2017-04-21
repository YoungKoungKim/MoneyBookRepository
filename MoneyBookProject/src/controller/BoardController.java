package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Board;
import model.ExtraBoard;
import model.MoneyBook;
import service.BoardService;
import service.ExtraBoardService;
import service.MoneyBookService;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardservice;
	@Autowired
	private ExtraBoardService extraboardservice;
	
	@RequestMapping("boardList.do")
	public ModelAndView boardList(@RequestParam(defaultValue="1")int page,
			@RequestParam(defaultValue="0")String ageType,
			@RequestParam(defaultValue="0")String category,
			@RequestParam(defaultValue="0")String content)
	{	
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardservice.getboardList(page, ageType,category,content));
		mav.setViewName("boardList");
		return mav;
	}
	
	@RequestMapping("boardSearch.do")
	public ModelAndView boardSearch(
			@RequestParam(defaultValue="1")int page,
			@RequestParam(defaultValue="0")String ageType,
			@RequestParam(defaultValue="0")String category,
			@RequestParam(defaultValue="0")String content)
	{
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardservice.getboardList(page, ageType,category,content));
		mav.setViewName("boardList");
		return mav;
	}
	
	@RequestMapping("boardDetailView.do")
	public ModelAndView boardDetailView(int boardNo,int id_index){
		boardservice.boardReadCount(boardNo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardBest", boardservice.bestView(3));
		mav.addAllObjects(boardservice.searchText(boardNo));
		mav.setViewName("boardDetailView");
		return mav;
	}
	@RequestMapping("boardBest.do")
	public ModelAndView boardBest(){
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardBest", boardservice.bestView(1));
		mav.setViewName("boardDetailView");
		return mav;
	}
//	
	@RequestMapping("boardUpdateForm.do")
	public ModelAndView boardUpdateForm(Board board, List<ExtraBoard> extraboard){
		//일단 리스트로 받기
		ModelAndView mav = new ModelAndView();
		mav.addObject("board",board);
		mav.addObject("extraboard",extraboard);
		mav.setViewName("boardUpdateForm");
		return mav;
	}
//
	@RequestMapping("boardRecommend.do")
	public @ResponseBody int boardRecommend(int boardNo){
		boardservice.boardRecommand(boardNo);
		Board board = (Board) boardservice.searchText(boardNo).get("board");
		return board.getRecommend(); 
	}
//	
	@RequestMapping("boardUpdate.do")
	public @ResponseBody String boardUpdate(Board board){
		
		int result = boardservice.boardUpdate(board);
		if (result == 4001)
			return "true";
		else
			return "false";
	}

	@RequestMapping("boardWrite.do")
	public String boardWrite(Board board, 
			HashMap<String, Object>monthAmount,
			HashMap<String, Object>totalAmountByCategory, 
			List<MoneyBook> monthContent){
		ExtraBoard eboard = new ExtraBoard();
	
		eboard.setBoardNo(boardservice.boardWrite(board)); 
		eboard.setId_index(monthContent.get(0).getId_index());
		
		for(String key : totalAmountByCategory.keySet()) {
			eboard.setCategory(key);
			eboard.setPrice((int)totalAmountByCategory.get(key));
		}
		for(String key : monthAmount.keySet()){
			eboard.setCategory(key);
			eboard.setPrice((int) monthAmount.get(key));
		}
		eboard.setMonth(monthContent.get(0).getDate());
		 
		extraboardservice.boardWrite(eboard);
		return "redirect:viewMyPage.do";
		
//		Iterator<String> iter = totalAmountByCategory.keySet().iterator();
//		while(iter.hasNext()){
//			String key = iter.next();
//			System.out.println(key);
//		}
	}
//	
////	@RequestMapping("boardDelete.do")
////	public ModelAndView boardDelete(int boardNo){
////		//게시글삭제
////		return null;
////	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));

	}
}