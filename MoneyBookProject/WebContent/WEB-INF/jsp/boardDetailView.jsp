<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready()
</script>
</head>
<body>
	<center>
		<div>
			<table border="3">
				<tr style="background-color: pink">
					<td style="width: 150px; font-size: 20px;" align="center">
						${board.ageType}대</td>
					<td style="width: 300px;" align="center">${board.title}</td>
					<td style="width: 150px;" align="center"><fmt:formatDate
							value="${board.date}" pattern="yyyy-MM-dd" /></td>
			</table>

			<table border="3">
				<tr>
					<td style="width: 400px" align="center">${board.nick }</td>

					<td style="width: 200px;">조회수 : ${board.viewNo }</td>
					<td style="width: 200px;">추천수 : ${board.recommend }</td>
				</tr>
				<tr>

				</tr>



				<c:forEach items="${list}" var="exboard">
					<tr>
						<td>${exboard.category } ${exboard.price }</td>
					</tr>
				</c:forEach>



			</table>
		</div>
		<div>
			<input type="button" value="추천"
				onclick="location.href='boardRecommend.do?boardNo=${board.boardNo}'">
				 <input type="button" value="목록" onclick="location.href='boardList.do'">
				  <input type="button" value="수정">
		</div>
	</center>
</body>
</html>