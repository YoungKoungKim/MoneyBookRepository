package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IRecommendDao;
import model.Recommend;

@Service
public class RecommendService implements IRecommendService{

	@Autowired
	private IRecommendDao rdao;
	
	@Override
	public int Writerecommend(int boardNo, int id_index, int commentNo) {
		Recommend recommend = new Recommend();
		recommend.setBoardNo(boardNo);
		recommend.setCommentNo(commentNo);
		recommend.setId_index(id_index);	
		rdao.insertrecommend(recommend);			
		return 0;
	}

	@Override
	public boolean Searchrecommend(int boardNo, int id_index, int commentNo) {
			Recommend recommend = new Recommend();
			recommend.setBoardNo(boardNo);
			recommend.setCommentNo(commentNo);
			recommend.setId_index(id_index);
			try {
				Recommend recommend2 = rdao.selectrecommend(recommend);
				if(recommend2 == null){
					return false;				
				}
				else{
					return true;				
				}
			} catch (NullPointerException e) {
				return false;
			}
			
			
	}
	
}
