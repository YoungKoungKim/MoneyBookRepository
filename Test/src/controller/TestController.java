package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@RequestMapping("hello.do")
	public ModelAndView hello() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hello");
		return mav;
	}
	
	@RequestMapping("bye.do")
	public ModelAndView bye() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bye");
		return mav;
	}
}
