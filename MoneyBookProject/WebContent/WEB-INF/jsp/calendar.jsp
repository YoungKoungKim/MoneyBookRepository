<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>캘린더 페이지</title>
<link href="./fullcalendar-3.3.1/fullcalendar.css" rel="stylesheet"/>
<link href="./fullcalendar-3.3.1/fullcalendar.print.css" rel="stylesheet" media="print"/>
<!-- 웹폰트 -->
<link href="https://fonts.googleapis.com/css?family=Abel|Open+Sans+Condensed:300|Rationale|Ubuntu+Condensed" rel="stylesheet">
<script type="text/javascript" src="./fullcalendar-3.3.1/lib/moment.min.js"></script>
<script type="text/javascript" src="./fullcalendar-3.3.1/fullcalendar.js"></script>

<style type="text/css">
    body {
        margin :40px 10px;
        padding : 0;
        font-family: 'Ubuntu Condensed', sans-serif;
        font-size : 14px;
    }
    #calendar {
        max-width : 600px;
        margin : 0 auto;
    }
</style>

<script type="text/javascript">
$(document).ready(function() {
	var today = new Date();
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,listWeek'
		},
		defaultDate: today,
		navLinks: true, // can click day/week names to navigate views

		weekNumberCalculation: 'ISO',

		editable: true,
		eventLimit: true, // allow "more" link when too many events
		
	});
	
});
</script>
</head>
<body>
	<div id="calendar"></div>
</body>
</html>