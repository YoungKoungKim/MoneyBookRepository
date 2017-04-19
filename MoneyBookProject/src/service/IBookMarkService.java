package service;

import java.util.HashMap;

public interface IBookMarkService {
	public HashMap<String, Object> bookMarkSearch(HashMap<String, Object> params);

	public int bookMarkDelete(HashMap<String, Object> params);

	public int bookMarkWrite(HashMap<String, Object> params);

	public int checkbookNo(int id_index);
}