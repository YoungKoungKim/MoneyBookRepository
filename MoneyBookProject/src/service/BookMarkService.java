package service;

import java.util.HashMap;
import java.util.List;

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
	public List<HashMap<String, Object>> bookMarkSearch(int id_index) {
		return dao.selectBookmarkList(id_index);
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
		return dao.countBookmarkNo(id_index);
	}

	@Override
	public HashMap<String, Object> searchOneBookmark(HashMap<String, Object> params) {
		
		return dao.selectOneBookmark(params);
	}

	@Override
	public int bookMarkModify(HashMap<String, Object> params) {
		int result = dao.updateBookmark(params);
		if (result > 0) {
			return 4301;
		} else {
			return 4302;
		}
	}

}