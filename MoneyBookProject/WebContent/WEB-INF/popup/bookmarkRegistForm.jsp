<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(document).ready(function() {
	if(!("${param.msg}" == "")){
	alert("${param.msg}");
	}
	
	$("#cancle_btn").click(function(){
		opener.parent.location.reload();
		window.close();	
	});
	
	$(document).on("click",".update_btn", function(){
		var id_index = $(this).attr('id').replace("update_btn", "");
		var price =addComma($('#price_val'+id_index).val());
		
		$('#price'+id_index).html("<input type='text' class ='price_update' value='"+price
				+"'id='price_update"+id_index+"'>");
		
 		/* $('#update_btn'+id_index).val("확인"); */
									
		$('#update_btn'+id_index).attr({
		id : 'confirm_btn'+id_index,
		class : 'confirm_btn'
		}); 
	})
		$(document).on("click",".confirm_btn", function(){
		var id_index = $(this).attr('id').replace("confirm_btn", "");
		var result = addComma($('#price_update'+id_index).val());
		
		$.ajax({
			url : 'bookmarkUpdate.do',
			data : "id_index="+${param.id_index}+
			"&bookmarkNo="+$('#bookmarkNo'+id_index).val()+
			"&price="+$('#price_update'+id_index).val().replace(/,/gi ,""),
			dataType : 'json',
			type: 'post',
			success : function(data){
				alert(data.msg);
				$('#price'+id_index).text("￦"+result); 
				$('#confirm_btn'+id_index).attr({
				id : 'update_btn'+id_index,
				class : 'update_btn'
				});
				location.reload();
				
			}
		});
	});
	
	
	$(document).on("keyup",".regist_price",function(){
		var id_index = $(this).attr('id').replace("regist_price", "");
		var result = addComma($('#regist_price'+id_index).val());
		$('#regist_price'+id_index).val(result);

	});
	
	$(document).on("keyup",".price_update",function(){
		var id_index = $(this).attr('id').replace("price_update", "");
		var result = addComma($('#price_update'+id_index).val());
		$('#price_update'+id_index).val(result);

	});
	
//천 단위마다 콤마 추가하기	
function addComma(value) {
  var num = isNumber(value);
  if (!num) return;

  // 문자열 길이가 3과 같거나 작은 경우 입력 값을 그대로 리턴
  if (num.length <= 3) {
    return num;
  }

  // 3단어씩 자를 반복 횟수 구하기
  var count = Math.floor((num.length - 1) / 3);

  // 결과 값을 저정할 변수
  var result = "";

  // 문자 뒤쪽에서 3개를 자르며 콤마(,) 추가
  for (var i = 0; i < count; i++) {

    // 마지막 문자(length)위치 - 3 을 하여 마지막인덱스부터 세번째 문자열 인덱스값 구하기
    var length = num.length;
    var strCut = num.substr(length - 3, length);
    // 반복문을 통해 value 값은 뒤에서 부터 세자리씩 값이 리턴됨.

    // 입력값 뒷쪽에서 3개의 문자열을 잘라낸 나머지 값으로 입력값 갱신
    num = num.slice(0, length - 3);

    // 콤마(,) + 신규로 자른 문자열 + 기존 결과 값
    result = "," + strCut + result;
  }

  // 마지막으로 루프를 돌고 남아 있을 입력값(value)을 최종 결과 앞에 추가
   result = num + result; 

  // 최종값 리턴
  return result;

}

// 숫자 유무 판단
function isNumber(checkValue) {
	checkValue = '' + checkValue;
	
	if(checkValue.length >=4) {
	checkValue= checkValue.replace(/,/gi ,""); 
	}
	
  if (isNaN(checkValue) /* || checkValue == "" */) {
    alert('금액은 숫자만 입력해 주세요.');
    return;
  }
  return checkValue;
}
	
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
				$('#bookmarklist'+id_index).remove();
			}
		});
	});
	
	$(document).on("click",".confirm_btn",function(){
		var id_index = $(this).attr('id').replace("confirm_btn", "");
	 		if($('#price_update'+id_index).val() =="" ){
	 			alert("가격을 입력해주세요.");
				return false;
			}
	 
	});
	

	$(document).on("click",".add_line_btn",function(){
	var addCount = parseInt($('.add_line_btn').attr("id").replace("add_line_btn",""))+parseInt(1);
	
	if(addCount > 6){
		alert("등록창은 최대 6개까지 가능합니다.");
	}else{
	$('.add_line_btn').remove();
	
	var tag =
			"<tr>"
		+"<td><select id='category"+addCount+"' name='category'>"
		+"	<option value selected>카테고리 선택</option>"
		+"	<option value='food'>식비</option>"
		+"	<option value='traffic'>교통비</option>"
		+"	<option value='commodity'>생필품</option>"
		+"	<option value='medical'>의료</option>"
		+"<option value='beauty'>미용</option>"
		+"	<option value='education'>교육</option>"
		+"	<option value='phonefees'>통신비</option>"
		+"	<option value='saving'>저축</option>"
		+"	<option value='utilitybills'>공과금</option>"
		+"	<option value='culturallife'>문화생활비</option>"
		+"<option value='otheritems'>기타</option>"
		+"	<option value='income'>수입</option>"
		+"</select></td>" 
		+"<td><input type='text' name='detail'" 
		+"placeholder='내용을 입력하세요.' id='regist_detail"+addCount+"'></td>"
		+"<td><input type='text' class='regist_price' name='price' "
		+"id='regist_price"+addCount+"' placeholder='가격을 입력하세요.'></td>"
		+"<td><a href = '#' target=''id='add_line_btn"+addCount+"'class='add_line_btn'>"
		+"<i class='fa fa-plus-circle' aria-hidden='true' title='항목을 추가하고 싶으면 클릭하세요'></i></a>"
		+"</td>"
		+"</tr>" ;
	$('#list_table').append(tag);
	}
});
	
	$('#book_mark_regist_btn').click(function (){
   		var list_size = parseInt($('.add_line_btn').attr("id").replace("add_line_btn",""));
   		var last_input = 0;
 	for(var i =1; i <= list_size; i++){
		if($('#category'+i).val() !="" || $('#regist_price'+i).val() !="" || $('#regist_detail'+i).val() !=""){
			last_input = i;
		} 		
 	}
 	
 	if(last_input == 0){
		alert("모든 항목을 입력해주세요.");
		return false;
	} 
 	
  	for(var i= 1; i <= last_input; i++){
 		if($('#category'+i).val() =="" || $('#regist_price'+i).val() =="" || $('#regist_detail'+i).val() ==""){
 			alert("모든 항목을 입력해주세요.");
			return false;
		}else{
			if($.isNumeric($('#regist_price'+i).val().replace(/,/gi ,"")) == false && $('#regist_price'+i).val() !='' ){
				alert("금액은 숫자만 입력해주세요.");
				return false;
		}else if($('#regist_price'+i).val() <0){
			alert("금액은 정수만 입력해주세요.");
			return false;
		}else{
			$('#regist_price'+i).val($('#regist_price'+i).val().replace(/,/gi ,"")); 
		}	
	}
 	} 
}); 
	
	
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>북마크 등록</title>
</head>
<style type="text/css">
@font-face {

	font-family: 'koverwatch';
	src: url(font/koverwatch.ttf) format('truetype');
}

