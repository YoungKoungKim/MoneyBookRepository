package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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

}
