<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캘린더 페이지</title>
<link href="./fullcalendar-3.3.1/fullcalendar.css" rel="stylesheet" />
<link href="./fullcalendar-3.3.1/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Abel|Open+Sans+Condensed:300|Rationale|Ubuntu+Condensed"
	rel="stylesheet">
<script type="text/javascript"
	src="./fullcalendar-3.3.1/lib/moment.min.js"></script>
<script type="text/javascript"
	src="./fullcalendar-3.3.1/fullcalendar.js"></script>

<style type="text/css">
body {
	padding: 0;
	font-size: 14px;
	height: 100%;
}

#left {
	position: absolute;
	height: 100%;
	left: 0;
	width: 20%;
}

#center {
	font-family: 'Ubuntu Condensed', sans-serif;
	position: relative;
	left: 20%;
	right: 20%;
	height: 100%;
	width: 70%;
}

#right {
	position: relative;
	height: 100%;
	width: 10%;
	right: 0%;
}

#calendar {
	padding-top: 50px;
	max-width: 700px;
	margin: 0 auto;
}

#detail {
	box-sizing: border-box;
	table-layout: fixed;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 1em;
	min-height: 300px;
	/* 	margin-left: #calendar.margin;
	margin-right: px; */
}

.fc-event, .fc-event:hover, .ui-widget .fc-event {
	color: #000; /* default TEXT color */
	text-decoration: none; /* if <a> has an href */
}

.fc-day-number {
	color: #A9A9A9;
}

.detailOne:hover {
	background-color: #91D4B5;
}

.btn {
	font-weight: bold;
	border-radius: 10px;
	background-color: #1abc9c;
	padding: 10px 35px;
	text-align: center;
	color: white;
	border-radius: 10px;
}

.btn:hover {
	background-color: grey;
	color: #fff;
	text-decoration: none
}

#borderLine {
	padding: 5px;
	margin: 10px;
	border: 3px solid #1ABC9C;
}

.modal-body {
	max-width: 450px;
}

</style>

<script type="text/javascript">

$('#detail').css('margin', $('calendar').attr('margin'));

jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    return this;
}

function moneyBookRegist(id_index){
	var popUrl = "moneyBookWriteForm.do?id_index=" + id_index;	//팝업창에 출력될 페이지 URL
	var popOption = "top=200, left=300, width=600, height=500, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
	window.open(popUrl,"가계부입력",popOption);
}

function bookmarkRegist(id_index){
	var popUrl = "bookmarkRegistForm.do?id_index=" + id_index;	//팝업창에 출력될 페이지 URL
	var popOption = "top=200, left=300, width=500, height=400, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
	window.open(popUrl,"즐겨찾기등록",popOption);
}
	
function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

