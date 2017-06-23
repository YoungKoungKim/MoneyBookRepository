package controller;

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

import dao.IMemberDao;
import dao.IMoneyBookDao;
import model.Member;
import model.MoneyBook;
import model.Repo;
import service.IMemberService;
import service.IMoneyBookService;
import service.MoneyBookService;

@Controller
public class AndroidController {
	private MoneyBook mb;
	@Autowired
	private IMoneyBookService moneyBookService;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping(method = RequestMethod.POST, value = "android/login.do")
	public @ResponseBody HashMap<String, Object> loginSuccess(String id, String pwd) {
		HashMap<String, Object> result = new HashMap<>();
		System.out.println("로그인 요청");
		Member member = memberService.login(id, pwd);

		if (member != null) {
			result.put("result", "2101");
			HashMap<String, Object> firstInfo = moneyBookService.startMoneyBook(id);
			result.put("id_index", firstInfo.get("id_index"));
			result.put("moneybookList", firstInfo.get("mbList"));
			System.out.println(firstInfo.get("mbList").toString());
		} else {
			result.put("result", "2102");
		}
		
		return result;
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
	public @ResponseBody HashMap<String, Object> moneyBookView(int id_index) {
		System.out.println("moneyBookList");
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
}
