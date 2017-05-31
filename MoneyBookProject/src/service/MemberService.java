package service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.apache.ibatis.binding.BindingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.IBoardDao;
import dao.IBookMarkDao;
import dao.ICommentDao;
import dao.IExtraBoardDao;
import dao.IMemberDao;
import dao.IMoneyBookDao;
import dao.IRecommendDao;
import model.Member;

@Component
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao memberDao;
	@Autowired
	private IBoardDao boardDao;
	@Autowired
	private IExtraBoardDao extraBoardDao;
	@Autowired
	private IBookMarkDao bookmarkDao;
	@Autowired
	private IMoneyBookDao moneybookDao;
	@Autowired
	private ICommentDao commentDao;
	@Autowired
	private IRecommendDao recommendDao;

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
			try {
				memberDao.selectIdIndex(member.getId());
				
				return 2004;
			} catch (BindingException e) {
				if (memberDao.selectNick(member.getNick()) == null) {
					member.setPwd(userPwd);

					int result = memberDao.insertMember(member);

					if (result > 0)
						return 2001;
					else
						return 2002;
				} else {
					return 2005;
				}
			}
		}
	}

	@Override
	public int IdpwdCheck(String pwd, int id_index) {
		// TODO Auto-generated method stub
		// 수정할때 현재비밀번호랑 입력한비밀번호랑 같은지
		// 1200번대, 요구사항 명세서의 password_check 커맨드랑 같다고 봄

		// 로 만들 생각이였으나 회원 삭제할 때 쓰기로 함.

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
		
		int result;
		
		if(memberDao.selectNick(nick) != null) {
			result = 4104;
		} else {
			result = memberDao.nickUpdate(member);
			
			if (result > 0) {
				// 성공
				result = 4101;
			} else {
				// db수정 실패
				result = 4103;
			}
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
	public Member kakaoLogin(String id) {
		int id_index = memberDao.selectIdIndex(id);
		
		return memberDao.selectOneMember(id_index);
	}
	
	@Override
	public void kakaoJoin(String id, String nick) {
		Member member = new Member();
		
		member.setId(id);
		member.setNick(nick);
		
		memberDao.kakaoMember(member);
	}

	@Override
	public Member memberInfo(int id_index) {
		// id_index는 세션에서 끄내쓸거라 검색값이 없을리가 없을거라서 그냥 리턴
		Member member = memberDao.selectOneMember(id_index);

		return member;
	}

	@Override
	public void userDelete(int id_index) {
		// 작성한 게시글 boardNo 리스트<Integer>
		List<Integer> boardNoList = boardDao.selectBoardNo(id_index);

		if (!boardNoList.isEmpty()) {
			// 게시글 전부 삭제
			boardDao.deleteBoardById_index(id_index);
			// 엑스트라 보드 전부 삭제
			extraBoardDao.deleteExtraBoardById_index(id_index);
		}

		// 머니북 전부 삭제
		moneybookDao.dropMoneyBook(id_index);
		// 북마크 전부 삭제
		bookmarkDao.dropBookmark(id_index);
		for (int i = 0; i < boardNoList.size(); i++) {
			// 자기 게시글에 달린 댓글들 삭제
			commentDao.deleteBoardComment(boardNoList.get(i));
			// 자기 게시글 추천삭제
			recommendDao.deleterecommend(boardNoList.get(i));
		}

		// 회원 정보 삭제
		memberDao.deleteMember(id_index);
	}
}
