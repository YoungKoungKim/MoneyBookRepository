<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가계부 등록</title>
</head>
<body>
	<center>
		<select id="year">
			<option value="2017">2017년</option>
			<option value="2016">2016년</option>
			<option value="2015">2015년</option>

		</select> &nbsp;&nbsp;
		
		<select id="month">
			<option value="1">1월</option>
			<option value="2">2월</option>
			<option value="3">3월</option>
		</select> &nbsp;&nbsp;
		
		
		<select id="day">
			<option value="1">1일</option>
			<option value="2">2일</option>
			<option value="3">3월</option>
		</select>
		
		
		<table>
		<tr> 
		<td>
			<select id="category">
			<option value="food">식비</option>
			<option value="traffic">교통비</option>
			<option value="commodity">생필품</option>
		</select> 
		</td>
		
		<td>
		<input type="text" name="detail" placeholder="사용내역을 입력하세요.">
		</td>
				
		<td>
		<input type="text"  name="price" placeholder="가격을 입력하세요.">
		</td>		
		</table>
		
	</center>
</body>
</html>