package service;

public interface ISecondRecommendService {
	public int Writerecommend(int boardNo, int id_index, int commentNo);
	public boolean Searchrecommend(int boardNo, int id_index, int commentNo);
}
