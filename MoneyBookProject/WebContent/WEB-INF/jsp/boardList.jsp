<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<input type="button" value="전체게시판" onclick="location.href='boardList.do'">
		<input type="button" value="10대" onclick="location.href='boardList.do?ageType=10'">
		<input type="button" value="20대" onclick="location.href='boardList.do?ageType=20'">
		<input type="button" value="30대" onclick="location.href='boardList.do?ageType=30'">
		<input type="button" value="40대 이상" onclick="location.href='boardList.do?ageType=40'">
	</div>
	
	<div>
		<table>
			<tr>
				<th>No</th>
				<th>age</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>추천수</th>
				<th>날짜</th>
			</tr>
			<c:forEach var="best" items="${boardBest }" >
				<tr>
					<td>*</td>
					<td>${best.ageType }</td>
					<td>${best.title }</td>
					<td>${best.nick }</td>
					<td>${best.viewNo }</td>
					<td>${best.recommend }</td>
					<td>${best.date }</td>
				</tr>
			</c:forEach>
			<c:forEach var="board" items="${boardList }">
				<tr>
					<td>${board.boardNo }</td>
					<td>${board.ageType }</td>
					<td>
					<a href="boardDetailView.do?boardNo=${board.boardNo}
					&id_index=${board.id_index}">${board.title }</a>
					</td>
					<td>${board.nick }</td>
					<td>${board.viewNo }</td>
					<td>${board.recommend }</td>
					<td>${board.date }</td>
				</tr>
			</c:forEach>
			<tr>
			<td width="1250px" colspan="5">
					<c:if test="${start != 1 }">
						<a href="boardList.do?page=${start-1 }">[이전]</a>
					</c:if>
					
					<c:forEach begin="${start }" end="${end }" var="i">
						<c:choose>
							<c:when test="${i == current }">
								[${i }]
							</c:when>
							<c:otherwise>
								<a href="boardList.do?page=${i }&ageType=${ageType}&content=${content}&category=${category}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<c:if test="${end != last }">
						<a href="boardList.do?page=${end+1 }">[다음]</a>
					</c:if>
				</td>
			</tr>
			<br>
			<form action="boardList.do">
				<tr align="center" >
					<td>
						<select name="category">
							<option value="title">제목</option>
							<option value="nick">작성자</option>
						</select>
					</td>
					<td>
						<input type="text" name="content">
						<input type="submit" id="searchWhat" value="검색">
					</td>
				</tr>
			</form>
		</table>
	</div>

</body>
</html>