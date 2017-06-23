package controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Member;
import model.MoneyBook;
import model.Repo;
import service.IMemberService;
import service.IMoneyBookService;

@Controller
public class AndroidController {
	private MoneyBook mb;
	@Autowired
	private IMoneyBookService moneyBookService;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(method = RequestMethod.POST, value = "android/login.do")
	public @ResponseBody Integer loginSuccess(String id, String pwd) {
		System.out.println("로그인 요청");
		Member member = memberService.login(id, pwd);

		if (member != null) {
			return 2101;
		} else {
			return 2102;
		}
	}
	
/*	@RequestMapping(value="android/android.do", method=RequestMethod.GET)
	public @ResponseBody List<Repo> androidTest() {
		System.out.println("안드로이드로 접근했습니다.");
		List<Repo> list = new ArrayList<>();
		Repo r = new Repo();
		r.setFull_name("Kim Young Koung");
		r.setId(1);
		r.setName("ykk");
		list.add(r);
		return list;
	}
	*/
	@RequestMapping(value="android/moneybookList", method=RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> moneyBookView() {
		System.out.println("moneyBookList");
		int id_index = 1;
		Date date = new Date();
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
		System.out.println(id_index);
		System.out.println(date);
		
		return response;
		
		
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "android/moneybookAdd.do")
	public @ResponseBody Integer moneybookAdd(int id_index, String date, String category, String content, int price) {
		System.out.println("가계부 등록 요청");
		System.out.println(date);
		MoneyBook moneybook = new MoneyBook();
		moneybook.setId_index(id_index);
		Date mbDate = new Date();
		
		try {
			mbDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		moneybook.setDate(mbDate);
		moneybook.setCategory(category);
		moneybook.setDetail(content);
		moneybook.setPrice(price);
		System.out.println(moneybook);
		
		int result = moneyBookService.moneyBookRegist(moneybook);
		
		if(result == 3201) {
			return 3201;
		} else {
			return 3202;
		}
	}
}
