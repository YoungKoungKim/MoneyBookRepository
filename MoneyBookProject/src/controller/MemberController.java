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
import service.KakaoService;

// ****************************** viewResolver를 쓴다는 가정하에 했습니다.  *************************
//******************************* model의 키값은 일단 대충 제가 맘대로 했습니다. *************************
//******************************* 매개변수는 일단 기본값같은 설정은 하지 않았습니다. ************************

@Controller
public class MemberController {

	@Autowired
	private IMemberService memberService;
	@Autowired
	private KakaoService kakaoService;

	// join_Form
	@RequestMapping("joinForm.do")
	public String joinForm() {
		return "joinForm";
	}

	// id_check
	// ajax
	@RequestMapping("idCheck.do")
	public @ResponseBody int idCheck(String id) {
		return memberService.idCheck(id);
	}

	// nick_check
	// ajax
	@RequestMapping("nickCheck.do")
	public @ResponseBody int nickCheck(String nick) {
		return memberService.nickCheck(nick);
	}

	// join_Success
	// ajax
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
	// ajax
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
		return "redirect:home.do";
	}

	// password_Check
	// ajax
	// 이건 안쓴거같은데...
	@RequestMapping("passwordCheck.do")
	public @ResponseBody int passwordCheck(HttpSession session, String pwd) {
		return memberService.IdpwdCheck(pwd, (int) session.getAttribute("id_index"));
	}

	@RequestMapping(value = "myInfo.do")
	public ModelAndView informUpdateForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("id_index") != null) {
			int id = (int) session.getAttribute("id_index");

			Member member = memberService.memberInfo(id);

			mav.addObject("member", member);
			if(member.getPwd().equals("0000")) {
				mav.addObject("userType", "카카오");
			} else {
				mav.addObject("userType", "일반");
			}
			mav.setViewName("myInfo");
		} else {
			mav.setViewName("redirect:home.do");
		}

		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "nickUpdate.do")
	public @ResponseBody int nickUpdate(HttpSession session, String nick) {
		int result = memberService.nickUpdate((int) session.getAttribute("id_index"), nick);

		if (result == 4101) {
			session.setAttribute("nick", nick);
		}

		return result;
	}

	@RequestMapping(method = RequestMethod.POST, value = "pwdUpdate.do")
	public @ResponseBody int pwdUpdate(HttpSession session, String pwd, String newPwd) {

		return memberService.pwdUpdate((int) session.getAttribute("id_index"), pwd, newPwd);
	}

	// 회원 탈퇴
	@RequestMapping("userDelete.do")
	public String userDelete(HttpSession session, String pwd) {
		memberService.userDelete((int) session.getAttribute("id_index"));

		return "redirect:logout.do";
	}

	// 카카오 로그인
	@RequestMapping("kakaoLogin.do")
	public @ResponseBody void kakaoLogin(HttpSession session, String id, String nick) {
		int result = memberService.idCheck(id);

		if (result == 1002) {
			memberService.kakaoJoin(id, nick);
		}

		Member member = memberService.kakaoLogin(id);

		session.setAttribute("id_index", member.getId_index());
		session.setAttribute("nick", member.getNick());
	}

	// 카카오 연동 해제
	@RequestMapping("kakaoDelete.do")
	public @ResponseBody void kakaoDelete(String token) {
		kakaoService.setAdminKey("3765d093aa949271d59828b3c1954189");
		kakaoService.setAccessToken(token);

		kakaoService.unlink();
	}
	
	@RequestMapping(method = RequestMethod.POST, name = "foundPwd.do")
	public @ResponseBody int foundPwd(String id, String pwd) {
		return memberService.foundPwd(id, pwd);
	}
}
