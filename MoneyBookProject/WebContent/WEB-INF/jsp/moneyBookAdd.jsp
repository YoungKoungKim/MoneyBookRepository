<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- BOOTSTRAP CORE CSS -->
<link href="assets/css/bootstrap.css" rel="stylesheet" />
<link href="assets/css/style.css" rel="stylesheet" />

<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function() {
	$('#bookmark_regist_btn').click(function (){

	if($('#category').val() ==""|| $('#detail').val() == "" 
			|| $('#price').val() == "" ){
		alert('항목을 모두 입력해주세요!');
		
	}else{
	
		var params = $('#mbRegistForm').serialize();
		//alert(params);
		$.ajax({
			url : 'bookMarkRegist.do',
			data : params,
			dataType : 'json',
			type: 'post',
			success : function(data){
				alert(data.msg);
				
			}
		});
	}
	});

 	$('#regist_btn').click(function (){

	if($('#category').val() ==""|| $('#detail').val() == "" 
			|| $('#price').val() == "" ){
		alert('항목을 모두 입력해주세요.');
	}
	if(!($.isNumeric($('#price')))){
		alert("금액은 숫자만 입력해주세요.");
	}
	}); 

	$('#bookmark_select').click(function (){
		alert("hi")
		$.ajax({
			url : 'findBookMark.do',
			data : "id_index="+${param.id_index}+"&bookmarkNo=6",
			dataType : 'json',
			type: 'post',
			success : function(data){
				$('#detail').text(data.detail);
				$('#price').text(data.price);
				$('#category').text(data.category);
			}
		});
	});
	
});
</script>
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

#main_div {
	position: absolute;
	top: 150px;
	left: 151px;
	width: 677px;
	height: 526px;
}

#btn_list {
	position: absolute;
	top: 350px;
	left: 50px;
}

#year, #month, #day, #category {
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

<title>가계부 등록</title>
</head>
<body>
	<form action="moneyBookRegist.do" id="mbRegistForm">
		<div id="main_div">
			<div id="date_div">
				<select id="year" name="year">
					<option value="2017">2017년</option>
					<option value="2016">2016년</option>
					<option value="2015">2015년</option>

				</select> <select id="month" name="month">
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
				</select> <select id="day" name="day">
					<option value="1">1일</option>
					<option value="2">2일</option>
					<option value="3">3일</option>
					<option value="25">25일</option>
				</select>

			</div>
			<div id="bookmark_bar_div">
				<h5>★즐겨찾기</h5>
			</div>
			<div id="bookmark_list_div">
				<c:forEach var="bm" items="${bookMarkList}" varStatus="status">
					<%-- <button class="bookmark" id="bookmark_select">${bm.detail}</button> --%>
					<input type="button" class="bookmark" id="bookmark_select" value="${bm.detail}">
					<c:if test="${status.last}">
						<c:if test="${status.count  != 6}">
							<c:forEach begin="1" end="${6-status.count}" varStatus="st">
								<button class="bookmark" id="bookmark_add${st.index}" >등록</button>
							</c:forEach>
						</c:if>
					</c:if>
				</c:forEach>
			</div>
			<div id="list_div">
				<input type="hidden" name="id_index" value="${param.id_index}">
				<table>
					<c:forEach var="i" begin="1" end="5" varStatus="status">
						<tr>
							<td><select id="category" name="category">
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
								placeholder="사용내역을 입력하세요." id="detail"></td>
							<td><input type="text" name="price" id="price"
								placeholder="가격을 입력하세요."></td>
							<c:if test=""></c:if>
						</tr>
					</c:forEach>
				</table>

			</div>
			<div id="btn_list">
				<input type ="button" class="btn" id="bookmark_regist_btn"  value="즐찾">
				<input type="submit"  value="등록" class="btn" id="regist_btn"> 
				<button class="btn" id="cancle_btn">취소 </button>
			</div>
		</div>
	</form>
				<!-- <button class="btn" id="bookmark_regist_btn" >즐겨찾기 등록</button> --> 
</body>
</html>