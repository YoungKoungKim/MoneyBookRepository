function addextraList(){
	var boardNo = $("#boardNo").val();

	$.ajax({
		type : 'post',
		url : 'boardDetailList.do',
		data : 'boardNo='+boardNo,
		dataType :  'json',
		success :  function (data) {
			for(var i in data.list) {
				if(data.list[i].category == 'food'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #ADD8E6;' class='fa fa-cutlery' aria-hidden='true'></i>"
					+"</span><br><span>식비</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//식비
					
					else if(data.list[i].category == 'traffic'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it'style='color: #FF6347;' class='fa fa-bus' aria-hidden='true'></i>"
					+"</span><br><span>교통비</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//교통비
					
					else if(data.list[i].category == 'commodity'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id ='it' style='color: #FFA500;' class='fa fa-shopping-cart' aria-hidden='true'></i>"
					+"</span><br><span>생필품</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//생필품
					
					else if(data.list[i].category == 'beauty'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #FFB6C1; 'class='fa fa-bath' aria-hidden='true'></i>"
					+"</span><br><span>미용</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//미용
					
					else if(data.list[i].category == 'medical'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it'style='color: #6A5ACD;'class='fa fa-medkit' aria-hidden='true'></i></td>"
					+"</span><br><span>의료</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//의료
					
					else if(data.list[i].category == 'education'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #DDA0DD;'class='fa fa-book' aria-hidden='true'></i>"
					+"</span><br><span>교육</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//교육
					
					else if(data.list[i].category == 'phonefees'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #1E90FF;' class='fa fa-mobile' aria-hidden='true'></i>"
					+"</span><br><span>통신비</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//통신비
					
					else if(data.list[i].category == 'saving'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #DAA520;' class='fa fa-database' aria-hidden='true'></i>"
					+"</span><br><span>저축</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//저축
					
					else if(data.list[i].category == 'utilitybills'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it'style='color: #708090;'class='fa fa-plug' aria-hidden='true'></i>"
					+"</span><br><span>공과금</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//공과금
					
					else if(data.list[i].category == 'culturallife'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #3CB371;' class='fa fa-film' aria-hidden='true'></i>"
					+"</span><br><span>문화생활비</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//문화생활비
					
					else if(data.list[i].category == 'otheritems'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #FA8072;' class='fa fa-minus-circle' aria-hidden='true'></i>"
					+"</span><br><span>기타</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//기타
					
					else if(data.list[i].category == 'incomes'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #9ACD32;'class='fa fa-krw' aria-hidden='true'></i>"
					+"</span><br><span>수입</span>"
					+"</span><br><span> "+data.list[i].price +"원</span><br>"
					+"</div>");
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
function formCheck() {
	
}
	$(document).ready(function() {
		 addextraList();
		
		 $("#formsubmitBtn").on("click", function() {
			var content1 = $('#textContent').val(); 
			var title = $('#title1').val();
		 	var result = content1.replace(/\s+$/, '');
			var result2 = title.replace(/\s+$/, '');
			if(result2 == ""){
				  alert("제목을 입력해주세요");
				  }	else if(result == ""){
					  alert("내용을 입력해주세요");
				  } else {
					  $("#formsubmit").submit();
				  }
			 
		 });
		 
		 		 
	});
