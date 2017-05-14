package dao;

import model.Member;

public interface IMemberDao {
	// 회원가입
	public int insertMember(Member member);

	// 닉네임 수정
	public int nickUpdate(Member member);

	// 비밀번호 수정
	public int pwdUpdate(Member member);

	// 회원 삭제
	public int deleteMember(int id_index);

	// //전체 회원 리스트 이거 필요 없을 듯
	// public List<Member> selectAllMember();
	// id인덱스로 회원한명 가져오기
	public Member selectOneMember(int id_index);

	// 아이디로 인덱스 가져오기
	public int selectIdIndex(String id);

	// 닉네임으로 닉네임 검색해서 중복검사인 듯
	public String selectNick(String nick);
}
