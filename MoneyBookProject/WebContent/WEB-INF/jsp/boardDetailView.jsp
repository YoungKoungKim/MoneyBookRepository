<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
    // 줄바꿈 
    pageContext.setAttribute("br", "<br/>");
    pageContext.setAttribute("cn", "\n");
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="boardcss/boardDetailView.css" rel="stylesheet" type="text/css">
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/boardDetailView.js"></script>
</head>
<body>
	<br>
	<div class="root">
		<div class="top">
			<center>

				<table>
					<tr>
						<td style="width: auto; font-size: 30px;" align="center">${board.title}</td>
				</table>
			</center>
			<div align="right" style="padding: 0px 10px 10px 0px;">
				<table>
					<tr>
						<td style="width: 100px;" align="right" colspan="4"><fmt:formatDate
								value="${board.date}" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>

						<td style="width: 400px" align="right">${board.nick }</td>

						<td style="width: 100px;" align="right">조회수 : ${board.viewNo }</td>
						<!-- 						<td style="width: 100px;" id="recommend" align="right">추천수 : -->
						<%-- 							${board.recommend }</td> --%>
					</tr>
				</table>
			</div>
		</div>

		<div class="left" id="left">
			<div>
				<h2>${year} 년 ${nowMonth }월 가계부 공유</h2>
				<br>
			</div>

		</div>

		<div class="right">${board.content }</div>

		<div class="bottom">
			<br>

			<div align="center" style="padding-bottom: 30px;">

				<button class="myButton" id="recommendbtn">
					추천 <span id="recommend"> ${board.recommend } </span>
				</button>

				<input class="myButton" type="button" value="목록"
					onclick="location.href='boardList.do?page=${page}'">
				<c:if test="${board.id_index eq id_index}">
					<input class="myButton" type="button" value="수정"
						onclick="location.href='boardUpdateForm.do?boardNo=${board.boardNo}'">
				</c:if>
				<c:if test="${board.id_index eq id_index }">
					<input class="myButton" type="button" value="삭제"
						onclick="location.href='boardDelete.do?boardNo=${board.boardNo}'">
				</c:if>
			</div>
			<table class="table table-bordered" style="width: 70%;"
				id="commentTable" align="center">
			</table>
			<br>
		</div>


		<div>
			<c:if test="${id_index != null}">
				<table align="center">
					<tr>
						<td><i class="fa fa-user" aria-hidden="true"></i>${nick}</td>

					</tr>
					<tr>
						<td><textarea style="resize: none;" rows="2" cols="80"
								id="content1" name="content1" placeholder="내용을 입력하세요">
								</textarea></td>
						<td><input class="myButton" type="button" value="등록"
							id="commentbut"></td>
					</tr>
				</table>
				<input type="hidden" value="${nick}" readonly="readonly" id="nick1"
					name="nick1">
			</c:if>


		</div>

	</div>
	<input type="hidden" value="${board.boardNo}"  name="boardNo" id="boardNo">
	
</body>
</html>