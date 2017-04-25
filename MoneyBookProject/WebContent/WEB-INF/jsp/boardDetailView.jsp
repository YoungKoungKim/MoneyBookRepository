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
			<table>
			
			<tr>
				<th>${board.ageType}대</th>
				<th>${board.title}</th>
				<th>${board.date}</th>
				<th>${board.nick }</th>
				<th>${board.viewNo }</th>
				<th>${board.recommend }</th>
			</tr>
			<tr>
							
			</tr>
			</table>
			<textarea rows="500" cols="300">
				<c:forEach items="${list}" var="exboard">
					${exboard.category }
					${exboard.price }
				</c:forEach>	
			</textarea>
		</div>
</body>
</html>