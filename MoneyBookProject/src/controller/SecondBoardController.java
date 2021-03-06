package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

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
import service.IRecommendService;
import service.ISecondBoardService;
import service.ISecondRecommendService;

@Controller
public class SecondBoardController {
	@Autowired
	private ISecondBoardService boardservice;
	@Autowired
	private ISecondRecommendService recommendService;

	@RequestMapping("secondBoardList.do")
	public ModelAndView boardList(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "0") String category, @RequestParam(defaultValue = "0") String content) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardBest", boardservice.bestView(3));
		mav.addAllObjects(boardservice.getboardList(page, category, content));
		mav.setViewName("secondBoardList");
		return mav;
	}

	@RequestMapping("secondBoardDetailView.do")
	public ModelAndView boardDetailView(HttpSession session, int boardNo) {// id_index
																			// 빼야됨
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
		mav.setViewName("secondBoardDetailView");

		return mav;
	}

	@RequestMapping("secondBoardDetailList.do")
	public @ResponseBody HashMap<String, Object> boardDetailList(int boardNo) {// id_index
																				// 빼야됨
		return boardservice.searchText(boardNo);
	}

	@RequestMapping("secondBoardBest.do")
	public ModelAndView boardBest() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardBest", boardservice.bestView(3));
		mav.setViewName("secondBoardDetailView");
		return mav;
	}

	@RequestMapping("secondBoardUpdateForm.do")
	public ModelAndView boardUpdateForm(int boardNo) {
		// 일단 리스트로 받기
		ModelAndView mav = new ModelAndView();
		mav.addAllObjects(boardservice.searchText(boardNo));
		mav.setViewName("secondBoardUpdateForm");
		return mav;
	}

	@RequestMapping("secondBoardRecommend.do")
	public @ResponseBody HashMap<String, Object> boardRecommend(int boardNo, HttpSession session,
			@RequestParam(defaultValue = "0") int commentNo) {
		Board board = null;
		HashMap<String, Object> params = new HashMap<>();
		try {
			if (session.getAttribute("id_index") != null) {
				int id_index = (int) session.getAttribute("id_index");
				if (recommendService.Searchrecommend(boardNo, id_index, commentNo) == false) {
					boardservice.boardRecommand(boardNo);
					recommendService.Writerecommend(boardNo, id_index, commentNo);
					board = (Board) boardservice.searchText(boardNo).get("board");
					params.put("code", 0);
					params.put("recommend", board.getRecommend());
				} else {
					// 이미 추천을 했어
					params.put("code", 3);
				}
			} else {
				params.put("code", 1);
				params.put("recommend", board.getRecommend());
			}
		} catch (NullPointerException e) {

		}

		return params;
	}

	@RequestMapping("secondBoardUpdate.do")
	public String boardUpdate(Board board) {
		int result = boardservice.boardUpdate(board);
		if (result == 4001) {
			System.out.println("성공");
			return "redirect:secondBoardDetailView.do?boardNo=" + board.getBoardNo();
		} else {
			System.out.println("실패");
			return "redirect:secondBoardUpdateForm.do?boardNo=" + board.getBoardNo();
		}
	}

	@RequestMapping("secondBoardWrite.do")
	public String boardWrite(Board board) {
		boardservice.boardWrite(board);
		return "redirect:secondBoardList.do";
	}

	@RequestMapping("secondBoardWriteForm.do")
	public String boardWrite() {
		return "secondBoardWriteForm";
	}

	@RequestMapping("secondBoardDelete.do")
	public String boardDelete(int boardNo) {
		boardservice.boardDelete(boardNo);
		return "redirect:secondBoardList.do";
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

}
