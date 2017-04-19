package dao;

import java.util.List;

import model.Member;

public interface IMemberDao {
   	public int insertMember(Member m);
   	public int updateMember(String nick, String pwd, int id_index);			
   	public int deleteMember(int id_index);		
   	public List<Member> selectAllMember();			
   	public Member selectOneMember(int id_index);
   	public int selectIdIndex(String id);
      public int selectNick(String nick);

}