function convertCategory(word) {
	var category = {
		food : "식비",
		traffic : "교통비",
		commodity : "생필품",
		beauty : "미용",
		medical : "의료",
		education : "교육",
		phonefees : "통신비",
		saving : "저축",
		utilitybills : "공과금",
		culturallife : "문화생활",
		otheritems : "기타",
		income : "수입"
	}
	return category[word];
}

	$(document).ready(function() {
		
		$(document).on('click', '.detailOne', function() {
			$("#datepicker").datepicker();
			$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
			
			$.ajax({
				type : 'post',
				url : 'moneyBookUpdateForm.do',
				dataType : 'json',
				data : 'id_index=${id_index}'
						+ "&date=" + $(this).attr('name')
						+ "&moneyBookNo=" + $(this).attr('id'),
				success : function(data) {
					$("#datepicker").datepicker("setDate", data.mbDate);
					$('#category').val(data.moneyBook.category);
					$('#edt_detail').val(data.moneyBook.detail);
					$('#edt_price').val(data.moneyBook.price);
					
					$('#btn_delete').click(function() {
						$.ajax({
							type : 'post',
							url : 'moneyBookDelete.do',
							dataType : 'json',
							data : 'id_index=${id_index}&moneyBookNo='
									+ data.moneyBook.moneyBookNo,
							success : function(data) {
								alert(data.msg);
								if (data.result) {
									location.reload();
								} else {
									//창 냅두기
								}
							},
							error : function() {
								alert('error');
							}
						});
					});
					
					$('#btn_update').click(function() {
						$.ajax({
							type : 'post',
							url : 'moneyBookUpdate.do',
							dataType : 'json',
							data : 'id_index=${id_index}'
									+ '&moneyBookNo=' + data.moneyBook.moneyBookNo
									+ '&category=' + $('#category').val()
									+ '&detail=' + $('#edt_detail').val()
									+ '&price=' + $('#edt_price').val()
									+ '&date=' + $('#datepicker').val(),
							success : function(data) {
								alert(data.msg);
								if (data.result) {
									location.reload();
								} else {
									//창 냅두기
								}
							},
							error : function() {
								alert('error');
							}
						});
					});
					
				},
				error : function() {
					alert("모달에러");
				}

			});
		});

	if('${param.succ}' == "sucess"){
			window.close();
			opener.parent.location.reload();
			//location.reload();
	} 
		
		$('#detailTable thead').hide();
		var today = new Date();
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,listWeek'
			},
 			defaultDate : today,
			navLinks : false, // can click day/week names to navigate views
			weekNumberCalculation : 'ISO',
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			events : function(start, end, timezone, callback) {
				var nowDate = $('#calendar').fullCalendar('getDate');
				
				$.ajax({
					type : 'post',
					url : 'moneyBookView.do',
					dataType : 'json',
					data : 'id_index=' + ${id_index} + '&date=' + nowDate.format('YYYY-MM-DD'),
					success : function(data) {
						var events = [];
						for (var i = 0; i < data.lastDay; i++) {
							if (data.income[i].title != 0) {
								events.push({
									/* 수입 */
									title : data.income[i].title,
									start : data.income[i].start,
									textColor : "#1ABC9C"
								});
							} else {
								events.push({
									/* 수입 */
									title : "",
									start : data.income[i].start,
									textColor : "#FFFFFF"
								});
							}
							
							if (data.expense[i].title != 0) {
								events.push({
									/* 지출 */
									title : data.expense[i].title,
									start : data.expense[i].start,
									textColor : "#FA8072"
								});
							}
						}
						callback(events);
						
						$('#monthIncome').text(data.monthIncome);
						$('#monthExpense').text(data.monthExpense);
					}
				});
			},
			dayClick: function(date, jsEvent, view) {
				$('#detailTable tbody').empty();
				var current = $('#calendar').fullCalendar('getDate');
				var now = dateToYYYYMMDD(today);
				
				if (date.format().substring(0, 7) == current.format('YYYY-MM-DD').substring(0,7)) {
					$('.fc-day').css('background-color', '#ffffff');
					if (date.format() == now) {
						$(this).css('background-color', '#91D4B5');
						$(this).css('opacity', '0');
						$('.fc-today').css('background-color', '#91D4B5');
						$('.fc-today').css('opacity', '0.4');
					} else {
						$('.fc-today').css('background-color', '#DCDCDC');
						$('.fc-today').css('opacity', '1');
						$(this).css('background-color', '#91D4B5');
						$(this).css('opacity', '0.4');
					}
						
						$.ajax({
							type : 'post',
							url : 'moneyBookDetailView.do',
							dataType : 'json',
							data : 'id_index=' + ${id_index} + '&date=' + date.format(),
							success : function(data) {
								if (data.length == 0) {
									$('#detailTable thead').hide();
									var img = "<center><br><h5>아직 등록된 데이터가 없습니다!</h5>"
												+"<img src='assets/img/ryan_broken.gif'"+
												"style='width='200px'; height='200px''></center>";
									$('#detailTable tbody').append(img);
								} else {
									$('#detailTable thead').show();
									$(data).each(function(i) {
										var td = "<tr"
												+ " class='detailOne' "
												+ " id='" + data[i].moneyBookNo + "'"
												+ " name='" + date.format() + "'"
												+ "data-target='#layerpop' data-toggle='modal'>"
												+ "<td>" + convertCategory(data[i].category) + "</td>"
												+ "<td>" + data[i].detail + "</td>"
												+ "<td>" + data[i].price + "</td>"
												+ "</tr>"
										$('#detailTable').append(td);
									})
								}
								
							},
							error : function() {
								alert('error');
							}
						});
				} else {
					
				}

		    }
		});
		
		// 왼쪽 버튼을 클릭하였을 경우
        $("button.fc-prev-button").click(function() {
        	$('#detailTable thead').hide();
        	$('#detailTable tbody').empty();
        });

        // 오른쪽 버튼을 클릭하였을 경우
       	$("button.fc-next-button").click(function() {
       		$('#detailTable thead').hide();
       		$('#detailTable tbody').empty();
        });

	});
	
	function loadImage(){
		var popUrl = "";	//팝업창에 출력될 페이지 URL
		var popOption = "width=650, height=420, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
</head>
<body>
	<div id="left">
		<center>
			<table>
				<tr>
					<td align="center"><h3>Total</h3></td>
				</tr>

				<tr>
					<td>Income : <span id="monthIncome">${monthAmount.income }</span></td>
				</tr>

				<tr>
					<td>Expense : <span id="monthExpense">${monthAmount.expense }</span></td>
				</tr>
			</table>
			<button onclick="bookmarkRegist(${param.id_index})">즐겨찾기 등록</button>
		</center>
	</div>

	<div id="center">
		<table>
			<tr>
				<td><div id="calendar"></div>
				<td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td>
					<div id="detail">
						<table class="table" id="detailTable">
							<thead>
								<tr>
									<th>Category</th>
									<th>Detail</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody class="detailBody">
							</tbody>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<div id="right">
		<button onclick="moneyBookRegist(${param.id_index})">등록</button>
		<button onclick="loadImage()">공유</button>
	</div>

	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="borderLine">
					<!-- header -->
					<!-- <div class="modal-header">
					닫기(x) 버튼
					<button type="button" class="close" data-dismiss="modal">×</button>
					header title
					<h4 class="modal-title"> </h4>
				</div> -->
					<!-- body -->
						<div class="modal-body">
							<div>
								<label class="control-label" for="datepicker">Date</label>
								<div>
									<input class="form-control" type="text" id="datepicker">
								</div>
							</div>

							<!-- Select Basic -->
							<div>
								<label class="control-label" for="category">Category</label>
								<div>
									<select name="category" class="form-control" id="category">
										<option>카테고리 선택</option>
										<option value="food">식비</option>
										<option value="traffic">교통비</option>
										<option value="commodity">생필품</option>
										<option value="beauty">미용</option>
										<option value="medical">의료</option>
										<option value="education">교육</option>
										<option value="phonefees">통신비</option>
										<option value="saving">저축</option>
										<option value="utilitybills">공과금</option>
										<option value="culturallife">문화생활</option>
										<option value="otheritems">기타</option>
										<option value="income">수입</option>
									</select>
								</div>
							</div>

							<div>
								<label class="control-label" for="edt_detail">Detail</label>
								<div>
									<input name="edt_detail" class="form-control input-md"
										id="edt_detail" type="text">
								</div>
							</div>

							<div>
								<label class="control-label" for="edt_price">Price</label>
								<div>
									<input name="edt_price" class="form-control input-md"
										id="edt_price" type="text">
								</div>
							</div>
						</div>
					<!-- Footer -->
					<div class="modal-footer">
						<div>
							<button name="update" class="btn" id="btn_update">수정</button>
							<button name="delete" class="btn" id="btn_delete">삭제</button>
							<button name="cancel" class="btn" id="btn_cancel"
								data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>