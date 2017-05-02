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
</head>
<script type="text/javascript">
$(document).ready(function() {
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();
	if(dd<10) {
	    dd='0'+dd
	} 
	if(mm<10) {
	    mm='0'+mm
	}
	today = yyyy+'-' + mm+'-'+dd;
	$("#nowDate").text("날짜 : " + today); //날짜 표시
	
})
</script>
<body>

	<center>
	<table>
	<form action="boardWrite.do" method="get">
	
		<tr>
			<td width="100px"><select id="ageType" name="ageType">
					<option value="10">10대</option>
					<option value="20">20대</option>
					<option value="30">30대</option>
					<option value="40">40대이상</option>
				</select> 
			</td>
			<td width="300px">
				제목 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" name="title" placeholder="제목을 입력하세요">
			</td>
			<td width="200px" id="nowDate">
			</td>
		</tr>
		<tr>
			<td colspan="3">
<%-- 			${monthContent} --%>
<%-- 			${monthAmount} --%>
<%-- 			${date } --%>
			<textarea rows="30" cols="100" id="content" name="content" placeholder="내용을 입력하세요"></textarea></td>
		</tr>
		<input type="hidden" value="${date}" name="date2">
		<input type="hidden" value="${nick}" name="nick">
		<input type="hidden" value="${id_index}" name="id_index">
		<input type="submit" value="확인 작업중" id="writeBtn">
	</form>
	</table> 
	
	<div>
		<input type="button" value="돌아가기" onclick="location.href='boardList.do'">
	</div>
	</center>
</body>
</html>