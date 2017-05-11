package controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.HashShardMapping;

import commons.BookMark;
import model.MoneyBook;
import service.IBoardService;
import service.IBookMarkService;
import service.IExtraService;
import service.IMoneyBookService;

@Controller
public class MoneyBookController {
	private BookMark BM;
	@Autowired
	private IMoneyBookService moneyBookService;
	@Autowired
	private IBookMarkService bookMarkService;
	@Autowired
	private IBoardService boardService;
	@Autowired
	private IExtraService extraService;

	@RequestMapping("bookmarkDelete.do")
	public @ResponseBody HashMap<String, Object> bookmarkDelete(int id_index, int bookmarkNo) {
		HashMap<String, Object> params = new HashMap<>();
		params.put(BM.BOOKMARKNO, bookmarkNo);
		params.put(BM.ID_INDEX, id_index);
		int result = bookMarkService.bookMarkDelete(params);

		HashMap<String, Object> response = new HashMap<>();
		if (result == 5101) {
			// bookMark를 DB에서 삭제후 id_index와 date를 넘겨준다
			response.put("result", true);
			response.put("id_index", id_index);
			response.put("msg", "북마크 삭제 성공");
		} else {
			response.put("result", false);
			response.put("msg", "북마크 삭제 실패");
			//System.out.printlzn("실패");
		}
		return response;
	}
	
	@RequestMapping("bookmarkUpdate.do")
	public @ResponseBody HashMap<String, Object> bookmarkUpdate(int id_index, int bookmarkNo,
			int price){
		HashMap<String, Object> params = new HashMap<>();
		params.put(BM.BOOKMARKNO, bookmarkNo);
		params.put(BM.ID_INDEX, id_index);
		params.put(BM.PRICE, price);
		int result = bookMarkService.bookMarkModify(params);
		HashMap<String, Object> response = new HashMap<>();
		if (result == 4301) {
			response.put("result", true);
			response.put("id_index", id_index);
			response.put("msg", "가격 수정 성공");
		} else {
			response.put("result", false);
			response.put("msg", "가격 수정 실패");
			System.out.println("실패");
		}
		return response;
	}

	@RequestMapping("bookmarkRegist.do")
	public ModelAndView bookMarkRegist(int id_index, String category, String detail, String price) {
		ModelAndView mav = new ModelAndView();
		int resultCount = 0;

		int num = bookMarkService.checkbookNo(id_index);

		if (num >= 6) {
			mav.addObject("msg", "북마크는 6개 이상 등록할 수 없습니다.");
		} else {
			String[] category_arr = category.split(",");
			String[] detail_arr = detail.split(",");
			String[] price_arr = price.split(",");
			List<HashMap<String, Object>> bookmarkList = bookMarkService.bookMarkSearch(id_index);

			for (int i = 0; i < category_arr.length; i++) {
				for (int j = 0; j < bookmarkList.size(); j++) {
					System.out.println(j + "a");
					if (bookmarkList.get(j).get("detail").equals(detail_arr[i])) {
						System.out.println(bookmarkList.get(j).get("detail"));
						mav.addObject("id_index", id_index);
						mav.addObject("msg", "이미 있는 즐겨찾기 입니다.");
						mav.setViewName("redirect:/bookmarkRegistForm.do");
						return mav;
					}
				}
				HashMap<String, Object> params = new HashMap<>();
				params.put(BM.ID_INDEX, id_index);
				params.put(BM.CATEGORY, category_arr[i]);
				params.put(BM.DETAIL, detail_arr[i]);
				params.put(BM.PRICE, price_arr[i]);

				int result = bookMarkService.bookMarkWrite(params);
				if (result == 3101) {
					// 성공
					mav.addObject("msg", "즐겨찾기 등록에 성공");
				}
			}
		}
		mav.addObject("id_index", id_index);
		mav.setViewName("redirect:/bookmarkRegistForm.do");
		return mav;

	}

	@RequestMapping("findBookMark.do")
	public @ResponseBody HashMap<String, Object> findBookMark(int id_index, int bookmarkNo) {
		System.out.println("북마크 하나 찾으러 왔다");
		System.out.println(id_index);
		HashMap<String, Object> response = new HashMap<>();
		HashMap<String, Object> bmParams = new HashMap<>();
		bmParams.put("id_index", id_index);
		bmParams.put("bookmarkNo", bookmarkNo);
		HashMap<String, Object> result = bookMarkService.searchOneBookmark(bmParams);

		response.put("category", result.get("category"));
		response.put("price", result.get("price"));
		response.put("detail", result.get("detail"));

		return response;
	}

	@RequestMapping("moneyBookUpdateForm.do")
	public 
	@ResponseBody HashMap<String, Object> moneyBookUpdateForm(int id_index, Date date, int moneyBookNo) {
		HashMap<String, Object> params = new HashMap<>();
		String mbDate = moneyBookService.searchDate(date).get("date").toString();
		// 클릭한 가계부 중 하나의 정보를 얻어옴 (selectOne)
		params.put("mbDate", mbDate);
		params.put("moneyBook", moneyBookService.moneyBookSelectOne(moneyBookNo, id_index, date));
		return params;
	}

