package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Board;
import model.ExtraBoard;
import service.IBoardService;
import service.IRecommendService;

@Controller
public class BoardController {

	@Autowired
	private IBoardService boardservice;
	@Autowired
	private IRecommendService recommendservice;
	
	@RequestMapping("boardList.do")
	public ModelAndView boardList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "0") String ageType, @RequestParam(defaultValue = "0") String category,
			@RequestParam(defaultValue = "0") String content) {
		ModelAndView mav = new ModelAndView();
		 mav.addObject("boardBest", boardservice.bestView(3));
		mav.addAllObjects(boardservice.getboardList(page, ageType, category, content));
		mav.setViewName("boardList");
		return mav;
	}

	@RequestMapping("boardDetailView.do")
	public ModelAndView boardDetailView(HttpSession session, int boardNo) {// id_index 빼야됨
		ModelAndView mav = new ModelAndView();
		try {
			int readCheck = (int) session.getAttribute("readCheck");
			if (readCheck != boardNo) {
				session.setAttribute("readCheck", boardNo);
				boardservice.boardReadCount(boardNo);
			}
		} catch (NullPointerException e) {
			// 세션에 readCheck저장하고 조회수 올리고 페이지 ㄱㄱ
			session.setAttribute("readCheck", boardNo);
			boardservice.boardReadCount(boardNo);
		}

		mav.addAllObjects(boardservice.searchText(boardNo));
		mav.setViewName("boardDetailView");
		return mav;
	}

	@RequestMapping("boardDetailList.do")
	public @ResponseBody HashMap<String, Object>boardDetailList(int boardNo) {// id_index 빼야됨
		return boardservice.searchText(boardNo);
	}
	
	
	@RequestMapping("boardBest.do")
	public ModelAndView boardBest() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardBest", boardservice.bestView(3));
		mav.setViewName("boardDetailView");
		return mav;
	}

	@RequestMapping("boardUpdateForm.do")
	public ModelAndView boardUpdateForm(int boardNo) {
		// 일단 리스트로 받기
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardservice.searchText(boardNo));
		mav.setViewName("boardUpdateForm");
		return mav;
	}

	@RequestMapping("boardRecommend.do")
	public @ResponseBody HashMap<String, Object> boardRecommend(int boardNo, HttpSession session,
			@RequestParam(defaultValue = "0") int commentNo) {
		Board board = null;
		HashMap<String, Object> params = new HashMap<>();
		try {
			if (session.getAttribute("id_index") != null) {
				int id_index = (int) session.getAttribute("id_index");
				if (recommendservice.Searchrecommend(boardNo, id_index, commentNo) == false) {
					boardservice.boardRecommand(boardNo);
					recommendservice.Writerecommend(boardNo, id_index, commentNo);
					board = (Board) boardservice.searchText(boardNo).get("board");
					params.put("code", 0);
					params.put("recommend", board.getRecommend());
				}
			}else{
				params.put("code", 1);
				params.put("recommend", board.getRecommend());
			}
		} catch (NullPointerException e) {
		}

		return params;
	}

	@RequestMapping("boardUpdate.do")
	public String boardUpdate(Board board) {
		int result = boardservice.boardUpdate(board);
		if (result == 4001) {
			System.out.println("성공");
			return "redirect:boardDetailView.do?boardNo=" + board.getBoardNo() + "&id_index=" + board.getId_index();
		} else {
			System.out.println("실패");
			return "redirect:boardUpdateForm.do?boardNo=" + board.getBoardNo();
		}
	}

	@RequestMapping("boardWrite.do")
	public String boardWrite(Board board, Date date2) {
		boardservice.boardWrite(board, date2);
		return "redirect:boardList.do";
	
	}

	 @RequestMapping("boardDelete.do")
	 public String boardDelete(int boardNo){
		 boardservice.boardDelete(boardNo);
		 return "redirect:boardList.do";
	 }

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));

	}
}