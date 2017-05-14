package service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.IMemberDao;
import model.Member;

@Component
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao memberDao;

	public String changePwd(String pwd) {
		MessageDigest md;

		try {
			md = MessageDigest.getInstance("MD5");
			md.update(pwd.getBytes());
			byte[] hash = md.digest();

			StringBuffer sb = new StringBuffer();

			for (int i = 0; i < hash.length; i++) {
				sb.append(Integer.toHexString(0xFF & hash[i]));
			}

			return sb.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public int idCheck(String id) { // 1000번대
		int result;
		try {
			// 반환값은 아이디 인덱스 결과값이 있다면 에러가 안남.
			memberDao.selectIdIndex(id);
			// 있을 경우
			result = 1001;
		} catch (BindingException e) {
			// 검색값이 없을 경우
			result = 1002;
		}
		return result;
	}

	@Override
	public int nickCheck(String nick) {// 1100번대
		int result;
		String selectNick = memberDao.selectNick(nick);

		if (selectNick != null) {
			result = 1101;
		} else {
			result = 1102;
		}

		return result;
	}

	@Override
	public int joinSuccess(Member member) {// 2000번대
		String userPwd = changePwd(member.getPwd());

		// 해시값 변환오류
		if (userPwd == null) {
			return 2003;
		} else {
			member.setPwd(userPwd);

			int result = memberDao.insertMember(member);

			if (result > 0)
				return 2001;
			else
				return 2002;
		}
	}

	@Override
	public int IdpwdCheck(String pwd, int id_index) {
		// TODO Auto-generated method stub
		// 수정할때 현재비밀번호랑 입력한비밀번호랑 같은지
		// 1200번대, 요구사항 명세서의 password_check 커맨드랑 같다고 봄
		String old = memberDao.selectOneMember(id_index).getPwd();
		String userPwd = changePwd(pwd);

		int result;

		if (userPwd.equals(old)) {
			result = 1201;
		} else {
			result = 1202;
		}

		return result;
	}

	@Override
	public int nickUpdate(int id_index, String nick) {
		Member member = new Member();

		member.setId_index(id_index);
		member.setNick(nick);

		int result = memberDao.nickUpdate(member);

		if (result > 0) {
			// 성공
			result = 4101;
		} else {
			// db수정 실패
			result = 4103;
		}

		return result;
	}

	@Override
	public int pwdUpdate(int id_index, String pwd, String newPwd) {
		int result;

		String userPwd = changePwd(pwd);

		if (userPwd.equals(memberDao.selectOneMember(id_index).getPwd())) {
			Member member = new Member();

			member.setId_index(id_index);
			member.setPwd(changePwd(newPwd));

			result = memberDao.pwdUpdate(member);

			if (result > 0) {
				// 성공
				result = 4101;
			} else {
				// db수정 실패
				result = 4103;
			}
		} else {
			// 현재 비번이랑 입력한 비번이랑 다를때
			result = 4102;
		}

		return result;
	}

	@Override
	public Member login(String id, String pwd) {
		// mysql문에서 select값이 인트인데 결과값이 없다면 BindingException이 나와서 예외처리.
		try {
			int id_index = memberDao.selectIdIndex(id);
			Member member = memberDao.selectOneMember(id_index);

			if (member != null) {
				String userPwd = changePwd(pwd);

				if (userPwd.equals(member.getPwd())) {
					return member;
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (BindingException e) {
			return null;
		}
	}

	@Override
	public Member memberInfo(int id_index) {
		// id_index는 세션에서 끄내쓸거라 검색값이 없을리가 없을거라서 그냥 리턴
		Member member = memberDao.selectOneMember(id_index);

		return member;
	}
}