	@RequestMapping("moneyBookDelete.do")
	public @ResponseBody HashMap<String, Object> moneyBookDelete(int id_index, int moneyBookNo) {
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
	public @ResponseBody HashMap<String, Object> moneyBookUpdate(MoneyBook moneyBook) {
		System.out.println(moneyBook.getDate());
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

	// 혜리언니
	@RequestMapping("viewMyPage.do")
	public ModelAndView viewMyPage(int id_index, Date date) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("monthAmount", moneyBookService.totalMonthAmount(id_index, date));
		mav.setViewName("moneyBookView");
		return mav;
	}

	// 달력에 가계부 내역 뿌리는 ajax용 리퀘스트
	@RequestMapping("moneyBookView.do")
	public @ResponseBody HashMap<String, Object> moneyBookView(int id_index, Date date) {
		List<String[]> amountList = new ArrayList<>();
		amountList = moneyBookService.oneMonthAmount(id_index, date);

		HashMap<String, Object> monthAmount = moneyBookService.totalMonthAmount(id_index, date);
		List<HashMap<String, Object>> income = new ArrayList<>();
		List<HashMap<String, Object>> expense = new ArrayList<>();

		for (String[] arr : amountList) {
			HashMap<String, Object> tmpIncome = new HashMap<>();
			HashMap<String, Object> tmpExpense = new HashMap<>();
			
			tmpIncome.put("title", arr[1]);
			tmpIncome.put("start", arr[0]);
			income.add(tmpIncome);
			
			tmpExpense.put("title", arr[2]);
			tmpExpense.put("start", arr[0]);
			expense.add(tmpExpense);
		}

		HashMap<String, Object> response = new HashMap<>();
		response.put("lastDay", amountList.size());
		response.put("income", income);
		response.put("expense", expense);

		response.put("monthIncome", monthAmount.get("income"));
		response.put("monthExpense", monthAmount.get("expense"));
		
		return response;
	}

	@RequestMapping("boardWriteForm.do")
	public ModelAndView boardWriteForm(int id_index, Date date) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("monthContent", moneyBookService.totalAmountByCategory(id_index, date));
		mav.addObject("monthAmount", moneyBookService.totalMonthAmount(id_index, date));
		mav.addAllObjects(moneyBookService.searchDate(date));
		mav.setViewName("boardWriteForm");
		return mav;
	}

	@RequestMapping("moneyBookWriteForm.do")
	public ModelAndView moneyBookWriteForm(int id_index) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookMarkList", bookMarkService.bookMarkSearch(id_index));
		mav.setViewName("empty/moneyBookAdd");
		return mav;
	}

	// 북마크 입력창
	@RequestMapping("bookmarkRegistForm.do")
	public ModelAndView bookmarkRegistForm(int id_index) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("bookMarkList", bookMarkService.bookMarkSearch(id_index));
		mav.setViewName("empty/bookmarkRegistForm");
		return mav;
	}

	@RequestMapping("moneyBookDetailView.do")
	public 
	@ResponseBody List<MoneyBook> moneyBookDetailView(int id_index, Date date) {
		return moneyBookService.getDayContent(date, id_index);
	}

	@RequestMapping("moneyBookRegist.do")
	public ModelAndView moneyBookRegist(int id_index, String category, String detail, String price, int year, int month,
			int day) {
		System.out.println("가계부 등록 요청에 왔다");
		ModelAndView mav = new ModelAndView();
		int resultCount = 0;

		String[] category_arr = category.split(",");
		String[] detail_arr = detail.split(",");
		String[] price_arr = price.split(",");

		Date date = new Date();
		String date2 = null;
		for (int i = 0; i < category_arr.length; i++) {
			System.out.println(detail_arr[i]);
			
			date.setYear(year - 1900);
			date.setMonth(month - 1);
			date.setDate(day);

			MoneyBook mb = new MoneyBook();
			mb.setId_index(id_index);
			mb.setCategory(category_arr[i]);
			mb.setDetail(detail_arr[i]);
			mb.setPrice(Integer.parseInt(price_arr[i]));
			mb.setDate(date);
			int result = moneyBookService.moneyBookRegist(mb);
			date2 = (String) moneyBookService.searchDate(date).get("date");

			if (result == 3201) {
				resultCount++;
			}
		}

		if (resultCount == category_arr.length) {
			mav.setViewName("redirect:/viewMyPage.do");
			mav.addObject("id_index", id_index);
			mav.addObject("date", date2);
			mav.addObject("succ", "sucess");
			
		} else {
			mav.setViewName("redirect:/moneyBookRegist.do");
		}
		
		return mav;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	}

}
