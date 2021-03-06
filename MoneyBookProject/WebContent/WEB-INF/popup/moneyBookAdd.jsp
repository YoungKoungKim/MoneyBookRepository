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
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/earlyaccess/nanumgothic.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

Now = new Date();
NowDay = Now.getDate();
NowMonth = Now.getMonth();
NowYear = Now.getYear();
if (NowYear < 2000) NowYear += 1900; 
function DaysInMonth(WhichMonth, WhichYear)
{
  var DaysInMonth = 31;
  if (WhichMonth == "4월" || WhichMonth == "6월" || WhichMonth == "9월" || WhichMonth == "11월") DaysInMonth = 30;
  if (WhichMonth == "2월" && (WhichYear/4) != Math.floor(WhichYear/4))        DaysInMonth = 28;
  if (WhichMonth == "2월" && (WhichYear/4) == Math.floor(WhichYear/4))        DaysInMonth = 29;
  return DaysInMonth;
}

/* 월 별 날짜가 다르니까 ex) 2월이면 28, 29일까지 그 일을 조절해주는 함수 */
function ChangeOptionDays(Which)
{
  DaysObject = eval("document.Form1." + Which + "Day");
  MonthObject = eval("document.Form1." + Which + "Month");
  YearObject = eval("document.Form1." + Which + "Year");

  Month = MonthObject[MonthObject.selectedIndex].text;
  Year = YearObject[YearObject.selectedIndex].text
  
  DaysForThisSelection = DaysInMonth(Month, Year);
  CurrentDaysInSelection = DaysObject.length;
  if (CurrentDaysInSelection > DaysForThisSelection)
  {
    for (i=0; i<(CurrentDaysInSelection-DaysForThisSelection); i++)
    {
      DaysObject.options[DaysObject.options.length - 1] = null
    }
  }
  if (DaysForThisSelection > CurrentDaysInSelection)
  {
    for (i=0; i<(DaysForThisSelection-CurrentDaysInSelection); i++)
    {
      NewOption = new Option(DaysObject.options.length + 1);
      DaysObject.add(NewOption);
    }
  }
    if (DaysObject.selectedIndex < 0) DaysObject.selectedIndex == 0;
}

/* 오늘 날짜로 설정해주는 함수 */
function SetToToday(Which)
{
	if (Which == "FirstSelect") {
		  DaysObject = eval("document.Form1." + Which + "Day");
		  MonthObject = eval("document.Form1." + Which + "Month");
		  YearObject = eval("document.Form1." + Which + "Year");
		
		  YearObject[NowYear-2012].selected = true;
		  MonthObject[NowMonth].selected = true;
		
		  ChangeOptionDays(Which);
		
		  DaysObject[NowDay-1].selected = true;
	} else {
		 var todayList = Which.split("-");
		
		 DaysObject = eval("document.Form1.FirstSelectDay");
		  MonthObject = eval("document.Form1.FirstSelectMonth");
		  YearObject = eval("document.Form1.FirstSelectYear");
		  
		  YearObject[Number(todayList[0])-2012].selected = true;
		  MonthObject[Number(todayList[1])-1].selected = true;
		
		  ChangeOptionDays('FirstSelect');
		
		  DaysObject[Number(todayList[2])-1].selected = true;
	}
}

function WriteYearOptions(YearsAhead)
{
  line = "";
  for (i=-5; i<YearsAhead; i++)
  {
    line += "<OPTION value="+( NowYear + i)+">";
    line += NowYear + i+"년";
  }
  $("select[name='FirstSelectYear'] option:contains('2017')").attr("selected", "selected");
  return line;
}


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
    alert('금액은 정수만 입력해 주세요.');
    return;
  }
  return checkValue;
}



