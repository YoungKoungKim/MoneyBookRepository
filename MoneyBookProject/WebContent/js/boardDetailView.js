function getCommentList() {
	var id_index = parseInt('${id_index}');
	var boardNo = $("#boardNo").val();
	$.ajax({
		url : "getCommentList.do",
		type : "get",
		data : "boardNo=" + boardNo,
		dataType : "json",
		success : function(data) {
			$("#commentTable").html("");
			for(var comment in data) {
				var date = new Date(data[comment].date);
				var time = date.getFullYear() + "." + (date.getMonth() + 1) + "." + date.getDate() + " " + date.getHours() + ":" + date.getMinutes();
					
					if(id_index == data[comment].id_index)
					{

					$("#commentTable").html($("#commentTable").html() + "<tr>	<td>" + data[comment].nick + "&nbsp;&nbsp;&nbsp;" + time +"&nbsp;&nbsp;&nbsp; <span id='rec_" + data[comment].commentNo + "'>추천:"+ data[comment].recommend+"</span>"
					+ "</td></tr><tr><td> <textarea class='comment' style='resize: none;' id='comment_"+data[comment].commentNo+"' rows='2' cols='100' readonly='readonly'> "+ data[comment].content + " ${fn:replace(board.content, cn, br)}</textarea>"
							+"<input class='delete' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"' type='button' value='삭제'>"
							+"<input class='update' type='button' id='"+data[comment].commentNo+"@' name='"+data[comment].commentNo+"' value='수정'></td> </tr>"
							);
					
					}else {
						$("#commentTable").html($("#commentTable").html() + 
						"<tr>	<td>" + data[comment].nick + 
						"&nbsp;&nbsp;&nbsp;" + time +"&nbsp;&nbsp;&nbsp; <span id='rec_" + data[comment].commentNo + "'>추천:"+ data[comment].recommend+"</span>"
						+"</td></tr><tr><td> <textarea class='comment' style='resize: none;' rows='2' cols='100' readonly='readonly'> "+ data[comment].content + "</textarea>"
						+"<input class='recommendcomment' type='button' id='" + data[comment].commentNo + "@' name ='" + data[comment].commentNo + "' value='추천'> </td></tr>"
						);						
					}	
					
					}
					$('.delete').on('click',function(){
						var idno = $(this).attr('id').split('@')[0];
						var commentNo = $(this).attr('name');
						if(idno == commentNo) {
						$.ajax({
							type : 'post',
							url : 'commentDelete.do',
							data : 'commentNo='+commentNo,
							dataType : 'json',
							success : function(data){
								getCommentList();
								alert("삭제완료");
							},
							error:function(){
						      
						       }
						});
						}
					});
					
					$('.update').on('click', function(){
// 						var idno = $(this).attr('id').split('@')[0];
						var btnval =$(this).val();
						var commentNo = $(this).attr('name');
						var content = $('#comment_'+commentNo).val();					
						if(btnval == "수정"){
						$('#comment_' + commentNo).removeAttr("readonly");	
						 	alert('수정가능합니다');
						 	$(this).attr('value','변경');
						 	$('#comment_' + commentNo).focus();
						}else if(btnval=="변경"){
							$.ajax({
								type : 'post',
								url : 'commentUpdate.do',
								data : 'commentNo='+commentNo +"&content="+content,
								dataType : 'json',
								success : function(data){
									alert("수정완료");
									getCommentList();
								},
								error:function(){
							      
							       }
							});
						}
						
					});
					
					$('.recommendcomment').on('click',function(){
						var idno = $(this).attr('id').split('@')[0];
						var commentNo = $(this).attr('name');
						
						$.ajax({
							type : 'post',
							url : 'commentRecommend.do',
							data : 'commentNo='+commentNo+"&boardNo="+boardNo,
							dataType : 'json',
							success : function(data){
								if(data.code ==0){
									$('#rec_' + idno).text('추천 :'+data.recommend);
									alert("추천되었습니다.");
								}else if(data.code ==1){
										$('#spanrecommend').text('추천 :'+data.recommend);						
										alert("이미추천하셨습니다.");
								}else if(data.code==3){
									alert("로그인해주세여");
								}
							},
							error:function(){
						      
						       }
							});
						
					});
					
				},
				error : function() {
					alert("실패");
				}
			
			});

			}
		
	
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
		
				
		
		
	$(document).ready(function() {
		var boardNo = $("#boardNo").val();

		getCommentList();

		addextraList();
		
		var id_index = parseInt('${id_index}');
			
		$('#recommendbtn').on('click', function() {

			$.ajax({
				type : 'post',
				url : 'boardRecommend.do',
				data : 'boardNo='+boardNo,
				dataType : 'json',
				success : function(data) {
					if(data.code ==0){
						//추천 성공
						$('#recommend').text(data.recommend);	
						alert("추천하셨습니다.");
					}else if(data.code ==1){
						//로그인해
						alert("로그인해주세요.");
					}else if(data.code==3){
						//이미 추천해썽
						alert("이미 추천한 게시글입니다.");
					}
				}, 
				error : function(data){
				}
			});
		});
	
	
	$('#commentbut').on('click', function() {
		var content1 = $('#content1').val();
		var nick1 = $('#nick1').val();
		  var result = content1.replace(/\s+$/, '');
		if(result){
		$.ajax({
			type : 'post',
			url : 'commentWrite.do',
			data : 'boardNo='+boardNo+'&nick1='+ nick1 +'&content1='+ content1 +'&id_index='+'${id_index}',
			dataType : 'json',
			success :  function () {
				$('#content1').val(' ');
				getCommentList();
			},
			error : function() {
				alert('실패');
			}
		});
	
		}else{
			alert("내용을 입력하세요!");
		}
	});
		
	

});
