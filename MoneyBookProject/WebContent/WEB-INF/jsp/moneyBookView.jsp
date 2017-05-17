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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">


<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 웹폰트 -->
<link
	href="https://fonts.googleapis.com/css?family=Abel|Open+Sans+Condensed:300|Rationale|Ubuntu+Condensed"
	rel="stylesheet">
<script type="text/javascript"
	src="./fullcalendar-3.3.1/lib/moment.min.js"></script>
<script type="text/javascript"
	src="./fullcalendar-3.3.1/fullcalendar.js"></script>

<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Arimo);

@font-face {
	font-family: 'NanumGothic';
	src: url(font/NanumBarunGothic_0.ttf) format('truetype');
	font-family: 'NanumBarunpenR';
	src: url(font/NanumBarunpenR.ttf) foramt('truetype');
}

body {
	font-size: 14px;
}

#left {
	font-family: 'Ubuntu Condensed', sans-serif;
	position: absolute;
	margin-top: 50px;
	left: 0;
	width: 20%;
}

#center {
	font-family: 'Ubuntu Condensed', sans-serif;
	position: absolute;
	left: 20%;
	right: 20%;
	height: auto;
	width: 60%;
	margin-left: 2%;
}

#right {
	position: absolute;
	margin-top: 90px;
	width: 20%;
	right: 0;
}

#calendar {
	padding-top: 50px;
	max-width: 700px;
	margin: 0 auto;
}

#detail {
	box-sizing: border-box;
	table-layout: fixed;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 1em;
	min-height: 300px;
	/* 	margin-left: #calendar.margin;
	margin-right: px; */
}

.fc-event, .fc-event:hover, .ui-widget .fc-event {
	color: #000; /* default TEXT color */
	text-decoration: none; /* if <a> has an href */
}

.fc-day-number {
	color: #A9A9A9;
}

.detailOne:hover {
	background-color: #91D4B5;
}

.btn {
	border-radius: 10px;
	background-color: #1abc9c;
	padding: 10px 35px;
	text-align: center;
	color: white;
}

.btn:hover {
	background-color: grey;
	color: #fff;
	text-decoration: none;
}

.modal_btn {
	margin-bottom: 0px;
}

.moneyBookBtn {
	font-family: NanumBarunpenR;
	font-style: normal;
	background-color: #91D4B5;
	border-radius: 2px;
	margin: 20px auto;
}

.moneyBookBtn:hover {
	background-color: grey;
	color: #fff;
	text-decoration: none;
}

#borderLine {
	padding: 5px;
	margin: 10px;
	border: 3px solid #1ABC9C;
}

.modal-body {
	max-width: 450px;
}

.bookmark_btn {
	font-family: NanumBarunpenR;
	font-style: normal;
	background-color: #91D4B5;
	border: 1px solid #1abc9c;;
	border-radius: 2px;
	width: 70pt;
	height: 30pt;
	text-align: center;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 5px;
	color: black;
}

#bookmark_list_div {
	/* border: 1px solid #1abc9c; */
	
}

/* 계산기 Css  */
.clearfix:after {
	content: "";
	display: block;
	clear: both;
	visibility: hidden;
	font-size: 0;
	height: 0;
}

#calculator {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	/* background: #222; */
	margin: 0;
	padding: 0;
	font-family: 'Arimo', sans-serif;
}

*, *:before, *:after {
	-webkit-box-sizing: inherit;
	-moz-box-sizing: inherit;
	box-sizing: inherit;
}

#wrapper {
	background: #1f1f1f;
	width: 260px;
	padding: 0 8px 10px;
	border: 1px solid #141414;
	margin: 20px auto;
	border-radius: 5px;
}

main {
	padding: 0;
	width: 240px;
	margin: auto;
	background: #141212;
}

#screen {
	width: 240px;
	background: white;
	margin: 15px 0 2px 0;
	padding: 10px 10px;
	border-radius: 4px;
	font-size: 3em;
	text-align: right;
}

#calculator button {
	color: #AAA;
	float: left;
	width: 60px;
	font-size: 1.2em;
	height: 60px;
	outline: none;
	background: #3e3e3e;
	border: 1px solid #1f1f1f;
	border-radius: 3px;
}

#calculator button:hover {
	background: #424242;
}

#calculator button.blue {
	background: #007191;
	color: black;
}

#calculator button.darker {
	color: #BBB;
	background: #2b2b2b;
}

#calculator button.active {
	border: 3px solid #555;
}

#calculator button.dimmed {
	color: #555 !important;
}

