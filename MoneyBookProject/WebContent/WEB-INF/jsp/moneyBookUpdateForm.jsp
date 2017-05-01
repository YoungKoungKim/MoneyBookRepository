<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
   integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
   crossorigin="anonymous"></script>
</head>
<body>
<center>
	<table>
		<tr>
			<th>날짜</th>
			<th>카테고리</th>
			<th>내역</th>
			<th>가격</th>
		</tr>
		
		<tr>
			<td>${moneyBook.date }</td>
			<td>${moneyBook.category }</td>
			<td>${moneyBook.detail }</td>
			<td>${moneyBook.price }</td>
		</tr>
	</table>
	
	<button>수정</button>
	<button>삭제</button>
	<button>취소</button>
</center>
</body>
</html>