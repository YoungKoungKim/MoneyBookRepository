<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<style type="text/css">
.root {
	margin: 20px auto auto;
	width: 800px;
	background-color: #f0f8ff;
	border: solid #CCE2D8;
}

.top {
	width: 100%;
	height: 100%;
	text-align: center;
	border-bottom: dashed #CCE2D8;
}

.left {
	width: 100%;
	padding: 40px 40px;
	text-align: center;
}

.right {
	margin: auto;
	width: 100%;
	text-align: left;
	font-size: 20px;
	border-top: solid #CCE2D8;
	border-bottom: solid #CCE2D8;
}

.right #textarea1 {
	width: 798px;
	height: 200px;
}

.bottom {
	width: 100%;
	height: 100%;
	clear: both;
	text-align: center;
	padding: 30px 5px;
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

.titlebar {
	width: 800px;
	border: 1px solid #e4e4e4;
	background: #fff;
	border-radius: 2px;
	transition: .3s;
	-webkit-transition: .3s;
	-moz-transition: .3s;
	-o-transition: .3s;
}

.titlebar #title1 {
	font-size: 30px;
	text-align: center;
	border: solid #ffffff;
}

.titlebar #type1 {
	width: 80px;
	height: 40px;
	margin-right: 20px;
	border: solid #ffffff;
	font-size: 20px;
}

.titlebar #title1:hover {
	border: 1px solid #5B5F61;
	box-shadow: 0px 0px 15px 5px #847F7F;
	-webkit-box-shadow: 0px 0px 15px 5px #847F7F;
	-moz-box-shadow: 0px 0px 15px 5px #847F7F;
}

#it {
	font-size: 70px;
}

.div_category {
	width: 170px;
	height: 150px;
	display: inline-block;
}

.div_all {
	font-size: 24px;
}

.myButton {
	background-color: #f0f8ff;
	-moz-border-radius: 9px;
	-webkit-border-radius: 9px;
	border-radius: 9px;
	display: inline-block;
	cursor: pointer;
	color: #000000;
	font-family: Arial;
	font-size: 15px;
	padding: 6px 17px;
	text-decoration: none;
}

.myButton:hover {
	background-color: #91D4B5;
}

.myButton:active {
	position: relative;
	top: 1px;
}
</style>

<script type="text/javascript">
function addextraList(){
	
	$.ajax({
		type : 'post',
		url : 'boardDetailList.do',
		data : 'boardNo='+${board.boardNo},
		dataType :  'json',
		success :  function (data) {
			for(var i in data.list) {
				if(data.list[i].category == 'food'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #ADD8E6;' class='fa fa-cutlery' aria-hidden='true'></i>"
					+"</span><br><span>식비</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//식비
					
					else if(data.list[i].category == 'traffic'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it'style='color: #FF6347;' class='fa fa-bus' aria-hidden='true'></i>"
					+"</span><br><span>교통비</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//교통비
					
					else if(data.list[i].category == 'commodity'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id ='it' style='color: #FFA500;' class='fa fa-shopping-cart' aria-hidden='true'></i>"
					+"</span><br><span>생필품</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//생필품
					
					else if(data.list[i].category == 'beauty'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #FFB6C1; 'class='fa fa-bath' aria-hidden='true'></i>"
					+"</span><br><span>미용</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//미용
					
					else if(data.list[i].category == 'medical'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it'style='color: #6A5ACD;'class='fa fa-medkit' aria-hidden='true'></i></td>"
					+"</span><br><span>의료</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//의료
					
					else if(data.list[i].category == 'education'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #DDA0DD;'class='fa fa-book' aria-hidden='true'></i>"
					+"</span><br><span>교육</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//교육
					
					else if(data.list[i].category == 'phonefees'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #1E90FF;' class='fa fa-mobile' aria-hidden='true'></i>"
					+"</span><br><span>통신비</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//통신비
					
					else if(data.list[i].category == 'saving'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #DAA520;' class='fa fa-database' aria-hidden='true'></i>"
					+"</span><br><span>저축</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//저축
					
					else if(data.list[i].category == 'utilitybills'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it'style='color: #708090;'class='fa fa-plug' aria-hidden='true'></i>"
					+"</span><br><span>공과금</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//공과금
					
					else if(data.list[i].category == 'culturallife'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #3CB371;' class='fa fa-film' aria-hidden='true'></i>"
					+"</span><br><span>문화생활비</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//문화생활비
					
					else if(data.list[i].category == 'otheritems'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #FA8072;' class='fa fa-minus-circle' aria-hidden='true'></i>"
					+"</span><br><span>기타</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//기타
					
					else if(data.list[i].category == 'incomes'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #9ACD32;'class='fa fa-krw' aria-hidden='true'></i>"
					+"</span><br><span>수입</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"</div>");
					}//수입
				
			}
			for(var i in data.list) {
				if(data.list[i].category =='expense'){
				$('#left').append("<div class='div_all'><span> 총 지출 : "+data.list[i].price +"원</span> </div>");							
				}else if(data.list[i].category =='income'){
				$('#left').append("<div class='div_all'><span> 총 수입 : "+data.list[i].price +"원</span> </div>");							
				}
			}
		},
		error : function() {
			alert('실패');
		}
	});
}
function formCheck() {
	
}
	$(document).ready(function() {
		 addextraList();
		
		 $("#formsubmitBtn").on("click", function() {
			var content1 = $('#textContent').val(); 
			var title = $('#title1').val();
		 	var result = content1.replace(/\s+$/, '');
			var result2 = title.replace(/\s+$/, '');
			if(result2 == ""){
				  alert("제목을 입력해주세요");
				  }	else if(result == ""){
					  alert("내용을 입력해주세요");
				  } else {
					  $("#formsubmit").submit();
				  }
			 
		 });
		 
		 		 
	});
</script>
</head>
<body>
	<form method="post" id="formsubmit" action="boardUpdate.do">
		<div class="root">
			<div class="top">
				<div class="titlebar">
					<select name="ageType" id="type1">
						<option value="10">10대</option>
						<option value="20">20대</option>
						<option value="30">30대</option>
						<option value="40">40대</option>
					</select> <input type="text" id="title1" name="title"
						placeholder="제목을 입력하세요" value="${board.title}">
				</div>
				<div align="right">
					<table>
						<tr>
							<td style="width: 100px;" align="right" colspan="4"><fmt:formatDate
									value="${board.date}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td style="width: 400px" align="right">${board.nick }</td>
							<td style="width: 100px;" align="right">조회수 : ${board.viewNo }</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="left" id="left">
				<div>
					<h2>${year}년${nowMonth }월가계부공유</h2>
					<br>
				</div>
			</div>

			<div class="right">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<textarea id="textContent" name="content" style="resize: inherit;" rows="15" cols="85" placeholder="내용을 입력하세요">${board.content}</textarea>
			</div>

			<div class="bottom">
				<input type="hidden" value="${board.boardNo}" name="boardNo">
				<input type="hidden" value="${id_index}" name="id_index"> 
				
				<input type="button" class="myButton" value="확인" id="formsubmitBtn">
				<input type="button" class="myButton" value="돌아가기"
					onclick="location.href='boardDetailView.do?boardNo=${board.boardNo}'">
			</div>
		</div>
	</form>

</body>
</html>