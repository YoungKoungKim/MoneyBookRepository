<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캘린더 페이지</title>
<link href="./fullcalendar-3.3.1/fullcalendar.css" rel="stylesheet" />
<link href="./fullcalendar-3.3.1/fullcalendar.print.css" rel="stylesheet" media="print" />
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
	padding-top : 50px;
	max-width: 600px;
	margin: 0 auto;
}

#detail {
	min-height: 300px;
	background-color: blue;
}

.fc-event, .fc-event:hover, .ui-widget .fc-event {
	color: #000; /* default TEXT color */
	text-decoration: none; /* if <a> has an href */
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		var today = new Date();

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,listWeek'
			},
			defaultDate : today,
			navLinks : true, // can click day/week names to navigate views

			weekNumberCalculation : 'ISO',

			editable : false,
			eventLimit : false, // allow "more" link when too many events
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

		        alert('Clicked on: ' + date.format());

		        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

		        alert('Current view: ' + view.name);

		        $(this).css('background-color', 'red');

		    }
		});
		
/* 		$('a.fc-day-number').removeAttr('data-goto');
		$(document).on("click", 'a.fc-day-number', function() {
			$(this).removeAttr('data-goto');
		}); */
		
/* 		$('a.fc-day-number').click(function() {
			alert('나오냐?');
		}); */
		
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
		<div id="detail">
			
		</div>
	</div>

	<div id="right">
		<button>등록</button>
		<button>공유</button>
	</div>
</body>
</html>