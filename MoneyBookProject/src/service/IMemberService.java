package service;

import model.Member;

public interface IMemberService {
	public int idCheck(String id);
	public int nickCheck(String nick);
	public int joinSuccess(Member m);
	public int IdpwdCheck(String pwd, int id_index); 
	public int updateMember(Member member);

}