$(document).ready(function() {
	
	$(document).on("keyup",".price",function(){
		var id_index = $(this).attr('id').replace("price", "");
		var result = addComma($('#price'+id_index).val());
		$('#price'+id_index).val(result);

	});
	

	
	$("#cancle_btn").click(function(){
		window.close();	
	});
	
	$(document).on("click",".bookmark2",function(){
		var id_index = $(this).attr('id');

		$.ajax({
			url : 'findBookMark.do',
			data : "id_index="+${param.id_index}+
			"&bookmarkNo="+$('#a'+id_index).val(),
			dataType : 'json',
			type: 'post',
			success : function(data){
				
				var list_size = parseInt($('.add_line_btn').attr("id").replace("add_line_btn",""));
				
				//빈칸이면 넣어주기
				for(var i=1; i <= list_size; i++){
					if($('#category'+i).val()==""){
						$('#category'+i).val(data.category).prop("selected", true);
						$('#detail'+i).val(data.detail);
						var bm_price = addComma(data.price);
						$('#price'+i).val(bm_price);
						
						$('#category'+(i-1)).attr('style', 'background-color:#FFFFFF')
						$('#category'+i).attr('style', 'background-color:#FFFFFF');
						$('#category'+(i+1)).removeAttr('disabled');
						$('#category'+(i+1)).attr('style', 'background-color:#FFEFD5');
				
						$('#price'+(i-1)).attr('style', 'background-color:#FFFFFF');
						$('#price'+i).attr('style', 'background-color:#FFFFFF');
						 $("#price"+(i+1)).attr("readonly",false);
						 $("#price"+(i+1)).attr('style', 'background-color:#FFEFD5');

						 
						$('#detail'+(i-1)).attr('style', 'background-color:#FFFFFF');
						$('#detail'+i).attr('style', 'background-color:#FFFFFF');
						 $("#detail"+(i+1)).attr("readonly",false);
						 $("#detail"+(i+1)).attr('style', 'background-color:#FFEFD5');
						break;
					}
				}
			}
		});
	});
	
		$(document).on("click",".add_line_btn",function(){
		var addCount = parseInt($('.add_line_btn').attr("id").replace("add_line_btn",""))+parseInt(1);
		$('.add_line_btn').remove();
		
		var tag =
 			"<tr>"
			+"<td><select id='category"+addCount+"' name='category' disabled='disabled'>"
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
			+"placeholder='사용내역을 입력하세요.' id='detail"+addCount+"' readonly='readonly'></td>"
			+"<td><input type='text' name='price' class='price' "
			+"id='price"+addCount+"' placeholder='가격을 입력하세요.' readonly='readonly'></td>"
			+"<td><a href = '#' target='' id='add_line_btn"+addCount+"'class='add_line_btn'>"
			+"<i class='fa fa-plus-circle' aria-hidden='true' title='항목을 추가하고 싶으면 클릭하세요'></i></a>"
			+"</td>"
			+"</tr>" ;
			
		$('#list_table').append(tag);
	});
	
	$('.price').keyup(function() {
		var i = parseInt($(this).attr("id").replace("price",""));
	 	$('#category'+(i+1)).removeAttr('disabled'); 
		$("#price"+(i+1)).attr("readonly",false);
		$("#detail"+(i+1)).attr("readonly",false);
	});
	
 	 $('.price').blur(function() {
		var i = parseInt($(this).attr("id").replace("price",""));
		$("#detail"+i).attr('style', 'background-color:#FFFFFF'); 
		$("#price"+i).attr('style', 'background-color:#FFFFFF'); 
		$("#category"+i).attr('style', 'background-color:#FFFFFF'); 
		
	}); 
	
 	 $(".category").focus(function() {
			var i = parseInt($(this).attr("id").replace("category",""));
			$("select:not(#category"+i+")").attr('style', 'background-color:#FFFFFF'); 
			$("input[type=text]:not(#price"+i+")").attr('style', 'background-color:#FFFFFF'); 
			$("input[type=text]:not(#detail"+i+")").attr('style', 'background-color:#FFFFFF'); 
			
			
			$('#category'+i).attr('style', 'background-color:#FFEFD5');
			$("#price"+i).attr('style', 'background-color:#FFEFD5');
			$('#detail'+i).attr('style', 'background-color:#FFEFD5');
			
		});

   	$('#regist_btn').click(function (){
   		var list_size = parseInt($('.add_line_btn').attr("id").replace("add_line_btn",""));
   		var last_input = 0;
   		
 	for(var i =1; i <= list_size; i++){
		if($('#category'+i).val() !="" || $('#price'+i).val() !="" || $('#detail'+i).val() !=""){
			last_input = i;
		} 		
 	}
 	
 	if(last_input == 0){
		alert("모든 항목을 입력해주세요.");
		return false;
		
	} 
 	
  	for(var i= 1; i <= last_input; i++){
 		if($('#category'+i).val() =="" || $('#price'+i).val() =="" || $('#detail'+i).val() ==""){
 			alert("모든 항목을 입력해주세요.");
			return false;
		}else{
			if($.isNumeric($('#price'+i).val().replace(/,/gi ,"")) == false && $('#price'+i).val() !='' ){
				alert("금액은 숫자만 입력해주세요.");
				return false;
		}else{
			$('#price'+i).val($('#price'+i).val().replace(/,/gi ,"")); 
		}	
	}
 	} 
});  
});
</script>
<style type="text/css">
@font-face {
	font-family: 'koverwatch';
	src: url(font/koverwatch.ttf) format('truetype');
}

#index_div {
	font-family: koverwatch;
	font-size: 30px;
}

.btn {
	font-weight: bold;
	background-color: #1abc9c;
	padding: 10px 35px;
	text-align: center;
	color: white;
	border-radius: 10px;
}

.bookmark2 {
	border-radius: 10px;
	background-color: #1abc9c;
	padding: 10px;
	width: 150px;
	margin: 3px;
}

#main_div {
	background-color: #f3f3f3;
	border: 3px solid #1abc9c;
}

