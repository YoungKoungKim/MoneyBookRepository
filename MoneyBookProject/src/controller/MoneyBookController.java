package controller;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import commons.BookMark;
import model.MoneyBook;
import service.IBookMarkService;
import service.IMoneyBookService;

@Controller
public class MoneyBookController {
	private BookMark BM;
	@Autowired
	private IMoneyBookService moneyBookService;
	@Autowired
	private IBookMarkService bookMarkService;
	
	@RequestMapping("bookMarkDelete.do")
	public 
	@ResponseBody HashMap<String, Object> bookMarkDelete(int id_index, int bookmarkNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put(BM.BOOKMARKNO, bookmarkNo);
		params.put(BM.ID_INDEX, id_index);
		int result = bookMarkService.bookMarkDelete(params);
		
		HashMap<String, Object> response = new HashMap<>();
		if (result == 5101) {
			//bookMark를 DB에서 삭제후 id_index와 date를 넘겨준다
			response.put("result", true);
			response.put("id_index", id_index);
			response.put("msg", "북마크 삭제 성공");
			System.out.println("성공");
		} else {
			response.put("result", false);
			response.put("msg", "북마크 삭제 실패");
			System.out.println("실패");
		}
		return response;
	}
	
	@RequestMapping("bookMarkRegist.do")
	public
	@ResponseBody HashMap<String, Object> bookMarkRegist(int id_index, String category, String detail, int price) {
		int num = bookMarkService.checkbookNo(id_index);
		HashMap<String, Object> response = new HashMap<>();
		//bookMark개수가 6개 미만인지 확인
		if (num >= 6) {
			response.put("result", false);
			response.put("msg", "북마크는 6개 이상을 등록할 수 없습니다.");
		} else {
			//6개 미만이라면 DB에 insert후 코드 리턴
			HashMap<String, Object> params = new HashMap<>();
			params.put(BM.ID_INDEX, id_index);
			params.put(BM.CATEGORY, category);
			params.put(BM.DETAIL, detail);
			params.put(BM.PRICE, price);
			int result = bookMarkService.bookMarkWrite(params);
			if (result == 3101) {
				//성공
				response.put("msg", "북마크 등록 성공");
				response.put("result", true);
			} else {
				//실패
				response.put("msg", "북마크 등록 실패");
				response.put("result", false);
			}
		}
		return response;
	}
	
	@RequestMapping("moneyBookUpdateForm.do")
	public ModelAndView moneyBookUpdateForm(int id_index, Date date, int moneyBookNo) {
		ModelAndView mav = new ModelAndView();
		//클릭한 가계부 중 하나의 정보를 얻어옴 (selectOne)
		mav.addObject("moneyBook", moneyBookService.moneyBookSelectOne(moneyBookNo, id_index, date));
		//팝업창 uri
		mav.setViewName("moneyBookUpdateForm");
		return mav;
	}
	
	@RequestMapping("moneyBookDelete.do")
	public 
	@ResponseBody HashMap<String, Object> moneyBookDelete(int id_index, Date date, int moneyBookNo) {
		HashMap<String, Object> response = new HashMap<>();
		int result = moneyBookService.moneyBookDelete(moneyBookNo, id_index);
		
		if (result == 5001) {
			response.put("msg", "상세내역 삭제 성공");
			response.put("result", true);
		} else {
			response.put("msg", "상세내역 삭제 실패");
			response.put("result", false);
		}
		return response;
	}
	
	@RequestMapping("moneyBookUpdate.do")
	public
	@ResponseBody HashMap<String, Object> moneyBookUpdate(MoneyBook moneyBook) {
		HashMap<String, Object> response = new HashMap<>();
		int result = moneyBookService.moneyBookUpdate(moneyBook);
		
		if (result == 4201) {
			response.put("msg", "내역 수정 성공");
			response.put("result", true);
		} else {
			response.put("msg", "내역 수정 실패");
			response.put("result", false);
		}
		return response;
	}

}
