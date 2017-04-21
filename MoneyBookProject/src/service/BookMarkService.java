package service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import dao.IBookMarkDao;

@Service
public class BookMarkService implements IBookMarkService {

	@Autowired
	private IBookMarkDao dao;

	// 즐겨찾기 가져오기
	@Override
	public HashMap<String, Object> bookMarkSearch(HashMap<String, Object> params) {
		return (HashMap<String, Object>) dao.selectOneBookmark(params);
	}

	// 북마크 테이블에서 삭제
	@Override
	public int bookMarkDelete(HashMap<String, Object> params) {
		int result = dao.deleteBookmark(params);

		if (result > 0) {
			return 5101;
		} else {
			return 5102;
		}
	}

	// 북마크 등록
	@Override
	public int bookMarkWrite(HashMap<String, Object> params) {
		int result = dao.insertBookmark(params);

		if (result > 0) {
			return 3101;
		} else {
			return 3102;
		}
	}

	// 북마크 개수 확인
	@Override
	public int checkbookNo(int id_index) {
		return dao.selectIdBookmark(id_index);
	}

}