#calculator .btn-wide {
	height: 60px !important;
	width: 120px !important;
}
</style>

<script type="text/javascript">
var boardWriteDate;
var clickDate;

$('#detail').css('margin', $('calendar').attr('margin'));

jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    return this;
}

function moneyBookRegist(id_index){
	var popUrl = "moneyBookWriteForm.do?id_index=" + id_index;	//팝업창에 출력될 페이지 URL
	var popOption = "top=200, left=300, width=600, height=500, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
	window.open(popUrl,"가계부입력",popOption);
}

function bookmarkRegist(id_index){
	var popUrl = "bookmarkRegistForm.do?id_index=" + id_index;	//팝업창에 출력될 페이지 URL
	var popOption = "top=200, left=300, width=600, height=300, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
	window.open(popUrl,"즐겨찾기등록",popOption);
}
	
function dateToYYYYMMDD(date){
    function pad(num) {
        num = num + '';
        return num.length < 2 ? '0' + num : num;
    }
    return date.getFullYear() + '-' + pad(date.getMonth()+1) + '-' + pad(date.getDate());
}

function convertCategory(word) {
	var category = {
		food : "식비",
		traffic : "교통비",
		commodity : "생필품",
		beauty : "미용",
		medical : "의료",
		education : "교육",
		phonefees : "통신비",
		saving : "저축",
		utilitybills : "공과금",
		culturallife : "문화생활",
		otheritems : "기타",
		income : "수입"
	}
	return category[word];
}

var data = {
		  entry: [],
		  entries: [],
		  currOperator: '',
		  addToEntry: function (val) {
		    this.entry.push(val);
		  },
		  clearAll: function () {
		    this.entry = [];
		    this.entries = [];
		  },
		  clearEntry: function () {
		    this.entry = [];
		  },
		  backspaceEntry: function () {
		    this.entry.pop();
		  },
		  toggleNegative: function () {
		    if (this.entry[0] !== '-') {
		      this.entry.unshift('-');
		    } else if (this.entry[0] === '-') {
		      this.entry.shift();
		    }
		  },
		  insertDecimal: function () {
		    if(this.entry.indexOf('.') === -1 && this.entry.length < 1) {
		      this.entry.push('0', '.');
		    } else if (this.entry.indexOf('.') === -1) {
		      this.entry.push('.');
		    }
		  },
		  calculate: function (operator) {
		    // reset chain of operations if "=" is pressed with no operator afterwords
		    if (this.currOperator === "=" && this.entry.length > 0) {
		      this.entries = [];
		    } 
		    
		    // if current entry isn't blank, add to entries
		    if (this.entry.length > 0 ) {
		      this.entries.push(this.entry.join(''));
		    }

		    // perform operation for every two entries
		    if (this.entries.length >= 2) {
		      this.entries.splice(1, 0, this.currOperator);
		      var total = eval(this.entries.join(' '));
		      this.entries = [total];
		      this.currOperator = '=';
		    } 
		    
		    if (operator) {
		      this.currOperator = operator;
		    }   
		    this.clearEntry();
		  }
		}

var controller = {
		  init: function () {
		    view.render();
		    $('#calculator button').click(function () {
		            
		      var button = $(this).text();
		      if (!isNaN(parseInt(button))) {
		        button = parseInt(button);
		      } 
		      
		      if (button === "=") {
		        data.calculate('=');
		      } else if (button === "+/-") {
		        data.toggleNegative();
		      } else if (button === "AC") {
		        data.clearAll();
		      } else if (button === 'C') {
		        data.clearEntry();
		      } else if (button === ' ') {
		        data.backspaceEntry();
		      } else if (button === "+") {
		        data.calculate('+');
		      } else if (button === "-") {
		        data.calculate('-');
		      } else if (button === "×") {
		        data.calculate('*');
		      } else if (button === "÷") {
		        data.calculate('/');
		      } else if (button === ".") {
		        data.insertDecimal();
		      } else {
		        data.addToEntry(button);
		      }
		        
		      view.render();
		    });
		  },
		  // get display number for screen  -- returns entry if not currently blank, returns previous entry if not 
		  getScreenVal: function () {
		    if (data.entry.length > 0) {
		      view.isEntryBlank = false;
		      return data.entry.join(''); 
		    } else if (data.entry.length === 0 && data.entries[0]) {
		      view.isEntryBlank = true;
		      return data.entries[0];
		    } else {
		      view.isEntryBlank = true;
		      return 0;
		    }
		  },
		  getCurrentOperator: function () {
		    // return operator only when screen entry is blank
		    if (data.currOperator && data.entries.length >= 1 && data.entry.length < 1) {
		      return data.currOperator;
		    } 
		  }
		}