#index_div{
font-family: koverwatch;
font-size: 30px;

}

.btn {
	font-weight: bold; border-radius : 10px;
	background-color: #1abc9c;
	padding: 10px 35px;
	text-align: center;
	color: white;
	border-radius: 10px;
}

#main_div {
	border: 3px solid #1abc9c;
}

input[type="button"] {
	border-radius: 10px;
	background-color: #1abc9c;
	padding: 10px 35px;
	text-align: center;
}

#btn_list_div {
	top: 350px;
	left: 200px;
	padding-left: 150px;
}

select {
	border: 1px solid #ddd;
	padding: 10px;
	width: 150px;
}

input[type="text"] {
	border: 1px solid #ddd;
	padding: 10px;
}

div {
	padding: 5px;
}

.btn:hover {
	background-color: grey;
	color: #fff;
	text-decoration: none
}

.add_line_btn {
	color: #000000;
	font-size: 25px;
	text-align: right;
	margin-left: 5px;
}

.delete_btn {
	color: #808080;
	font-size: 25px;
	text-align: center;
	margin-left: 5px;
}

.update_btn {
	color:#808080;
	font-size: 25px;
	text-align: center;
	margin-left: 5px;
}

.category_td {
	color: #000000;
	font-size: 30px;
	text-align: center;
	/* margin-left: 5px; */
}

.confirm_btn {
	color: #7B68EE;
	font-size: 25px;
	text-align: center;
	margin-left: 5px;
}

.custab {
	border: 1px solid #E6E6FA;
	box-shadow: 3px 3px 2px #E6E6FA;
	transition: 0.5s;
}

</style>

