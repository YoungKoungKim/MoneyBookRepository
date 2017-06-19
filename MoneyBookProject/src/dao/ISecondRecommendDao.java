package dao;

import model.Recommend;

public interface ISecondRecommendDao {
	public int insertrecommend(Recommend recommend);
	public Recommend selectrecommend(Recommend recommend);
	public boolean deleterecommend(int boardNo);
}
