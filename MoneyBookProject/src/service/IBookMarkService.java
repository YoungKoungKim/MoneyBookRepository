package service;

import java.util.HashMap;
import java.util.List;

public interface IBookMarkService {
	public List<HashMap<String, Object>> bookMarkSearch(int id_index);

	public int bookMarkDelete(HashMap<String, Object> params);

	public int bookMarkWrite(HashMap<String, Object> params);

	public int checkbookNo(int id_index);
	
	public HashMap<String, Object> searchOneBookmark(int id_index, int bookmarkNo);
}