package service;

import model.Member;

public interface IMemberService {
	// 아이디 중복검사
	public int idCheck(String id);

	// 닉네임 중복검사
	public int nickCheck(String nick);

	// 회원가입
	public int joinSuccess(Member m);

	// 수정할 때 지금 아이디의 비밀번호와 받아온 비밀번호 확인
	public int IdpwdCheck(String pwd, int id_index);

	// 닉네임 수정
	public int nickUpdate(int id_index, String nick);

	// 비밀번호 수정
	public int pwdUpdate(int id_index, String pwd, String newPwd);
	
	// 로그인 할 때는?
	// 받는 건 아이디랑 비번
	public Member login(String id, String pwd);
	
	// 카카오 로그인
	public Member kakaoLogin(String id);
	
	// 카카오 정보가지고 가입
	public void kakaoJoin(String id, String nick);
	
	public Member memberInfo(int id_index);
	
	//회원 삭제
	public void userDelete(int id_index);
	
	// 비밀번호 찾기
	public int foundPwd(String id, String pwd);
}
