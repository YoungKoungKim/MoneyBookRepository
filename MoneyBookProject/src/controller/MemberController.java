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
	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "joinForm";
	}

	// id_check
	//ajax
	@RequestMapping("idCheck.do")
	public @ResponseBody int idCheck(String id) {
		return memberService.idCheck(id);
	}

	// nick_check
	//ajax
	@RequestMapping("nickCheck.do")
	public @ResponseBody int nickCheck(String nick) {
		return memberService.nickCheck(nick);
	}

	// join_Success
	//ajax
	@RequestMapping(method = RequestMethod.POST, value = "joinSuccess.do")
	public @ResponseBody int joinSuccess(Member m) {
		return memberService.joinSuccess(m);
	}

	// login_Form
	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "loginForm";
	}

	// login_Success
	//ajax
	@RequestMapping(method = RequestMethod.POST, value = "loginSuccess.do")
	public @ResponseBody int loginSuccess(HttpSession session, String id, String pwd) {
		Member member = memberService.login(id, pwd);
			
		if (member != null) {
			session.setAttribute("id_index", member.getId_index());
			session.setAttribute("nick", member.getNick());
			return 2101;
		} else {
			return 2102;
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("id_index");
		session.removeAttribute("nick");
		
		// 로그아웃하면 메인으로??
		return "redirect:test.do";
	}

	// password_Check
	//ajax
	@RequestMapping("passwordCheck.do")
	public @ResponseBody int passwordCheck(int id_index, String pwd) {
		return memberService.IdpwdCheck(pwd, id_index);
	}

	// inform_Update_Form
	@RequestMapping("informUpdateForm.do")
	public ModelAndView informUpdateForm(int id_index) {
		ModelAndView mav = new ModelAndView();

		Member member = memberService.memberInfo(id_index);
		
		mav.addObject("member", member);
		mav.setViewName("informUpdateForm");

		return mav;
	}

	// inform_Update
	//ajax
	@RequestMapping(method = RequestMethod.POST, value = "informUpdate.do")
	public @ResponseBody int infromUpdate(Member member, String newPwd) {
		return memberService.updateMember(member, newPwd);
	}
}