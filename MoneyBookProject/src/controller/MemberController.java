package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import model.Member;
import service.IMemberService;

// ****************************** viewResolver를 쓴다는 가정하에 했습니다.  *************************
//******************************* model의 키값은 일단 대충 제가 맘대로 했습니다. *************************
//******************************* 매개변수는 일단 기본값같은 설정은 하지 않았습니다. ************************

@Controller
public class MemberController {

	@Autowired
	private IMemberService memberService;

	// join_Form
	@RequestMapping("join_Form.do")
	public String joinForm() {
		return "joinForm";
	}

	// id_check
	//ajax
	@RequestMapping("id_Check.do")
	public @ResponseBody int idCheck(String id) {
		return memberService.idCheck(id);
	}

	// nick_check
	//ajax
	@RequestMapping("nick_Check.do")
	public @ResponseBody int nickCheck(String nick) {
		return memberService.nickCheck(nick);
	}

	// join_Success
	//ajax
	@RequestMapping(method = RequestMethod.POST, value = "join_Success.do")
	public @ResponseBody int joinSuccess(Member m) {
		return memberService.joinSuccess(m);
	}

	// login_Form
	@RequestMapping("login_Form.do")
	public String loginForm() {
		return "loginForm";
	}

	// login_Success
	//ajax
	@RequestMapping(method = RequestMethod.POST, value = "login_Success.do")
	public @ResponseBody int loginSuccess(HttpSession session, String id, String pwd) {
		Member member = memberService.login(id, pwd);

		if (member != null) {
			session.setAttribute("id_index", member.getId_index());
			return 2101;
		} else {
			return 2102;
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id_index");
		// 로그아웃하면 메인으로??
		return "redirect:main.do";
	}

	// password_Check
	//ajax
	@RequestMapping("password_Check.do")
	public @ResponseBody int passwordCheck(int id_index, String pwd) {
		return memberService.IdpwdCheck(pwd, id_index);
	}

	// inform_Update_Form
	@RequestMapping("inform_Update_Form.do")
	public ModelAndView informUpdateForm(Member member) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("member", member);
		mav.setViewName("informUpdateForm");

		return mav;
	}

	// inform_Update
	//ajax
	@RequestMapping("inform_Update.do")
	public @ResponseBody int infromUpdate(Member member) {
		return memberService.updateMember(member);
	}
}