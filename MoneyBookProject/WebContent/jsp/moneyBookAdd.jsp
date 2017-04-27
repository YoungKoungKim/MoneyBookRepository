<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- BOOTSTRAP CORE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Indie+Flower" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#bookmark {
	font-size: 12px;
	padding: 5px;
	border-radius: 10px;
	background-color: #91D4B5;
	font-family: 'Indie Flower', cursive;
}
</style>

<title>가계부 등록</title>
</head>
<body>

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
	<h5>★즐겨찾기</h5>
	<button id="bookmark">test</button>
	
	<center>
		<table>
			<c:forEach begin="1" end="5">
				<tr>
					<td><select id="category">
							<option value="food">식비</option>
							<option value="traffic">교통비</option>
							<option value="commodity">생필품</option>
							<option value="medical">의료</option>
							<option value="education">교육</option>
							<option value="phonefees">통신비</option>
							<option value="saving">저축</option>
							<option value="utilitybills">공과금</option>
							<option value="culturallife">문화생활비</option>
							<option value="otheritems">기타</option>
							<option value="income">수입</option>

					</select></td>

					<td><input type="text" name="detail"
						placeholder="사용내역을 입력하세요."></td>

					<td><input type="text" name="price" placeholder="가격을 입력하세요.">
					</td>
				</tr>

			</c:forEach>
		</table>
		<hr>

		<button type="button" class="btn btn-success"
			style="background-color: #91D4B5">즐겨찾기</button>
		<button type="button" class="btn btn-success"
			style="background-color: #91D4B5">등록</button>
		<button type="button" class="btn btn-success"
			style="background-color: #91D4B5">취소</button>



	</center>
</body>
</html>