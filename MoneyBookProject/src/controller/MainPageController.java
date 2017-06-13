package controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.fabric.xmlrpc.base.Array;

import model.Repo;
import service.IBoardService;
import service.IMoneyBookService;

@Controller
public class MainPageController {
	@Autowired
	private IBoardService boardservice;
	@Autowired
	private IMoneyBookService moneyBookService;
	
	@RequestMapping("homerecommend.do")
	public String maxrecommend(){
		int result = boardservice.bestView(1).get(0).getBoardNo();
		System.out.println(result);
		return "redirect:boardDetailView.do?boardNo="+result+"&page=1";
	}

	@RequestMapping("home.do")
	public String newHome() {
		return "newhome/newHome12";
	}
	
	@RequestMapping("howToUseMoneyBook.do")
	public String howToUseMoneyBook() {
		return "howToUseMoneyBook";
	}
	
	@RequestMapping("template.do")
	public String template() {
		return "template2";
	}
	
	@RequestMapping(value="and/android.do", method=RequestMethod.GET)
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

}