#list_div {
	display: inline-block;
}

#date_div {
	display: inline-block;
	text-align: center;
}

#btn_list_div {
	top: 350px;
	left: 200px;
	padding-left: 150px;
}

#year, #month, #day {
	border: 1px solid #ddd;
	padding: 10px;
	width: 100px;
}

select {
	border: 1px solid #ddd;
	padding: 10px;
	width: 140px;
}

input[type="text"] {
	border: 1px solid #ddd;
	padding: 10px;
}

.btn:hover {
	background-color: grey;
	color: #fff;
	text-decoration: none
}

div {
	padding: 5px;
}

.add_line_btn {
	color: #000000;
	font-size: 25px;
	text-align: right;
	margin-left: 5px;
}

</style>
<title>가계부 등록</title>
</head>
<body onload="SetToToday('${date}');">

	<Form action="moneyBookRegist.do" name="Form1">
		<div id="main_div">

			<div id="date_div">
				<SELECT name="year" id="FirstSelectYear"
					onchange="ChangeOptionDays('FirstSelect')">
					<SCRIPT language="JavaScript">
						document.write(WriteYearOptions(10));
					</SCRIPT>
				</SELECT> <SELECT id="FirstSelectMonth" name="month"
					onchange="ChangeOptionDays('FirstSelect')">
					<OPTION value="1">1월
					<OPTION value="2">2월
					<OPTION value="3">3월
					<OPTION value="4">4월
					<OPTION value="5">5월
					<OPTION value="6">6월
					<OPTION value="7">7월
					<OPTION value="8">8월
					<OPTION value="9">9월
					<OPTION value="10">10월
					<OPTION value="11">11월
					<OPTION value="12">12월
				</SELECT> <SELECT id="FirstSelectDay" name="day">
					<OPTION value="1">1일
					<OPTION value="2">2일
					<OPTION value="3">3일
					<OPTION value="4">4일
					<OPTION value="5">5일
					<OPTION value="6">6일
					<OPTION value="7">7일
					<OPTION value="8">8일
					<OPTION value="9">9일
					<OPTION value="10">10일
					<OPTION value="11">11일
					<OPTION value="12">12일
					<OPTION value="13">13일
					<OPTION value="14">14일
					<OPTION value="15">15일
					<OPTION value="16">16일
					<OPTION value="17">17일
					<OPTION value="18">18일
					<OPTION value="19">19일
					<OPTION value="20">20일
					<OPTION value="21">21일
					<OPTION value="22">22일
					<OPTION value="23">23일
					<OPTION value="24">24일
					<OPTION value="25">25일
					<OPTION value="26">26일
					<OPTION value="27">27일
					<OPTION value="28">28일
					<OPTION value="29">29일
					<OPTION value="30">30일
					<OPTION value="31">31일
				</SELECT>
			</div>

			<div id="index_div">
				<span style="color: #1abc9c; font-weight: bold;"> <i
					class="fa fa-bookmark" aria-hidden="true"></i> 즐겨찾기
				</span>
			</div>

			<div id="bookmark_list_div">
				<c:forEach var="bm" items="${bookMarkList}" varStatus="status">
					<input type="button" class="btn bookmark2"
						id="bookmark_select${status.index}" value="${bm.detail}">
					<input type="hidden" id="abookmark_select${status.index}"
						value="${bm.bookmarkNo}">
					<c:if test="${status.index==2}">
						<br>
					</c:if>
				</c:forEach>
			</div>

			<div id="list_div">
				<input type="hidden" name="id_index" value="${param.id_index}">
				<table id="list_table">
				<tr>
							<td><select id="category1" name="category" class='category'>
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
								placeholder="사용내역을 입력하세요." id="detail1"></td>
							<td><input type="text" name="price" class=price
								id="price1" placeholder="가격을 입력하세요." > 
							</td>
						</tr>
					<c:forEach begin="2" end="5" varStatus="status">
						<tr>
							<td><select id="category${status.index}" class='category' name="category" disabled="disabled">
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
								placeholder="사용내역을 입력하세요." id="detail${status.index}" readonly="readonly"></td>
							<td><input type="text" name="price" class="price"
								id="price${status.index}" placeholder="가격을 입력하세요." readonly="readonly"> <c:if
									test="${status.last}">
									<td><a href="#" target="" id="add_line_btn${status.index}"
										class="add_line_btn"> <i class="fa fa-plus-circle fa-2x;"
											aria-hidden="true" title="항목을 추가하고 싶으면 클릭하세요"></i>
									</a></td>
								</c:if></td>
						</tr>
					</c:forEach>
				</table>

			</div>

			<div id="btn_list_div">
				<input type="submit" value="등록" class="btn" id="regist_btn">
				<input type="button" value="취소" class="btn" id="cancle_btn">
			</div>
		</div>
	</form>
</body>
</html>