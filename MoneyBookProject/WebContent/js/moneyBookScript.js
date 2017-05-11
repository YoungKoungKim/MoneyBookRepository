$(document).ready(function() {
$("#datepicker").datepicker();
		$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
		$("#datepicker").datepicker("setDate", "${mbDate}");
		
		$('#category').val('${moneyBook.category}');
		$('#edt_detail').val('${moneyBook.detail}');
		$('#edt_price').val('${moneyBook.price}');
		
		$('#btn_delete').click(function() {
			$.ajax({
				type : 'post',
				url : 'moneyBookDelete.do',
				dataType : 'json',
				data : 'id_index=${id_index}&moneyBookNo=${moneyBook.moneyBookNo}',
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
				data : 'id_index=${id_index}'
						+ '&moneyBookNo=${moneyBook.moneyBookNo}'
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