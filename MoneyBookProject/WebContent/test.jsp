<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"
	integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#btn').click(function() {
			$.ajax({
				url : 'moneyBookDelete.do',
				type : 'GET',
				data : 'id_index=10&moneyBookNo=14',
				dataType : 'json',
				success : function(data) {
					alert(data.result);
				},
				error : function() {
					alert('fail');
				}
			});
		});
	});

</script>
</head>
<body>
	<button id="btn">버튼</button>

</body>
</html>