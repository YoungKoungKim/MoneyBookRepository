
//천 단위마다 콤마 추가하기	
function addComma(value) {
  var num = isNumber(value);
  if (!num) return;

  // 문자열 길이가 3과 같거나 작은 경우 입력 값을 그대로 리턴
  if (num.length <= 3) {
    return num;
  }

  // 3단어씩 자를 반복 횟수 구하기
  var count = Math.floor((num.length - 1) / 3);

  // 결과 값을 저정할 변수
  var result = "";

  // 문자 뒤쪽에서 3개를 자르며 콤마(,) 추가
  for (var i = 0; i < count; i++) {

    // 마지막 문자(length)위치 - 3 을 하여 마지막인덱스부터 세번째 문자열 인덱스값 구하기
    var length = num.length;
    var strCut = num.substr(length - 3, length);
    // 반복문을 통해 value 값은 뒤에서 부터 세자리씩 값이 리턴됨.

    // 입력값 뒷쪽에서 3개의 문자열을 잘라낸 나머지 값으로 입력값 갱신
    num = num.slice(0, length - 3);

    // 콤마(,) + 신규로 자른 문자열 + 기존 결과 값
    result = "," + strCut + result;
  }

  // 마지막으로 루프를 돌고 남아 있을 입력값(value)을 최종 결과 앞에 추가
   result = num + result; 

  // 최종값 리턴
  return result;

}

// 숫자 유무 판단
function isNumber(checkValue) {
	checkValue = '' + checkValue;
	
	if(checkValue.length >=4) {
	checkValue= checkValue.replace(/,/gi ,""); 
	}
	
  if (isNaN(checkValue) /* || checkValue == "" */) {
    alert('금액은 숫자만 입력해 주세요.');
    return;
  }
  return checkValue;
}


function addextraList(){
	
	$.ajax({
		type : "post",
		url : "boardWriteList.do",
		data : "date="+ $('#date2').val(),
		dataType :  "json",
		success :  function (data) {
			for(var i in data.list) {
				
				data.list[i].price = addComma(data.list[i].price);
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
					+"</span><br><span> "+ data.list[i].price +"원</span><br>"
					+"<span>"+data.list[i].percent+"%</span></div>");
					}//공과금
					
					else if(data.list[i].category == 'culturallife'){
					$('#left').append("<div class ='div_category'>"
					+"<span>"
					+"<i id='it' style='color: #3CB371;' class='fa fa-film' aria-hidden='true'></i>"
					+"</span><br><span>문화생활비</span>"
					+"</span><br><span> "+ data.list[i].price +"원</span><br>"
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

function removeTag( html ) {
    return html.replace(/(<([^>]+)>)/gi, "");
}

function doRemoveTag(age1, age2) {

	 var title =  removeTag(age1);
	 $("[name=title]").val(title);

}
$('#summernote').summernote({
	  callbacks: {
	    onImageUpload: function(files) {
	      // upload image to server and create imgNode...
	      $summernote.summernote('insertNode', imgNode);
	    }
	  }
	});

	// summernote.image.upload
	$('#summernote').on('summernote.image.upload', function(we, files) {
	  // upload image to server and create imgNode...
	  $summernote.summernote('insertNode', imgNode);
	});

	$(document).ready(function() {
		
		addextraList();
		var today = new Date();
		var dd = today.getDate();
		var mm = today.getMonth() + 1; //January is 0!
		var yyyy = today.getFullYear();
		if (dd < 10) {
			dd = '0' + dd
		}
		if (mm < 10) {
			mm = '0' + mm
		}
		today = yyyy + '-' + mm + '-' + dd;
		$("#nowDate").text("날짜 : " + today); //날짜 표시

		$('#back').on('click', function () {
			var date=$('#date2').val();
			location.href="viewMyPage.do?date="+date;
		});
		
		$("#formsubmitBtn").on("click", function() {
			var content1 = $('#summernote').summernote('code');
			var title = $('#title1').val();
			var result2 = title.replace(/\s+$/, '');
			
			if(result2 == ""){
				  alert("제목을 입력해주세요");
			} else {
					  doRemoveTag(title);
					 $('textarea[name="content"]').val(content1);
					  $("#formsubmit").submit();
				  }
		 });
		
		  $('#summernote').summernote({
		        height: "200px",
		        callbacks: {
		          onImageUpload: function(files) {
		            var $editor = $(this);
		            var data = new FormData();
		            data.append('fileup', files[0]);
		            $.ajax({
		              url: '/image/upload',
		              method: 'POST',
		              data: data,
		              processData: false,
		              contentType: false,
		              success: function(url) {
		                $editor.summernote('insertImage', url);
		              }
		            });
		          }
		        }
		      });
	});