var view = {
		  render: function () {
		    // render current total
		    var screenText = view.sciNotationFormat(controller.getScreenVal());
		    $('#screen').text(screenText);
		    view.highlightOperator();
		    
		    
		    // switch between AC and C if entry on screen / dim backspace when no entry
		    if (view.isEntryBlank) {
		      $('#clear').text('AC');
		      $('#back').addClass('dimmed');
		    } else {
		      $('#clear').text('C');
		      $('#back').removeClass('dimmed');
		    }
		  },
		  // highlight current operator (+, -, *, /)
		  highlightOperator: function (target) {
		    var op = controller.getCurrentOperator();
		    $('.darker').removeClass('active');
		    if (op === '+') {
		      $('#add').addClass('active');
		    } else if (op === '-') {
		      $('#subtract').addClass('active');
		    } else if (op === '*') {
		      $('#multiply').addClass('active');
		    } else if (op === '/') {
		      $('#divide').addClass('active');
		    }
		  },
		  isEntryBlank: true,
		  sciNotationFormat: function (num) {

		    if (typeof num === 'string') {
		      var numLength = num.length;
		      num = parseInt(num);
		    } else if (typeof num === 'number') {
		      var numLength = num.toString().length;
		    }
		    
		    if (numLength >= 8) {
		      return num.toExponential(2);
		    } else {
		      return num;
		    }   
		  }
		}


	$(document).ready(function() {
		controller.init();
		
		$(document).on("click",".bookmark_btn", function(){
			var id_index = $(this).attr('id').replace("bookmark_btn", "");
 			//alert("눌림");
			
			if(clickDate == undefined){
				clickDate = boardWriteDate;
			}

			$.ajax({
				url : 'addBookMarkAtMoneybook.do',
				data : "id_index="+${param.id_index}+
				"&category="+$('#category_val'+id_index).val()+
				"&detail="+$('#detail_val'+id_index).val()+
				"&price="+$('#price_val'+id_index).val()+
				"&date="+clickDate,
				dataType : 'json',
				type: 'post',
				success : function(data){
					alert(data.msg);
					location.reload();
				},
				error : function(data) {
					alert('에러');
					alert(data.msg);
				}
			}); 
		})
		
		
		$(document).on('click', '.detailOne', function() {
			$("#datepicker").datepicker();
			$("#datepicker").datepicker("option", "dateFormat", "yy-mm-dd");
			
			$.ajax({
				type : 'post',
				url : 'moneyBookUpdateForm.do',
				dataType : 'json',
				data : 'id_index=${id_index}'
						+ "&date=" + $(this).attr('name')
						+ "&moneyBookNo=" + $(this).attr('id'),
				success : function(data) {
					$("#datepicker").datepicker("setDate", data.mbDate);
					$('#category').val(data.moneyBook.category);
					$('#edt_detail').val(data.moneyBook.detail);
					$('#edt_price').val(data.moneyBook.price);
					
					$('#btn_delete').click(function() {
						$.ajax({
							type : 'post',
							url : 'moneyBookDelete.do',
							dataType : 'json',
							data : 'id_index=${id_index}&moneyBookNo='
									+ data.moneyBook.moneyBookNo,
							success : function(data) {
								alert(data.msg);
								if (data.result) {
									location.reload();
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
									+ '&moneyBookNo=' + data.moneyBook.moneyBookNo
									+ '&category=' + $('#category').val()
									+ '&detail=' + $('#edt_detail').val()
									+ '&price=' + $('#edt_price').val()
									+ '&date=' + $('#datepicker').val(),
							success : function(data) {
								alert(data.msg);
								if (data.result) {
									location.reload();
								} else {
									//창 냅두기
								}
							},
							error : function() {
								alert('error');
							}
						});
					});
					
				},
				error : function() {
					alert("모달에러");
				}

			});
		});
	if('${param.succ}' == "sucess"){
			window.close();
			opener.parent.location.reload();
			//location.reload();
	} 
		
		$('#detailTable thead').hide();
		var today = new Date();
		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month'
			},
 			defaultDate : today,
			navLinks : false, // can click day/week names to navigate views
			weekNumberCalculation : 'ISO',
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			events : function(start, end, timezone, callback) {
				var nowDate = $('#calendar').fullCalendar('getDate');
				boardWriteDate = nowDate.format('YYYY-MM-DD');
				
				$.ajax({
					type : 'post',
					url : 'moneyBookView.do',
					dataType : 'json',
					data : 'id_index=' + ${id_index} + '&date=' + nowDate.format('YYYY-MM-DD'),
					success : function(data) {
						var events = [];
						for (var i = 0; i < data.lastDay; i++) {
							if (data.income[i].title != 0) {
								events.push({
									/* 수입 */
									title : data.income[i].title,
									start : data.income[i].start,
									textColor : "#1ABC9C"
								});
							} else {
								events.push({
									/* 수입 */
									title : "",
									start : data.income[i].start,
									textColor : "#FFFFFF"
								});
							}
							
							if (data.expense[i].title != 0) {
								events.push({
									/* 지출 */
									title : data.expense[i].title,
									start : data.expense[i].start,
									textColor : "#FA8072"
								});
							}
						}
						callback(events);
						
						$('#monthIncome').text(data.monthIncome);
						$('#monthExpense').text(data.monthExpense);
					}
				});
			},
			dayClick: function(date, jsEvent, view) {
				$('#detailTable tbody').empty();
				var current = $('#calendar').fullCalendar('getDate');
				var now = dateToYYYYMMDD(today);
				clickDate = date.format();
				
				if (date.format().substring(0, 7) == current.format('YYYY-MM-DD').substring(0,7)) {
					$('.fc-day').css('background-color', '#ffffff');
					if (date.format() == now) {
						$(this).css('background-color', '#91D4B5');
						$(this).css('opacity', '0');
						$('.fc-today').css('background-color', '#91D4B5');
						$('.fc-today').css('opacity', '0.4');
					} else {
						$('.fc-today').css('background-color', '#DCDCDC');
						$('.fc-today').css('opacity', '1');
						$(this).css('background-color', '#91D4B5');
						$(this).css('opacity', '0.4');
					}
						
						$.ajax({
							type : 'post',
							url : 'moneyBookDetailView.do',
							dataType : 'json',
							data : 'id_index=' + ${id_index} + '&date=' + date.format(),
							success : function(data) {
								if (data.length == 0) {
									$('#detailTable thead').hide();
									var img = "<center><br><h5>아직 등록된 데이터가 없습니다!</h5>"
												+"<img src='assets/img/ryan_broken.gif'"+
												"style='width='200px'; height='200px''></center>";
									$('#detailTable tbody').append(img);
								} else {
									$('#detailTable thead').show();
									$(data).each(function(i) {
										var td = "<tr"
												+ " class='detailOne' "
												+ " id='" + data[i].moneyBookNo + "'"
												+ " name='" + date.format() + "'"
												+ "data-target='#layerpop' data-toggle='modal'>"
												+ "<td>" + convertCategory(data[i].category) + "</td>"
												+ "<td>" + data[i].detail + "</td>"
												+ "<td>" + data[i].price + "</td>"
												+ "</tr>"
										$('#detailTable').append(td);
									})
								}
								
							},
							error : function() {
								alert('error');
							}
						});
				} else {
					
				}

		    }
		});
		
		$(document).on('click', '#boardWriteBtn', function() {
			location.href = "boardWriteForm.do?id_index=" + ${id_index} + "&date=" + boardWriteDate;
		});
		
		// 왼쪽 버튼을 클릭하였을 경우
        $("button.fc-prev-button").click(function() {
        	$('#detailTable thead').hide();
        	$('#detailTable tbody').empty();
        });

        // 오른쪽 버튼을 클릭하였을 경우
       	$("button.fc-next-button").click(function() {
       		$('#detailTable thead').hide();
       		$('#detailTable tbody').empty();
        });

	});
	
