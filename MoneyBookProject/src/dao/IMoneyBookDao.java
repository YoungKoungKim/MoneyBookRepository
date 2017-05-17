package dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Component;

import model.MoneyBook;

public interface IMoneyBookDao {
	int insertMoneyBook(MoneyBook mb);
	int updateMoneyBook(MoneyBook mb);
	int deleteMoneyBook(HashMap<String, Object> params);
	int dropMoneyBook(int id_index);
	List<MoneyBook> selectByDate(HashMap<String, Object> params);
	List<MoneyBook> selectOneMonth(HashMap<String, Object> params);

}
