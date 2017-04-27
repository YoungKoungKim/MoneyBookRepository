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
	
	//북마크 누르기
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
				//location.reload();
				/* alert(data.addBookmarkNo);
				
				for(var i=0; i<data.addBookmarkNo;i++){
					//var detail = "detail"+i;
					alert(data.detail);
					alert($('#bookmark_add'+i).val());
					alert($('#bookmark_add'+i).val(data.detail+i));
					$('#bookmark_add'+i).val(data.detail+i);
				} */
				
				
				
			}
		});
	}
	});

 	//북마크 버튼 누르면 카테고리, 가격, 종류 넘기기
	$('.bookmark').click(function (){
		var id_index = $(this).attr('id');

		$.ajax({
			url : 'findBookMark.do',
			data : "id_index="+${param.id_index}+
			"&bookmarkNo="+$('#a'+id_index).val(),
			dataType : 'json',
			type: 'post',
			success : function(data){
				alert("북마크 하나 찾기 성공했다");
				
				for(var i=1; i<=5;i++){
					if($('#category'+i).val()==""){
						$('#category'+i).val(data.category).prop("selected", true);
						$('#detail'+i).val(data.detail);
						$('#price'+i).val(data.price);
						return;
					}
				}
			}
		});
	});
 	
 	
 	$('#regist_btn').click(function (){

	if($('#category').val() ==""|| $('#detail').val() == "" 
			|| $('#price').val() == "" ){
		alert('항목을 모두 입력해주세요.');
		return false;
	}
	
	if(!($.isNumeric($('#price').val()))){
		alert("금액은 숫자만 입력해주세요.");
		return false;
	}
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

<title>가계부 등록</title>
</head>
<body>
	<form action="moneyBookRegist.do" id="mbRegistForm">
		<div id="main_div">
			<div id="date_div">
				<select id="year" name="year">
				<c:forEach  begin ="2010" end="2020" varStatus="status" >
				<option value="${2009+status.count}">${2009+status.count}년</option>
				</c:forEach>

				</select> <select id="month" name="month">
				<c:forEach  begin ="1" end="12" varStatus="status" >
				<option value="${status.count}">${status.count}월</option>
				</c:forEach>
				
				</select> <select id="day" name="day">
				<c:forEach  begin ="1" end="30" varStatus="status" >
				<option value="${status.count}">${status.count}일</option>
				</c:forEach>
				</select>

			</div>
			<div id="bookmark_bar_div">
				<h5>★즐겨찾기</h5>
			</div>
			<div id="bookmark_list_div">
				<c:forEach var="bm" items="${bookMarkList}" varStatus="status">
					<input type="button" class="bookmark" id="bookmark_select${status.index}" value="${bm.detail}">
					<input type="hidden" id="abookmark_select${status.index}" value="${bm.bookmarkNo}">
<%-- 					<c:if test="${status.last}">
						<c:if test="${status.count  != 6}">
							<c:forEach begin="1" end="${6-status.count}" varStatus="st">
								<input type="button" class="bookmark" id="bookmark_add${st.index}" 
								value="등록" disabled="disabled" >
							</c:forEach>
						</c:if>
					</c:if> --%>
				</c:forEach>
			</div>
			<div id="list_div">
				<input type="hidden" name="id_index" value="${param.id_index}">
				<table>
					<c:forEach begin="1" end="5" varStatus="status">
						<tr>
							<td><select id="category${status.index}" name="category">
									<option value='' selected >카테고리 선택</option>
									<option value="food" >식비</option>
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
							<td><input type="text"  name="detail" 
								placeholder="사용내역을 입력하세요." id="detail${status.index}"></td>
							<td><input type="text"  name="price" id="price${status.index}"
								placeholder="가격을 입력하세요." ></td>
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
</body>
</html>