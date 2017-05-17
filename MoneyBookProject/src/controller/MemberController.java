package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.net.ssl.HttpsURLConnection;
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

		try {
			int id = (int) session.getAttribute("id_index");

			Member member = memberService.memberInfo(id);

			mav.addObject("member", member);
			mav.setViewName("myInfo");

		} catch (NullPointerException e) {
			mav.setViewName("redirect:home.do");
		}

		return mav;
	}

	@RequestMapping(method = RequestMethod.POST, value = "nickUpdate.do")
	public @ResponseBody int nickUpdate(HttpSession session, String nick) {

		return memberService.nickUpdate((int) session.getAttribute("id_index"), nick);
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
			Member member = new Member();

			member.setId(id);
			member.setNick(nick);
			member.setPwd("0000");

			memberService.joinSuccess(member);
		}

		Member member = memberService.login(id, "0000");

		session.setAttribute("id_index", member.getId_index());
		session.setAttribute("nick", member.getNick());
	}

	// 카카오 연동 해제
	@RequestMapping("kakaoDelete.do")
	public @ResponseBody String kakaoDelete(String token) {
		setAccessToken(token);

		unlink();
		
		return "success";
	}

	public String unlink() {
		return request(HttpMethodType.POST, USER_UNLINK_PATH);
	}

	public enum HttpMethodType {
		POST, GET, DELETE
	}

	private static final String API_SERVER_HOST = "https://kapi.kakao.com";

	private static final String USER_UNLINK_PATH = "/v1/user/unlink";
	private static final String USER_IDS_PATH = "/v1/user/ids";

	private static final String PUSH_REGISTER_PATH = "/v1/push/register";
	private static final String PUSH_TOKENS_PATH = "/v1/push/tokens";
	private static final String PUSH_DEREGISTER_PATH = "/v1/push/deregister";
	private static final String PUSH_SEND_PATH = "/v1/push/send";

	private String accessToken;
	private String adminKey = "9712483447f19279ea7f16e2db8de389";

	public void setAccessToken(final String accessToken) {
		this.accessToken = accessToken;
	}

	public void setAdminKey(final String adminKey) {
		this.adminKey = adminKey;
	}

	private static final List<String> adminApiPaths = new ArrayList<String>();

	static {
		adminApiPaths.add(USER_IDS_PATH);
		adminApiPaths.add(PUSH_REGISTER_PATH);
		adminApiPaths.add(PUSH_TOKENS_PATH);
		adminApiPaths.add(PUSH_DEREGISTER_PATH);
		adminApiPaths.add(PUSH_SEND_PATH);
	}

	public String request(final HttpMethodType httpMethod, final String apiPath) {
		return request(httpMethod, apiPath, null);
	}

	public String request(HttpMethodType httpMethod, final String apiPath, final String params) {

		String requestUrl = API_SERVER_HOST + apiPath;
		if (httpMethod == null) {
			httpMethod = HttpMethodType.GET;
		}
		if (params != null && params.length() > 0
				&& (httpMethod == HttpMethodType.GET || httpMethod == HttpMethodType.DELETE)) {
			requestUrl += params;
		}

		HttpsURLConnection conn;
		OutputStreamWriter writer = null;
		BufferedReader reader = null;
		InputStreamReader isr = null;

		try {
			final URL url = new URL(requestUrl);
			conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod(httpMethod.toString());

			if (adminApiPaths.contains(apiPath)) {
				conn.setRequestProperty("Authorization", "KakaoAK " + this.adminKey);
			} else {
				conn.setRequestProperty("Authorization", "Bearer " + this.accessToken);
			}

			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			conn.setRequestProperty("charset", "utf-8");

			if (params != null && params.length() > 0 && httpMethod == HttpMethodType.POST) {
				conn.setDoOutput(true);
				writer = new OutputStreamWriter(conn.getOutputStream());
				writer.write(params);
				writer.flush();
			}

			final int responseCode = conn.getResponseCode();
			System.out.println(String.format("\nSending '%s' request to URL : %s", httpMethod, requestUrl));
			System.out.println("Response Code : " + responseCode);
			if (responseCode == 200)
				isr = new InputStreamReader(conn.getInputStream());
			else
				isr = new InputStreamReader(conn.getErrorStream());

			reader = new BufferedReader(isr);
			final StringBuffer buffer = new StringBuffer();
			String line;
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			System.out.println(buffer.toString());
			return buffer.toString();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (writer != null)
				try {
					writer.close();
				} catch (Exception ignore) {
				}
			if (reader != null)
				try {
					reader.close();
				} catch (Exception ignore) {
				}
			if (isr != null)
				try {
					isr.close();
				} catch (Exception ignore) {
				}
		}

		return null;
	}
}
