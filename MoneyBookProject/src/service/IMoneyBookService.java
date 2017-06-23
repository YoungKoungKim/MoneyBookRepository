package service;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import model.MoneyBook;

public interface IMoneyBookService {
	public List<MoneyBook> getMonthContent(int id_index,Date date);
	public HashMap<String, Object> totalMonthAmount(int id_index, Date date);
	public HashMap<String, Object> totalAmountByCategory(int id_index,Date date);
	public List<MoneyBook> getDayContent(Date date, int id_index);
	public HashMap<String, Object> totalDayAmount(Date date, int id_index);
	public HashMap<String, Object> searchDate(Date date);
	public int moneyBookRegist(MoneyBook mb);
	public MoneyBook moneyBookSelectOne(int moneyBookNo, int id_index, Date date);
	public int moneyBookDelete(int moneyBookNo, int id_index);
	public int moneyBookUpdate(MoneyBook mb);
	public List<String[]> oneMonthAmount(int id_index, Date date);
	public HashMap<String, Object> startMoneyBook(String id);
}