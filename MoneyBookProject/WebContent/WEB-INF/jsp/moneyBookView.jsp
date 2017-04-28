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
	font-family: 'Ubuntu Condensed', sans-serif;
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
	position: absolute;
	left: 20%;
	right: 20%;
	height: 100%;
	width: 60%;
}

#right {
	position: absolute;
	height: 100%;
	width: 20%;
	right: 0%;
}

#calendar {
	padding-top: 50px;
	max-width: 600px;
	margin: 0 auto;
}

#detail {
	min-height: 300px;
}

.fc-event, .fc-event:hover, .ui-widget .fc-event {
	color: #000; /* default TEXT color */
	text-decoration: none; /* if <a> has an href */
}

.fc-day-number {
	color: #91D4B5;
}
</style>

<script type="text/javascript">

function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

	$(document).ready(function() {
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
					data : 'id_index=1&date=' + nowDate.format('YYYY-MM-DD'),
					success : function(data) {
						var events = [];
						for (var i = 0; i < data.lastDay; i++) {
							events.push({
								title : '수입:' + data.income[i].title,
								start : data.income[i].start
							});
							events.push({
								title : '지출:' + data.expense[i].title,
								start : data.expense[i].start
							});
						}
						callback(events);
						
						$('#monthIncome').text(data.monthIncome);
						$('#monthExpense').text(data.monthExpense);
					}
				});
			},
			dayClick: function(date, jsEvent, view) {
				var current = $('#calendar').fullCalendar('getDate');
				var now = dateToYYYYMMDD(today);
				
				if (date.format().substring(0, 7) == current.format('YYYY-MM-DD').substring(0,7)) {
						$('.fc-day').css('background-color', '#ffffff');
						$('.fc-today').css('background-color', '#DCDCDC');
						$(this).css('background-color', '#91D4B5');
						$.ajax({
							type : 'post',
							url : 'moneyBookDetailView.do',
							dataType : 'json',
							data : 'id_index=1&date=' + date.format(),
							success : function(data) {
								$('#detail').text('');
								$(data).each(function(i) {
									var text = "<div class='detail' id='" + data[i].moneyBookNo + "onClick=callUpdateForm("+ 
											data[i].moneyBookNo + "," + date.format() + ")>" + data[i].category + " : " + data[i].price + "</div>"
									$('#detail').append(text);
								})
							},
							error : function() {
								alert('error');
							}
						});
				} else {
					alert('잘못된 선택');
				}

		    }
		});
		
		$(document).on('click', '.detail', function callUpdateForm(moneyBookNo, date) {
			alert(moneyBookNo + " : " + date);
		});
		
	});
</script>
</head>
<body>
	<div id="left">
		<center>
			<div>
				총 수입 : <span id="monthIncome">${monthAmount.income }</span>
			</div>
			<div>
				총 지출 : <span id="monthExpense">${monthAmount.expense }</span>
			</div>
		</center>
	</div>

	<div id="center">
		<div id="calendar"></div>
		<div id="detail"></div>
	</div>

	<div id="right">
		<button>등록</button>
		<button>공유</button>
	</div>
</body>
</html>