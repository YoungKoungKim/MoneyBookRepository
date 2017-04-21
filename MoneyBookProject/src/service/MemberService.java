package service;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.IMemberDao;
import model.Member;

@Component
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao memberDao;

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
		
		if(selectNick != null) {
			result = 1101;
		} else {
			result = 1102;
		}
		
		return result;
	}

	@Override
	public int joinSuccess(Member member) {// 2000번대
		int result = memberDao.insertMember(member);
		
		if (result > 0)
			return 2001;
		else
			return 2002;
	}

	@Override
	public int IdpwdCheck(String pwd, int id_index) {
		// TODO Auto-generated method stub
		// 수정할때 현재비밀번호랑 입력한비밀번호랑 같은지
		// 1200번대, 요구사항 명세서의 password_check 커맨드랑 같다고 봄
		String old = memberDao.selectOneMember(id_index).getPwd();
		int result = 0;

		if (pwd.equals(old))
			result = 1201;
		else
			result = 1202;

		return result;
	}

	@Override
	public int updateMember(Member member) { // 4100번대
		// TODO Auto-generated method stub
		int result = memberDao.updateMember(member);

		if (result > 0)
			result = 4101;
		else
			result = 4102;

		return result;
	}

	@Override
	public Member login(String id, String pwd) {
		int id_index = memberDao.selectIdIndex(id);

		Member member = memberDao.selectOneMember(id_index);

		if (member != null) {
			if (member.getPwd().equals(pwd)) {
				return member;
			} else {
				return null;
			}
		} else {
			return null;
		}

	}
}