<title>즐겨찾기 등록</title>
</head>
<body>
	<form action="bookmarkRegist.do" id="bookmarkRegistForm">
		<div id="main_div">
			<div id="index_div">
					<span style="color: #1abc9c; font-weight: bold;"> <i
						class="fa fa-list" aria-hidden="true"></i> 즐겨찾기 목록
					</span>
			</div>
			<div id="bookmark_list_div" class="container">
				<div class="row col-md-6 col-md-offset-2 custyle">
					<table class="table table-bordered  custab">
						<th class="text-center" bgcolor="#1abc9c" style="color: #FFFFFF">카테고리</th>
						<th class="text-center" bgcolor="#1abc9c" style="color: #FFFFFF">내용</th>
						<th class="text-center" bgcolor="#1abc9c" style="color: #FFFFFF">가격</th>
						<th class="text-center" bgcolor="#1abc9c" style="color: #FFFFFF">
						</th>
						<c:forEach var="bm" items="${bookMarkList}" varStatus="status">
							<tr id="bookmarklist${status.index}" class="text-center">
								<td class="category_td">
								<c:if test="${bm.category=='medical'}">
										<span style="color: #708090;"> 
										<i class="fa fa-medkit" aria-hidden="true"></i>
										</span>
									</c:if> 
									<c:if test="${bm.category=='food'}">
										<span style="color: #ADD8E6;"> 
										<i class="fa fa-cutlery" aria-hidden="true"></i></span>
									</c:if> 
									<c:if test="${bm.category=='traffic'}">
									<span style="color: #FF6347;"> 
										<i class="fa fa-bus" aria-hidden="true"></i>
										</span>
									</c:if> 
									<c:if test="${bm.category=='commodity'}">
									<span style="color: #FFA500;"> 
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
										</span>
									</c:if> 
									<c:if test="${bm.category=='beauty'}">
									<span style="color: #F08080;"> 
										<i class="fa fa-bath" aria-hidden="true"></i>
										</span>
									</c:if> 
									<c:if test="${bm.category=='education'}">
									<span style="color:#DDA0DD;">
										<i class="fa fa-book" aria-hidden="true"></i>
										</span>
									</c:if> 
									<c:if test="${bm.category=='phonefees'}">
									<span style="color: #1E90FF;">
										<i class="fa fa-mobile" aria-hidden="true"></i>
									</span>
									</c:if> 
									<c:if test="${bm.category=='saving'}">
									<span style="color: #DAA520;"> 
										<i class="fa fa-database" aria-hidden="true"></i>
										</span>
									</c:if> 
									<c:if test="${bm.category=='utilitybills'}">
									<span style="color: #6A5ACD;"> 
										<i class="fa fa-plug" aria-hidden="true"></i>
										</span>
									</c:if> 
									<c:if test="${bm.category=='culturallife'}">
									<span style="color: #3CB371;"> 
										<i class="fa fa-film" aria-hidden="true"></i>
										</span>
									</c:if> 
									<c:if test="${bm.category == 'otheritems'}">
									<span style="color: #FA8072;"> 
										<i class="fa fa-minus-circle" aria-hidden="true"></i>
										</span>
									</c:if>  
									<c:if test="${bm.category=='income'}">
									<span style="color: #9ACD32;"> 
										<i class="fa fa-krw" aria-hidden="true"></i>
									</span>
									</c:if>
									</td>
								<td>${bm.detail}</td>
								
								<td>
								<input type = "hidden" value="${bm.price}" id="price_val${status.index}">
								<span id="price${status.index}">
								<fmt:formatNumber value="${bm.price}" type="currency"/>
								</span>
								
								</td>
								<td><a href="#" target="" id="update_btn${status.index}"
									class="update_btn"><i class="fa fa-scissors" aria-hidden="true" 
									title="즐겨찾기 가격 수정"></i></a>
									<a href="#" target="" id="delete_btn${status.index}" class="delete_btn"> <i
										class="fa fa-trash" aria-hidden="true"
										title="즐겨찾기 삭제"
										></i>
								</a></td>
							</tr>
							<input type="hidden" id="bookmarkNo${status.index}"
								value="${bm.bookmarkNo}">
						</c:forEach>
					</table>
				</div>
			</div>
			<h4>
			<div id="index_div">
				<span style="color: #1abc9c; font-weight: bold;"> <i
					class="fa fa-check" aria-hidden="true"></i></i> 즐겨찾기 등록하기
				</span>
				</div>
			</h4>
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
									<option value="beauty">미용</option>
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
							<td><input type="text" name="price" class="regist_price"
								id="regist_price${status.index}" placeholder="가격을 입력하세요."
								>
								<c:if test="${status.last}">
									<td><a href="#" target="" id="add_line_btn${status.index}"
										class="add_line_btn"> <i class="fa fa-plus-circle"
											aria-hidden="true" title="항목을 추가하고 싶으면 클릭하세요"></i>
									</a></td>
								</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br> <br>
			<div id="btn_list_div">
				<input type="submit" value="등록" class="btn"
					id="book_mark_regist_btn"> 
				<input type="button" class="btn"
					id="cancle_btn" value="취소">
			</div>
		</div>
	</form>
</body>
</html>