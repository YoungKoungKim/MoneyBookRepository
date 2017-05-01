package dao;

import java.util.HashMap;
import java.util.List;

import commons.BookMark;

public interface IBookMarkDao {
	public int insertBookmark(HashMap<String, Object> params);			
	public int updateBookmark(HashMap<String, Object> params);		
	public int deleteBookmark(HashMap<String, Object> params);
	public List<HashMap<String, Object>> selectBookmarkList(int id_index);		
	public int countBookmarkNo(int id_index);
	public HashMap<String, Object> selectOneBookmark(HashMap<String, Object> params);
}
