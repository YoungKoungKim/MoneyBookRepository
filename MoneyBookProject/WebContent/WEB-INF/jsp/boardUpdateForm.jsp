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
	<center>
		<div>
			<table border="1">
				<tr>
					<td>제목 <select>
							<option>10대</option>
							<option>20대</option>
							<option>30대</option>
							<option>40대이상</option>
					</select> <input type="text" value="${board.title }"></td>
				</tr>
				<tr>
					<td><i class="fa fa-cutlery" aria-hidden="true"></i></td>
				</tr>
				<tr>
					<td>내용 : <input type="text"
						style="width: 500px; height: 500px;" value="${board.content }">
				</tr>

			</table>


		</div>
	</center>
</body>
</html>