</script>
</head>
<body>
	<div id="left">
		<center>
			<table>
				<tr>
					<td align="center"><h3>Total</h3></td>
				</tr>

				<tr>
					<td>Income : <span id="monthIncome">${monthAmount.income }</span></td>
				</tr>

				<tr>
					<td>Expense : <span id="monthExpense">${monthAmount.expense }</span></td>
				</tr>
			</table>
			<button class="btn moneyBookBtn"
				onclick="bookmarkRegist(${param.id_index})">즐겨찾기 등록</button>


			<div id="bookmark_list_div">
				<h4>
					<span style="font-family: NanumBarunpenR; font-weight: bold;">
						<i class="fa fa-bookmark" aria-hidden="true"></i> 즐겨찾기 목록
					</span>
				</h4>
				<c:forEach var="bm" items="${bookMarkList}" varStatus="status">
					<c:if test="${bm.category=='food'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #ADD8E6;"> <i class="fa fa-cutlery"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='education'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #DDA0DD;"> <i class="fa fa-book"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='medical'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #708090;"> <i class="fa fa-medkit"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='traffic'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #FF6347;"> <i class="fa fa-bus"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='commodity'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #FFA500;"> <i
								class="fa fa-shopping-cart" aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='beauty'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #F08080;"> <i class="fa fa-bath"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='phonefees'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #1E90FF;"> <i class="fa fa-mobile"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='saving'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #DAA520;"> <i class="fa fa-database"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='utilitybills'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #6A5ACD;"> <i class="fa fa-plug"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='culturallife'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #3CB371;"> <i class="fa fa-film"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category == 'otheritems'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #FA8072;"> <i
								class="fa fa-minus-circle" aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>

					<c:if test="${bm.category=='income'}">
						<button class="bookmark_btn" id="bookmark_btn${status.index}">
							<span style="color: #9ACD32;"> <i class="fa fa-krw"
								aria-hidden="true"></i>
							</span> ${bm.detail}
						</button>
					</c:if>
					<input type="hidden" value="${bm.price}"
						id="price_val${status.index}">

					<input type="hidden" value="${bm.category}"
						id="category_val${status.index}">

					<input type="hidden" value="${bm.detail}"
						id="detail_val${status.index}">

					<c:if test="${status.index==1 or status.index==3}">
						<br>

					</c:if>
				</c:forEach>
			</div>
		</center>

	</div>

	<div id="center">
		<table>
			<tr>
				<td><div id="calendar"></div>
				<td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td>
					<div id="detail">
						<table class="table" id="detailTable">
							<thead>
								<tr>
									<th>Category</th>
									<th>Detail</th>
									<th>Price</th>
								</tr>
							</thead>
							<tbody class="detailBody">
							</tbody>
						</table>
					</div>
				</td>
			</tr>
		</table>
	</div>

	<div id="right">
		<button class="btn moneyBookBtn"
			onclick="moneyBookRegist(${param.id_index})">등록</button>
		<button class="btn moneyBookBtn" id="boardWriteBtn">공유</button>

		<div id="calculator">
			<div class="clearfix" id="wrapper">
				<main>
				<div id="screen"></div>
				<div class="cal_row">
					<button class="darker ion-backspace" id="back"></button>
					<button class="darker" id="clear">AC</button>
					<button class="darker">+/-</button>
					<button class="darker" id="divide">&divide;</button>
				</div>
				<div class="cal_row">
					<button>7</button>
					<button>8</button>
					<button>9</button>
					<button class="darker" id="multiply">&#215;</button>
				</div>
				<div class="cal_row">
					<button>4</button>
					<button>5</button>
					<button>6</button>
					<button class="darker" id="add">+</button>
				</div>
				<div class="cal_row">
					<button>1</button>
					<button>2</button>
					<button>3</button>
					<button class="darker" id="subtract">-</button>
				</div>
				<div class="cal_row">
					<button class="btn-wide">0</button>
					<button>.</button>
					<button class="blue">=</button>
				</div>
				</main>
			</div>
		</div>
	</div>

	<div class="modal fade" id="layerpop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="borderLine">
					<!-- header -->
					<!-- <div class="modal-header">
					닫기(x) 버튼
					<button type="button" class="close" data-dismiss="modal">×</button>
					header title
					<h4 class="modal-title"> </h4>
				</div> -->
					<!-- body -->
					<div class="modal-body">
						<div>
							<label class="control-label" for="datepicker">Date</label>
							<div>
								<input class="form-control" type="text" id="datepicker">
							</div>
						</div>

						<!-- Select Basic -->
						<div>
							<label class="control-label" for="category">Category</label>
							<div>
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

						<div>
							<label class="control-label" for="edt_detail">Detail</label>
							<div>
								<input name="edt_detail" class="form-control input-md"
									id="edt_detail" type="text">
							</div>
						</div>

						<div>
							<label class="control-label" for="edt_price">Price</label>
							<div>
								<input name="edt_price" class="form-control input-md"
									id="edt_price" type="text">
							</div>
						</div>
					</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button name="update" class="modal_btn btn" id="btn_update">수정</button>
						<button name="delete" class="modal_btn btn" id="btn_delete">삭제</button>
						<button name="cancel" class="modal_btn btn" id="btn_cancel"
							data-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>