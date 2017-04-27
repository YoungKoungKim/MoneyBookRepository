<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"> 
	

</script>
</head>
<body>
	<center>
		<div>
			<form action="boardUpdate.do">
			<table border="1">
				<tr>
					<td>제목 <select name="ageType">
							<option value="10">10대</option>
							<option value="20">20대</option>
							<option value="30">30대</option>
							<option value="40">40대이상</option>
							</select> <input type="text" value="${board.title }" name="title" ></td>
				</tr>
				<tr>
					<td><i class="fa fa-cutlery" aria-hidden="true"></i></td>
				</tr>
				<tr>
					<td>내용 : <textarea rows="30" cols="100" name="content">${board.content}</textarea>
				</tr>
			</table>
				<input type="hidden" value="${board.boardNo}" name="boardNo">
				<input type="hidden" value="${id_index}" name="id_index">
				<input type="submit" value="확인">
				<input type="button" value="돌아가기" onclick="location.href='boardDetailView.do?boardNo=${board.boardNo}&id_index=${id_index}'">
			</form>

		</div>
	</center>
</body>
</html>