package service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.IBoardDao;
import dao.ICommentDao;
import dao.IExtraBoardDao;
import dao.IMemberDao;
import dao.IRecommendDao;
import model.Board;
import model.ExtraBoard;
import model.Member;

@Service
public class BoardService implements IBoardService {
	@Autowired
	private IBoardDao bDao;
	@Autowired
	private IMemberDao mDao;
	@Autowired
	private IExtraBoardDao ebDao;
	@Autowired
	private IMoneyBookService moneybookservice;
	@Autowired
	private ICommentDao cdao;
	@Autowired
	private IRecommendDao rdao;
	
	@Override
	public int boardRecommand(int boardNo) {
		int result = bDao.updateRecommendBoard(boardNo);
		if (result > 0)
			return 4001;
		else
			return 4002;
	}

	@Override
	public int boardUpdate(Board board) {
		int result = bDao.updateBoard(board);
		if (result > 0)
			return 4001;
		else
			return 4002;
	}

	@Override
	public List<Board> boardSearch(String type, String search_content) {
		List<Board> list = new ArrayList<Board>();

		if (type.equals("nick")) {
			list = bDao.selectByNick(search_content);

		} else if (type.equals("title")) {
			HashMap<String, Object> params = new HashMap<>();
			params.put("title", search_content);
			list = bDao.selectByWhat(params);

		} else if (type.equals("ageType")) {
			list = bDao.selectByAgeType(search_content);
		}
		return list;
	}

	@Override
	public boolean checkMyText(Member member, int id_index) {
		// 내가 쓴 댓글인지 확인
		if (mDao.selectIdIndex(member.getId()) == id_index)
			return true;
		else
			return false;
	}

	@Override
	public HashMap<String, Object> searchText(int boardNo) {
		// 게시글 불러오기(하나)
		HashMap<String, Object> params = new HashMap<>();
		Board board = bDao.selectOneBoard(boardNo);
		List<ExtraBoard> extraList = ebDao.selectOne(boardNo);
		Date date = null;
		int year = 0;
		int month = 0;
		try {
			
			 date = extraList.get(0).getMonth();
				
			 Calendar c = Calendar.getInstance(); //객체 생성 및 현재 일시분초...셋팅
			 c.setTime(date);
				
			 year =  c.get(c.YEAR);
			 month = c.get(c.MONTH)+1;
			
		} catch (IndexOutOfBoundsException e) {
			// TODO: handle exception
		} catch (NullPointerException e) {
			// TODO: handle exception
		}
		
		
		
		params.put("year", year);
		params.put("nowMonth", month);
		params.put("board", board);
		params.put("list", extraList);
		return params;
	}

	@Override
	public List<Board> bestView(int count) {
		if(bDao.selectBest(count).isEmpty()){
			return null;
		}
		return bDao.selectBest(count);
	}

	@Override
	public void boardWrite(Board board, Date date2) {
		
		 HashMap<String, Object>  amount = moneybookservice.totalMonthAmount(board.getId_index(), date2);
		 int expense = (int)amount.get("expense");
		 
		ExtraBoard eboard = new ExtraBoard();
		bDao.insertBoard(board);
		eboard.setBoardNo(board.getBoardNo());
		eboard.setId_index(board.getId_index());
		
		eboard.setMonth(date2);

		 HashMap<String, Object> category= (HashMap<String, Object>) moneybookservice.totalAmountByCategory(board.getId_index(),date2);
		 	List<ExtraBoard> list= (List<ExtraBoard>) category.get("list");
		 	for(int i = 0 ; i< list.size(); i++ ){
		 		eboard.setCategory(list.get(i).getCategory());
		 		eboard.setPrice(list.get(i).getPrice());
		 		eboard.setPercent(list.get(i).getPercent());
				ebDao.insertExtraBoard(eboard);
		 	}		 	
		for(String key : amount.keySet()){
			eboard.setCategory(key);
			eboard.setPrice((int)amount.get(key));
			eboard.setPercent(0);
			ebDao.insertExtraBoard(eboard);
		}
		
	}

	@Override
	public HashMap<String, Object> getboardList(int page, String ageType, String category, String content) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("category", category);
		params.put("content", content);
		params.put("ageType", ageType);
		// 시작페이지와 끝페이지를 계산해보세요
		int start = (page - 1) / 10 * 10 + 1;
		int end = ((page - 1) / 10 + 1) * 10;
		// 첫페이지와 마지막페이지를 계산
		int first = 1;
		int last = (bDao.getBoardCount(params) - 1) / 10 + 1;
		// 끝페이지 검증
		end = last < end ? last : end;
		// 해당 페이지의 게시물을 쿼리하기 위한 skip과 count
		int skip = (page - 1) * 10;
		int count = 10;
		params.put("skip", skip);
		params.put("count", count);
		List<Board> list;
		if (!category.equals("0")) {
			list = bDao.selectByWhat(params);
		} else {
			list = bDao.selectboardLimit(params);
		}

		HashMap<String, Object> result = new HashMap<>();
		result.put("start", start);
		result.put("first", first);
		result.put("ageType", ageType);
		result.put("end", end);
		result.put("last", last);
		result.put("current", page);
		result.put("boardList", list);
		result.put("category", category);
		result.put("content", content);
		return result;
	}

	@Override
	public void boardReadCount(int boardNo) {
		Board board = bDao.selectOneBoard(boardNo);
		board.setViewNo(board.getViewNo() + 1);
		bDao.updateBoard(board);

	}

	@Override
	public int boardDelete(int boardNo) {
		bDao.deleteBoard(boardNo);
		ebDao.deleteExtraBoard(boardNo);
		cdao.deleteBoardComment(boardNo);
		rdao.deleterecommend(boardNo);
		return 0;
	}


}