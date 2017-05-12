<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.root {
	margin: 20px auto auto;
	width: 800px;
	background-color: #f0f8ff;
}

.top {
	width: 100%;
	height: 100%;
	text-align: center;
}
.left {
	width: 100%;
	margin: auto;
}
.right {
	margin: auto;
	width: 100%;
	text-align: left;
	font-size: 20px;
}
.right #textarea1{
	 width: 798px;
	 height: 200px;
}
.bottom {
	
}
.category_td {
	color: #000000;
	font-size: 70px;
	text-align: center;
	width: 150px;
	height: 100px;
	/* margin-left: 5px; */
}
.categoryfont {
	font-size: 20px;
	text-align: center;
}
.titlebar{
	width: 800px;
	background-color: white;
	
}
.titlebar #title1{
	font-size: 30px;
	text-align: center;
}
.titlebar #type1{
	width: 80px;
	height: 40px;
	margin-right: 20px;
}
</style>
</head>
<body>
	<form action="boardUpdate.do">
		<div class="root">
			<div class="top">
					<div class="titlebar">
								<select name="ageType" id="type1">
									<option value="10">10대</option>
									<option value="20">20대</option>
									<option value="30">30대</option>
									<option value="40">40대</option>
								</select>
						<input type="text" id="title1" name="title" value="${board.title}">
					</div>
				<div align="right">
					<table>
						<tr>
							<td style="width: 100px;" align="right" colspan="4">
							<fmt:formatDate value="${board.date}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td style="width: 400px" align="right">${board.nick }</td>
							<td style="width: 100px;" align="right">조회수 : ${board.viewNo }</td>
						</tr>
					</table>
				</div>
			</div>
			
			<div class="left" align="center">
			<br>
			<table>
				<tr style="width: 50px">
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'food'}">
							<td class="category_td">
							<i style="color: #ADD8E6;"class="fa fa-cutlery" aria-hidden="true"></i>
							</span></td>
						</c:if>
						<c:if test="${exboard.category eq 'traffic'}">
							<td class="category_td"><i style="color: #FF6347;"
								class="fa fa-bus" aria-hidden="true"></i></td>
						</c:if>

						<c:if test="${exboard.category eq 'commodity'}">
							<td class="category_td"><i style="color: #FFA500;"
								class="fa fa-shopping-cart" aria-hidden="true"></i></td>
						</c:if>

						<c:if test="${exboard.category eq 'beauty'}">
							<td class="category_td"><i style="color: #FFB6C1;"
								class="fa fa-bath" aria-hidden="true"></i></td>
						</c:if>
					</c:forEach>
				</tr>
				<tr style="width: 50px;" class="categoryfont" id="tre">
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'food'}">
							<td id="food">식비<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'traffic'}">
							<td>교통비<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'commodity'}">
							<td>생필품<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'beauty'}">
							<td>미용<br>${exboard.price }</td>
						</c:if>
					</c:forEach>
				</tr>
			</table>

			<table>
				<br>
				<tr style="width: 50px">
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'medical'}">
							<td class="category_td"><i style="color: #708090"
								class="fa fa-medkit" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'education'}">
							<td class="category_td"><i style="color: #DDA0DD;"
								class="fa fa-book" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'phonefees'}">
							<td class="category_td"><i style="color: #1E90FF;"
								class="fa fa-mobile" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'saving'}">
							<td class="category_td"><i style="color: #DAA520;"
								class="fa fa-database" aria-hidden="true"></i></td>
						</c:if>
					</c:forEach>
				</tr>
				<tr style="width: 50px;" class="categoryfont">
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'medical'}">
							<td>의료<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'education'}">
							<td>교육<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'phonefees'}">
							<td>통신비<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'saving'}">
							<td>저축<br>${exboard.price }</td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			
			<table>
				<br>
				<tr>
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'utilitybills'}">
							<td class="category_td"><i style="color: #6A5ACD;"
								class="fa fa-plug" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'culturallife'}">
							<td class="category_td"><i style="color: #3CB371;"
								class="fa fa-film" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'otheritems'}">
							<td class="category_td"><i style="color: #FA8072;"
								class="fa fa-minus-circle" aria-hidden="true"></i></td>
						</c:if>
						<c:if test="${exboard.category eq 'income'}">
							<td class="category_td"><i style="color: #9ACD32;"
								class="fa fa-krw" aria-hidden="true"></i></td>
						</c:if>
					</c:forEach>
				</tr>
				<tr style="width: 50px;" class="categoryfont">
					<c:forEach items="${list}" var="exboard">
						<c:if test="${exboard.category eq 'utilitybills'}">
							<td>공과금<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'culturallife'}">
							<td>문화생활비<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'otheritems'}">
							<td>기타<br>${exboard.price }</td>
						</c:if>
						<c:if test="${exboard.category eq 'otheritems'}">
							<td>수입<br>${exboard.price }</td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
		</div>
		
		<div class="right">
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<textarea id="textarea1" name="content" value="${board.content}">${board.content}</textarea>
		</div>

		<div class="bottom">
			<input type="hidden" value="${board.boardNo}" name="boardNo">
			<input type="hidden" value="${id_index}" name="id_index">
			<input type="submit" value="확인">
			<input type="button" value="돌아가기"
					onclick="location.href='boardDetailView.do?boardNo=${board.boardNo}&id_index=${id_index}'">
		</div>
	</form>

</body>
</html>