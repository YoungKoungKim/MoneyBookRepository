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
<script type="text/javascript">

function addextraList(){
	
	$.ajax({
		type : "post",
		url : "boardWriteList.do",
		data : "date="+ $('#date2').val(),
		dataType :  "json",
		success :  function (data) {
			for(var i in data.list) {
				if(data.list[i].category == 'food'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it' style='color: #ADD8E6;' class='fa fa-cutlery' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//식비
				
				else if(data.list[i].category == 'traffic'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it'style='color: #FF6347;' class='fa fa-bus' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//교통비
				
				else if(data.list[i].category == 'commodity'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id ='it' style='color: #FFA500;' class='fa fa-shopping-cart' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//생필품
				
				else if(data.list[i].category == 'beauty'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it' style='color: #FFB6C1; 'class='fa fa-bath' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//미용
				
				else if(data.list[i].category == 'medical'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it'style='color: #6A5ACD;'class='fa fa-medkit' aria-hidden='true'></i></td>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//의료
				
				else if(data.list[i].category == 'education'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it' style='color: #DDA0DD;'class='fa fa-book' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//교육
				
				else if(data.list[i].category == 'phonefees'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it' style='color: #1E90FF;' class='fa fa-mobile' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//통신비
				
				else if(data.list[i].category == 'saving'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it' style='color: #DAA520;' class='fa fa-database' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//저축
				
				else if(data.list[i].category == 'utilitybills'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it'style='color: #708090;'class='fa fa-plug' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//공과금
				
				else if(data.list[i].category == 'culturallife'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it' style='color: #3CB371;' class='fa fa-film' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//문화생활비
				
				else if(data.list[i].category == 'otheritems'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it' style='color: #FA8072;' class='fa fa-minus-circle' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
				}//기타
				
				else if(data.list[i].category == 'incomes'){
				$('#left').append("<div class ='div_category'>"
				+"<span>"
				+"<i id='it' style='color: #9ACD32;'class='fa fa-krw' aria-hidden='true'></i>"
				+"</span><br><span> "+data.list[i].price +"원</span><br>"
				+"<span>"+data.list[i].percent+"%</span></div>");
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



	$(document).ready(function() {
		
		addextraList();
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
		if (dd < 10) {
			dd = '0' + dd
		}
		if (mm < 10) {
			mm = '0' + mm
		}
		today = yyyy + '-' + mm + '-' + dd;
		$("#nowDate").text("날짜 : " + today); //날짜 표시

	});
</script>
<style type="text/css">
#it{
	font-size: 70px;
}
.div_category{
	width: 170px; 
	height: 150px; 
	display: inline-block;
}
.div_all{
	font-size: 24px;
}
.root {
margin: auto;
	width: 800px;
	background-color: #f0f8ff;
	border: solid #CCE2D8;
	margin-top: 50px;
}

.top {
	width: 100%;
	height: 100%;
	text-align: center;
	border-bottom: dashed #CCE2D8;
	padding: 20px 5px;
}


.left {
	width: 100%;
	padding: 40px 40px;
	text-align: center;
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
select {
 width: 70px; /* 원하는 너비설정 */ 
 padding: .3em .3em; /* 여백으로 높이 설정 */ 
 margin-right : 10px;
 font-family: inherit; /* 폰트 상속 */ 
 background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ 
 border: 1px solid #999; 
 border-radius: 0px; /* iOS 둥근모서리 제거 */ 
 -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
 -moz-appearance: none; 
 appearance: none; 
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
</head>

<body>
	<div class="root">
		<form action="boardWrite.do" method="post">
					<input type="hidden" value="${date}" name="date2" id="date2">
					<input type="hidden" value="${nick}" name="nick">
					<input type="hidden" value="${id_index}" name="id_index">
			<div class="top">
				<table align="center">
					<tr>
						<td width="100px"><select id="ageType" name="ageType">
								<option value="10">10대</option>
								<option value="20">20대</option>
								<option value="30">30대</option>
								<option value="40">40대이상</option>
						</select>
						</td>
						<td>
						제목 
							&nbsp;
							 <input style="width: 400px" type="text" name="title" placeholder="제목을 입력하세요">
						</td>
						<td>
							<span id="nowDate"></span>
						</td>
					</tr>

				</table>

			</div>

			<div class="left" align="center" id="left">
					<div><h2> ${year} 년 ${nowMonth }월 가계부 공유 </h2><br></div>
					
					
			</div>
			<div class="bottom">
				<br>
				<textarea style="resize: inherit;" rows="15" cols="110" name="content" placeholder="내용을 입력하세요"></textarea>
				<br> 
				<input type="submit" class="myButton" value="확인"> 
				<input type="button" class="myButton" value="취소" onclick="location.href='history.back()'">
			</div>
		</form>

	</div>

</body>
</html>