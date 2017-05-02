<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: blue; text-decoration: underline;}
</style>
</head>
<body>
	<div>
	</div>
	<br>
	<br>
	<br>
	<div style="position: relative; left: 250px; top: -10px">
	
		<input style=" background: #91D4B5; color: #E9F2EE;"  class="btn btn-default" type="button" value="전체게시판" onclick="location.href='boardList.do'">
		<input style=" background: #91D4B5; color: #E9F2EE;"  class="btn btn-default" type="button" value="10대" onclick="location.href='boardList.do?ageType=10'">
		<input style=" background: #91D4B5; color: #E9F2EE;"  class="btn btn-default" type="button" value="20대" onclick="location.href='boardList.do?ageType=20'">
		<input style=" background: #91D4B5; color: #E9F2EE;"  class="btn btn-default" value="30대" onclick="location.href='boardList.do?ageType=30'">
		<input style=" background: #91D4B5; color: #E9F2EE;"  class="btn btn-default" value="40대 이상" onclick="location.href='boardList.do?ageType=40'">
	</div>
	<center>
	<div>
		<table width="800px" height="500px" style="border-bottom: 1px solid #CCE2D8; background-color: #EAF2EE">
			<tr style="border-bottom: 1px solid black; background: #91D4B5;">
				<td align="center" width="30px">No</td>
				<td align="center" width="200px">제목</td>
				<td align="center" width="70px">작성자</td>
				<td align="center" width="100px">날짜</td>
				<td align="center" width="40px">추천</td>
				<td align="center" width="40px">조회</td>
				
			</tr>
			<c:forEach var="best" items="${boardBest }" >
				<tr align="center" style="border-bottom: 1px solid #CCE2D8; background-color: ##EAF2EE; font-size: 15px; color: red;" >
					<td >공지</td>
					<td align="left" ><a style="color: red;" href="boardDetailView.do?boardNo=${best.boardNo}
					&id_index=${best.id_index}">${best.title }</a></td>
					<td >${best.nick }</td>
					<td ><fmt:formatDate value="${best.date }" pattern="yyyy-MM-dd"/></td>
					<td >${best.recommend }</td>
					<td >${best.viewNo }</td>
				</tr>
			</c:forEach> 
			<c:forEach var="board" items="${boardList }" >
				<tr align="center" style="border-bottom: 1px solid #CCE2D8;">
					<td >${board.boardNo }</td>
					<td align="left">
					<a href="boardDetailView.do?boardNo=${board.boardNo}
					&id_index=${board.id_index}">${board.title }</a>
					</td>
					<td>${board.nick }</td>
					<td><fmt:formatDate value="${board.date }" pattern="yyyy-MM-dd"/> </td>
					<td>${board.recommend }</td>
					<td>${board.viewNo }</td>
				</tr>
			</c:forEach>
			</div>
			<div>
			<table>
			<tr align="center" >
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
			</table>
			</div>
			<br>
		</table>
		
		<div>
			<table>
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
		
		<input type="button" value="공유" onclick="location.href='boardWriteForm.do?id_index=${id_index}&date=2017-04-28'">
	</div>
	</center>	

</body>
</html>