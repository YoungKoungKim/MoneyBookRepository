<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- BOOTSTRAP CORE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/style.css" rel="stylesheet" />
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function() {
	if(!("${param.msg}" == "")){
	alert("${param.msg}");
	}
	
	$(document).on("click",".update_btn", function(){
		var id_index = $(this).attr('id').replace("update_btn", "");
		$('#price'+id_index).attr("readonly", false);
		$('#update_btn'+id_index).val("확인");
		$('#update_btn'+id_index).attr({
		id : 'confirm_btn'+id_index,
		class : 'confirm_btn'
		});
	})
		$(document).on("click",".confirm_btn", function(){
		var id_index = $(this).attr('id').replace("confirm_btn", "");
		
		$.ajax({
			url : 'bookmarkUpdate.do',
			data : "id_index="+${param.id_index}+
			"&bookmarkNo="+$('#bookmarkNo'+id_index).val()+
			"&price="+$('#price'+id_index).val(),
			dataType : 'json',
			type: 'post',
			success : function(data){
				alert(data.msg);
				$('#price'+id_index).attr("readonly", true);
				$('#confirm_btn'+id_index).val("가격 수정");
				$('#confirm_btn'+id_index).attr({
				id : 'update_btn'+id_index,
				class : 'update_btn'
				});
			}
		});
	})
	
	$(document).on("click",".delete_btn",function(){
		var id_index = $(this).attr('id').replace("delete_btn", "");

		$.ajax({
			url : 'bookmarkDelete.do',
			data : "id_index="+${param.id_index}+
			"&bookmarkNo="+$('#bookmarkNo'+id_index).val(),
			dataType : 'json',
			type: 'post',
			success : function(data){
				alert(data.msg)
				$('#bookmarklist'+id_index ).remove();
			}
		});
	});

	$(document).on("click",".add_line_btn",function(){
	var addCount = parseInt($('.add_line_btn').attr("id").replace("add_line_btn",""))+parseInt(1);
	$('.add_line_btn').remove();
	
	var tag =
			"<tr>"
		+"<td><select id='category"+addCount+"' name='category'>"
		+"	<option value selected>카테고리 선택</option>"
		+"	<option value='food'>식비</option>"
		+"	<option value='traffic'>교통비</option>"
		+"	<option value='commodity'>생필품</option>"
		+"	<option value='medical'>의료</option>"
		+"	<option value='education'>교육</option>"
		+"	<option value='phonefees'>통신비</option>"
		+"	<option value='saving'>저축</option>"
		+"	<option value='utilitybills'>공과금</option>"
		+"	<option value='culturallife'>문화생활비</option>"
		+"<option value='otheritems'>기타</option>"
		+"	<option value='income'>수입</option>"
		+"</select></td>" 
		+"<td><input type='text' name='detail'" 
		+"placeholder='사용내역을 입력하세요.' id='detail"+addCount+"'></td>"
		+"<td><input type='text' name='price' "
		+"id='price"+addCount+"' placeholder='가격을 입력하세요.'>"
		+"<input type = 'button' value='추가' id='add_line_btn"+addCount+"' class='add_line_btn'>"
		+"</td>"
		+"</tr>" ;
	$('#list_table').append(tag);
});

});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북마크 등록</title>
</head>
<style type="text/css">
.bookmark {
	border-radius: 10px;
	background-color: #91D4B5;
	padding: 10px 35px;
	text-align: center;
}

.btn {
	border-radius: 10px;
	background-color: #91D4B5;
	padding: 10px 35px;
	text-align: center;
}

input[type="button"] {
	border-radius: 10px;
	background-color: #91D4B5;
	padding: 10px 35px;
	text-align: center;
}

#main_div {
	position: absolute;
	top: 150px;
	left: 151px;
	width: 677px;
	height: 526px;
}

#btn_list {
	/* position: absolute; */
	top: 350px;
	left: 50px;
}

#year, #month, #day {
	border: 1px solid #ddd;
	padding: 10px;
	width: 100px;
}

select {
	border: 1px solid #ddd;
	padding: 10px;
	width: 100px;
}

input[type="text"] {
	border: 1px solid #ddd;
	padding: 10px;
}

button[type=submit] {
	background: none repeat scroll 0 0 #1abc9c;
	border: medium none;
	color: #fff;
	padding: 11px 20px;
	text-transform: uppercase;
}

.add_to_cart_button {
	background: none repeat scroll 0 0 #1abc9c;
	border: medium none;
	color: #fff;
	padding: 6px 25px;
	display: inline-block
}

.btn:hover {
	background-color: grey;
	color: #fff;
	text-decoration: none
}

.add_to_cart_button {
	background-color: #222
}
</style>

<title>즐겨찾기 등록</title>
</head>
<body>
	<form action="bookmarkRegist.do" id="bookmarkRegistForm">
		<div id="main_div">
			<div id="bookmark_bar_div">
				<h3>나의 북마크 목록</h3>
			</div>
			<div id="bookmark_list_div">

				<table border="1">
					<th>카테고리</th>
					<th>북마크 이름</th>
					<th>가격</th>
					<th>가격 수정</th>
					<th>삭제</th>
					<c:forEach var="bm" items="${bookMarkList}" varStatus="status">
						<tr id="bookmarklist${status.index}">
							<td>${bm.category}</td>
							<td>${bm.detail}</td>
							<%-- <td>${bm.price}</td> --%>
							<td><input type="text" value="${bm.price}"
								id="price${status.index}" readonly="readonly"></td>
							<td><input type="button" value="가격수정" class="update_btn"
								id="update_btn${status.index}"></td>
							<td><input type="button" value="삭제" class="delete_btn"
								id="delete_btn${status.index}"></td>
						</tr>
						<input type="hidden" id="bookmarkNo${status.index}"
							value="${bm.bookmarkNo}">
					</c:forEach>
				</table>
			</div>
			<br> <br>
			<h3>북마크 등록하기</h3>
			<div id="list_div">
				<input type="hidden" name="id_index" value="${param.id_index}">
				<table id="list_table">
					<c:forEach begin="1" end="1" varStatus="status">
						<tr>
							<td><select id="category${status.index}" name="category">
									<option value='' selected>카테고리 선택</option>
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
								placeholder="내용을 입력하세요." id="regist_detail${status.index}"></td>
							<td><input type="text" name="price"
								id="regist_price${status.index}" placeholder="가격을 입력하세요.">
								<c:if test="${status.last}">
									<input type="button" value="추가"
										id="add_line_btn${status.index}" class="add_line_btn">
								</c:if></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br>
			<br>
			<div id="btn_list">
				<input type="submit" value="즐겨찾기 등록" class="btn"
					id="book_mark_regist_btn"> <input type="button" class="btn"
					id="cancle_btn" value="취소">
			</div>
		</div>
	</form>
</body>
</html>