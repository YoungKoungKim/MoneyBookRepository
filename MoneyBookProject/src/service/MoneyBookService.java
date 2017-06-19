package service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dao.IMoneyBookDao;
import model.ExtraBoard;
import model.MoneyBook;

@Component
public class MoneyBookService implements IMoneyBookService {
	@Autowired
	IMoneyBookDao moneyBookDao;

	@Override
	public List<MoneyBook> getMonthContent(int id_index, Date date) {
		HashMap<String, Object> params = new HashMap<>();
		params = searchDate(date);
		params.put("id_index", id_index);
		List<MoneyBook> list = new ArrayList<>();
		list = moneyBookDao.selectOneMonth(params);
		return list;
	}

	@Override
	public HashMap<String, Object> totalMonthAmount(int id_index, Date date) {
		List<MoneyBook> list = getMonthContent(id_index, date);
		HashMap<String, Object> result = new HashMap<>();
		int income = 0;
		int expense = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCategory().trim().equals("income")) {
				income += list.get(i).getPrice();
			} else {
				expense += list.get(i).getPrice();
			}
		}
		result.put("income", income);
		result.put("expense", expense);

		return result;
	}

	@Override
	public HashMap<String, Object> totalAmountByCategory(int id_index, Date date) {
		List<MoneyBook> list = getMonthContent(id_index, date);
		HashMap<String, Object> params = new HashMap<>();
		HashMap<String, Object> percent = new HashMap<>();
		int food = 0; // 식비
		int traffic = 0;// 교통비
		int commodity = 0; // 생필품
		int beauty = 0;// 미용
		int medical = 0;// 의료
		int education = 0;// 교육
		int phonefees = 0;// 통신비
		int saving = 0;// 저축
		int utilitybills = 0;// 공과금
		int culturallife = 0;// 문화생활비
		int otheritems = 0;// 기타
		int income = 0; // 수입

		int expense = (int) totalMonthAmount(id_index, date).get("expense");

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCategory().trim().equals("food")) {
				food += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("traffic")) {
				traffic += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("commodity")) {
				commodity += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("beauty")) {
				beauty += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("medical")) {
				medical += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("education")) {
				education += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("phonefees")) {
				phonefees += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("saving")) {
				saving += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("utilitybills")) {
				utilitybills += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("culturallife")) {
				culturallife += list.get(i).getPrice();
			} else if (list.get(i).getCategory().trim().equals("income")) {
				income += list.get(i).getPrice();
			} else {
				otheritems += list.get(i).getPrice();
			}
		}

		if (food != 0) {
			params.put("food", food);
			percent.put("foodPercent", (int) (((double) food / (double) expense) * 100));
		}
		if (traffic != 0) {
			params.put("traffic", traffic);
			percent.put("trafficPercent", (int) (((double) traffic / (double) expense) * 100));

		}
		if (medical != 0) {
			params.put("medical", medical);
			percent.put("medicalPercent", (int) (((double) medical / (double) expense) * 100));
		}
		if (beauty != 0) {
			params.put("beauty", beauty);
			percent.put("beautyPercent", (int) (((double) beauty / (double) expense) * 100));
		}
		if (commodity != 0) {
			params.put("commodity", commodity);
			percent.put("commodityPercent", (int) (((double) commodity / (double) expense) * 100));
		}
		if (education != 0) {
			params.put("education", education);
			percent.put("educationPercent", (int) (((double) education / (double) expense) * 100));

		}
		if (phonefees != 0) {
			params.put("phonefees", phonefees);
			percent.put("phonefeesPercent", (int) (((double) phonefees / (double) expense) * 100));

		}
		if (saving != 0) {
			params.put("saving", saving);
			percent.put("savingPercent", (int) (((double) saving / (double) expense) * 100));

		}
		if (utilitybills != 0) {
			params.put("utilitybills", utilitybills);
			percent.put("utilitybillsPercent", (int) (((double) utilitybills / (double) expense) * 100));

		}
		if (culturallife != 0) {
			params.put("culturallife", culturallife);
			percent.put("culturallifePercent", (int) (((double) culturallife / (double) expense) * 100));

		}
		if (income != 0) {
			params.put("incomes", income);

		}
		if (otheritems != 0) {
			params.put("otheritems", otheritems);
			percent.put("otheritemsPercent", (int) (((double) otheritems / (double) expense) * 100));

		}

		List<ExtraBoard> extraboard = new ArrayList<>();
		for (String key : params.keySet()) {
			ExtraBoard exboard = new ExtraBoard();
			exboard.setCategory(key);
			exboard.setPrice((int) params.get(key));
			for (String keys : percent.keySet()) {
				if ((key + "Percent").trim().equals(keys)) {
					exboard.setPercent((int) percent.get(key + "Percent"));
				}

			}
			extraboard.add(exboard);
		}

		MiniComparator comp = new MiniComparator();
		Collections.sort(extraboard, comp);

		params.put("list", extraboard);
		return params;
	}

	@Override
	public List<MoneyBook> getDayContent(Date date, int id_index) {
		HashMap<String, Object> params = new HashMap<>();
		params = searchDate(date);
		params.put("id_index", id_index);
		List<MoneyBook> list = moneyBookDao.selectByDate(params);
		return list;
	}

	@Override
	public HashMap<String, Object> totalDayAmount(Date date, int id_index) {
		List<MoneyBook> list = getDayContent(date, id_index);
		HashMap<String, Object> result = new HashMap<>();
		int income = 0;
		int expense = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getCategory().trim().equals("income"))
				income += list.get(i).getPrice();
			else
				expense += list.get(i).getPrice();
		}
		result.put("income", income);
		result.put("expense", expense);

		return result;
	}

	@Override
	public HashMap<String, Object> searchDate(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		int year = calendar.get(calendar.YEAR);
		int month = calendar.get(calendar.MONTH);
		int day = calendar.get(calendar.DAY_OF_MONTH);

		Date firstMonth = new Date();
		firstMonth.setYear(year - 1900);
		firstMonth.setMonth(month);
		firstMonth.setDate(01);

		Date endMonth = new Date();
		endMonth.setYear(year - 1900);
		endMonth.setMonth(month);
		int lastDay;
		if ((month + 1) == 2) {
			lastDay = 28;
		} else if ((month + 1) % 2 == 1) {
			lastDay = 31;
		} else {
			lastDay = 30;
		}
		endMonth.setDate(lastDay);

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		HashMap<String, Object> params = new HashMap<>();
		params.put("date", format.format(date));
		params.put("year", year);
		params.put("nowMonth", calendar.get(calendar.MONTH) + 1);
		params.put("startMonth", format.format(firstMonth));
		params.put("endMonth", format.format(endMonth));
		return params;
	}

	@Override
	public int moneyBookRegist(MoneyBook mb) {
		int result = moneyBookDao.insertMoneyBook(mb);
		if (result > 0)
			return 3201; // 성공
		else
			return 3202; // 실패
	}

	@Override
	public MoneyBook moneyBookSelectOne(int moneyBookNo, int id_index, Date date) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		HashMap<String, Object> params = new HashMap<>();
		params.put("id_index", id_index);
		params.put("date", format.format(date));
		List<MoneyBook> list = new ArrayList<>();
		list = moneyBookDao.selectByDate(params);
		for (MoneyBook mb : list) {
			if (mb.getMoneyBookNo() == moneyBookNo)
				return mb;
		}
		return null;
	}

	@Override
	public int moneyBookDelete(int moneyBookNo, int id_index) {
		HashMap<String, Object> params = new HashMap<>();
		params.put("moneyBookNo", moneyBookNo);
		params.put("id_index", id_index);
		int result = moneyBookDao.deleteMoneyBook(params);
		if (result > 0)
			return 5001; // 성공
		else
			return 5002; // 실패
	}

	@Override
	public int moneyBookUpdate(MoneyBook mb) {
		int result = moneyBookDao.updateMoneyBook(mb);
		if (result > 0)
			return 4201; // 성공
		else
			return 4202; // 실패
	}

	// 하루치 수입/지출을 한 달 분 다 가지고 오는 메소드
	// ex ) 1일 수입,지출 2일 수입, 지출....31일 수입,지출
	@Override
	public List<String[]> oneMonthAmount(int id_index, Date date) {
		// index 0:날짜 1:수입 2:지출
		List<String[]> monthAmountList = new ArrayList<>();
		HashMap<String, Object> dateInfo = searchDate(date);
		int lastDay = Integer.parseInt(dateInfo.get("endMonth").toString().substring(8, 10));
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 1; i <= lastDay; i++) {
			String[] arr = new String[3];
			int income = 0;
			int expense = 0;
			Date tmpDate = date;
			tmpDate.setDate(i);
			List<MoneyBook> mbList = getDayContent(date, id_index);
			for (MoneyBook mb : mbList) {
				if (mb.getCategory().equals("income")) {
					income += mb.getPrice();
				} else {
					expense += mb.getPrice();
				}
			}
			arr[0] = format.format(tmpDate);
			arr[1] = String.valueOf(income);
			arr[2] = String.valueOf(expense);
			monthAmountList.add(arr);
		}

		return monthAmountList;
	}
}

// 정렬을 위한 클래스
class MiniComparator implements Comparator<ExtraBoard> {

	@Override
	public int compare(ExtraBoard first, ExtraBoard second) {
		// TODO Auto-generated method stub
		int first_percent = first.getPercent();
		int second_percent = second.getPercent();

		// 내림차순 정렬
		if (first_percent > second_percent) {
			return -1;
		} else if (first_percent < second_percent) {
			return 1;
		} else {
			return 0;
		}
	}
}
