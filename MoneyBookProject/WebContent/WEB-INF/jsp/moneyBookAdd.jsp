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
<<<<<<< HEAD
=======
	
>>>>>>> branch 'master' of https://github.com/YoungKoungKim/MoneyBookRepository.git
	$(document).on("click",".bookmark",function(){
		var id_index = $(this).attr('id');
		//alert("버튼 눌렀다!!!!!!!!!!!!!!");
		$.ajax({
			url : 'findBookMark.do',
			data : "id_index="+${param.id_index}+
			"&bookmarkNo="+$('#a'+id_index).val(),
			dataType : 'json',
			type: 'post',
			success : function(data){
				
				var list_size = parseInt($('.add_line_btn').attr("id").replace("add_line_btn",""));
				
				for(var i=1; i <= list_size; i++){
					if($('#category'+i).val()==""){
						$('#category'+i).val(data.category).prop("selected", true);
						$('#detail'+i).val(data.detail);
						$('#price'+i).val(data.price);
						break;
					}
				}
			}
		});
	});
	
		$(document).on("click",".add_line_btn",function(){
		//alert("버튼 눌렀다!!!!!!!!!!!!!!");
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
	
/*   	$('#regist_btn').click(function (){
		for(var i=1; i<=5;i++){
			if(!($('#category'+i).val()=="" || $('#detail'+i).val()=="" ||
					$('#price'+i).val() =="")){
				alert('항목을 모두 입력해주세요.');
				break;
			}
			if(!($.isNumeric($('#price'+i).val()))){
				alert("금액은 숫자만 입력해주세요.");
				break;
			}
		}
		return false;
	});  */
 	//"input[type='submit']").attr("disabled", true);
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

input[type="button"] {
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
	position: absolute;
	top: 350px;
	left: 50px;
}
<<<<<<< HEAD
#year, #month, #day {
=======

#year, #month, #day {
	border: 1px solid #ddd;
	padding: 10px;
	width: 100px;
}

select {
>>>>>>> branch 'master' of https://github.com/YoungKoungKim/MoneyBookRepository.git
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
					<c:forEach begin="2010" end="2020" varStatus="status">
						<option value="${2009+status.count}">${2009+status.count}년</option>
					</c:forEach>

				</select> <select id="month" name="month">
					<c:forEach begin="1" end="12" varStatus="status">
						<option value="${status.count}">${status.count}월</option>
					</c:forEach>

				</select> <select id="day" name="day">
					<c:forEach begin="1" end="30" varStatus="status">
						<option value="${status.count}">${status.count}일</option>
					</c:forEach>
				</select>

			</div>
			<div id="bookmark_bar_div">
				<h5>★즐겨찾기</h5>
			</div>
			<div id="bookmark_list_div">
				<c:forEach var="bm" items="${bookMarkList}" varStatus="status">
					<input type="button" class="bookmark"
						id="bookmark_select${status.index}" value="${bm.detail}">
					<input type="hidden" id="abookmark_select${status.index}"
						value="${bm.bookmarkNo}">
				</c:forEach>
			</div>
			<div id="list_div">
				<input type="hidden" name="id_index" value="${param.id_index}">
				<table id="list_table">
					<c:forEach begin="1" end="5" varStatus="status">
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
								placeholder="사용내역을 입력하세요." id="detail${status.index}"></td>
							<td><input type="text" name="price" 
								id="price${status.index}" placeholder="가격을 입력하세요.">
								<c:if test="${status.last}"><input type = "button" value="추가" id="add_line_btn${status.index}"
								class="add_line_btn"> </c:if>
								</td>
						</tr>
					</c:forEach>
				</table>

			</div>
			
			<div id="btn_list">
				<input type="submit" value="등록" class="btn" id="regist_btn">
				<button class="btn" id="cancle_btn">취소</button>
			</div>
		</div>
	</form>
</body>
</html>