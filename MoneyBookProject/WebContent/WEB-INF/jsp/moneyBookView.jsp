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
}

#calendar {
	max-width: 600px;
	margin: 0 auto;
}
</style>

<script type="text/javascript">

	$(document).ready(function() {
		// 	<c:forEach items="${arr }" var="str">
		// 		alert('${str}');
		// 	</c:forEach>
		// 	alert('a');
		// 	alert('b');
		// 	alert('c');

		var today = new Date();
		
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,agendaWeek,listWeek'
			},
			defaultDate : today,
			navLinks : true, // can click day/week names to navigate views

			weekNumberCalculation : 'ISO',

			editable : false,
			eventLimit : true // allow "more" link when too many events
		});
		
		$.ajax({
			type : 'get',
			url : 'moneyBookView.do',
			data : 'id_index=1&date=' + today.yyyymmdd(),
			dataType : 'json',
			success : function(data) {
				alert(data.lastDay);
				for (var i = 0; i < data.lastDay; i++) {
					if (i != (data.lastDay-1)) {
						$('#calendar').fullCalendar({
							events : [
								{
									title : data.income[i].title,
									start : data.income[i].start
								}
							]
						});
					} else {
						
					}
				}
			},
			error : function() {
				alert('error');
			}
		})


		jQuery("button.fc-prev-button").click(function() {
			var date = jQuery("#calendar").fullCalendar("getDate");
			convertDate(date);
		});

		// 오른쪽 버튼을 클릭하였을 경우
		jQuery("button.fc-next-button").click(function() {
			var date = jQuery("#calendar").fullCalendar("getDate");
			convertDate(date);
		});

	});
	// 받은 날짜값을 date 형태로 형변환 해주어야 한다.
	function convertDate(date) {
		var date = new Date(date);
		date.yyyymmdd();
	}

	// 받은 날짜값을 YYYY-MM-DD 형태로 출력하기위한 함수.
	Date.prototype.yyyymmdd = function() {
		var yyyy = this.getFullYear().toString();
		var mm = (this.getMonth() + 1).toString();
		var dd = this.getDate().toString();
		return yyyy + "-" + (mm[1] ? mm : "0" + mm[0]) + "-" + (dd[1] ? dd : "0" + dd[0]);
	}
</script>
</head>
<body>
	<div>수입 : ${monthAmount.income }</div>
	<div>지출 : ${monthAmount.expense }</div>
	<div id="calendar"></div>
</body>
</html>