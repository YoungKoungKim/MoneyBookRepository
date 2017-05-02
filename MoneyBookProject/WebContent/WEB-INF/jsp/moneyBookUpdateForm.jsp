<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>

	$(document).ready(function() {
		$("#datepicker").datepicker();
		$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
		$("#datepicker").datepicker("setDate", "${mbDate}");
		
		$('#category').val("${moneyBook.category}");
		$('#edt_detail').val("${moneyBook.detail}");
		$('#edt_price').val("${moneyBook.price}");
		
		$('#btn_delete').click(function() {
			$.ajax({
				type : 'post',
				url : 'moneyBookDelete.do',
				dataType : 'json',
				data : 'id_index=' + ${id_index} + '&moneyBookNo=' + ${moneyBook.moneyBookNo},
				success : function(data) {
					alert(data.msg);
					if (data.result) {
						//창 종료	
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
				data : 'id_index=' + ${id_index}
						+ '&moneyBookNo=' + ${moneyBook.moneyBookNo}
						+ '&category=' + $('#category').val()
						+ '&detail=' + $('#edt_detail').val()
						+ '&price=' + $('#edt_price').val()
						+ '&date=' + $('#datepicker').val(),
				success : function(data) {
					alert(data.msg);
					if (data.result) {
						//창 종료	
					} else {
						//창 냅두기
					}
				},
				error : function() {
					alert('error');
				}
			});
		});
		
	});
</script>


</head>
<body>
	<center>
			<fieldset>
				<div class="form-group">
					<label class="col-md-4 control-label" for="date">Date</label>
					<div class="col-md-4">
						<input class="form-control" type="text" id="datepicker">
					</div>
				</div>

				<!-- Select Basic -->
				<div class="form-group">
					<label class="col-md-4 control-label" for="category">Category</label>
					<div class="col-md-4">
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

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="edt_detail">Detail</label>
					<div class="col-md-4">
						<input name="edt_detail" class="form-control input-md"
							id="edt_detail" type="text">

					</div>
				</div>

				<!-- Text input-->
				<div class="form-group">
					<label class="col-md-4 control-label" for="edt_price">Price</label>
					<div class="col-md-4">
						<input name="edt_price" class="form-control input-md"
							id="edt_price" type="text">

					</div>
				</div>

				<!-- Button -->
				<div class="form-group">
					<button name="update" class="btn btn-primary" id="btn_update">수정</button>
					<button name="delete" class="btn btn-primary" id="btn_delete">삭제</button>
					<button name="cancel" class="btn btn-primary" id="btn_cancel">취소</button>
				</div>

			</fieldset>
	</center>
</body>
</html>