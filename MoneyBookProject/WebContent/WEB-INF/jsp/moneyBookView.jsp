<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>가계부</title>
<link href="./fullcalendar-3.3.1/fullcalendar.css" rel="stylesheet" />
<link href="./fullcalendar-3.3.1/fullcalendar.print.css"
	rel="stylesheet" media="print" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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

html, body {
	font-size: 14px;
	height: auto;
}

#left {
	font-family: 'Ubuntu Condensed', sans-serif;
	position: absolute;
	margin-top: 50px;
	left: 0;
	width: 20%;
}

#center {
	display: inline-block;
	font-family: 'Ubuntu Condensed', sans-serif;
	margin-left: 18%;
	left: 20%;
	right: 20%;
	width: 60%;
	height: 100%;
	font-family: 'Ubuntu Condensed', sans-serif;
}

#right {
	position: absolute;
	margin-top: 90px;
	width: 20%;
	left: 80%;
	right: 5%;
	top: 70px
}

#calendar {
	padding-top: 50px;
	max-width: 700px;
}

#detail {
	box-sizing: border-box;
	border-collapse: collapse;
	border-spacing: 0;
	font-size: 1.1em;
	/*    margin-left: #calendar.margin;
=======
   box-sizing: border-box;
   border-collapse: collapse;
   border-spacing: 0;
   font-size: 1.1em;
   /*    margin-left: #calendar.margin;
>>>>>>> branch 'master' of https://github.com/YoungKoungKim/MoneyBookRepository.git
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
	border: 1px solid #1abc9c;
	border-radius: 2px;
	width: 70pt;
	height: 30pt;
	text-align: center;
	padding-left: 10px;
	padding-right: 10px;
	margin-bottom: 5px;
	color: black;
}

svg {
	width: 100%;
	height: 500px;
}

path.slice {
	stroke-width: 2px;
}

polyline {
	opacity: .3;
	stroke: black;
	stroke-width: 2px;
	fill: none;
}

text {
	font: 12px sans-serif;
}

.arc text {
	font-family: arial;
	/* font-size: 2em; */
	fill: #fff;
}

.toolTip {
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    position: absolute;
    display: none;
    width: auto;
    height: auto;
    background: none repeat scroll 0 0 white;
    border: 0 none;
    border-radius: 8px 8px 8px 8px;
    box-shadow: -3px 3px 15px #888888;
    color: black;
    font: 12px sans-serif;
    padding: 5px;
    text-align: center;
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
	margin: 0;
	padding: 0;
	font-family: 'Arimo', sans-serif;
	opacity: 0.85;
}

#calculator, #calculator:before, #calculator:after {
	-webkit-box-sizing: inherit;
	-moz-box-sizing: inherit;
	box-sizing: inherit;
}

#wrapper {
	background: #1f1f1f;
	width: 196px;
	padding: 0 6px 6px;
	border: 1px solid #141414;
	border-radius: 5px;
}

main {
	padding: 0;
	width: 180px;
	margin: auto;
	background: #141212;
}

#screen {
	width: 180px;
	background: white;
	margin: 7px 0 2px 0;
	padding: 5px 5px;
	border-radius: 4px;
	font-size: 2em;
	text-align: right;
}

#calculator button {
	color: #AAA;
	float: left;
	width: 45px;
	font-size: 1.2em;
	height: 45px;
	outline: none;
	background: #3e3e3e;
	border: 1px solid #1f1f1f;
	border-radius: 3px;
}

#calculator button:hover {
	background: #52615A;
}

#calculator button.blue {
	background: #1ABC9C;
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
	height: 45px !important;
	width: 90px !important;
}

.price {
	color: #FF6753;
}
</style>
<script src="//d3js.org/d3.v3.min.js"></script>
<script type="text/javascript">
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

//통계 메소드
function statistic(data){
	  var category_list = [];
      var price_list = [];
      var percent_list = [];
      
      for ( var i in data) {
         if(data[i].category != 'income'){
            price_list.push(data[i].price);
            category_list.push(data[i].category);
            percent_list.push(data[i].percent);
         }
      }
  var color = [];
      for ( var i in category_list) {
         if (category_list[i] == 'food') {
         	category_list[i] = '식비';
            	color.push("#ADD8E6");
         } else if (category_list[i] == 'medical') {
         	category_list[i] = '의료';
            	color.push("#708090");
         } else if (category_list[i] == 'traffic') {
         	category_list[i] = '교통비';
            color.push("#FF6347");
         } else if (category_list[i] == 'commodity') {
         	category_list[i] = '생필품';
            color.push("#FFA500");
         } else if (category_list[i] == 'beauty') {
            category_list[i] = '미용';
            color.push("#F08080");
         } else if (category_list[i] == 'education') {
         	category_list[i] = '교육';
            	color.push("#DDA0DD");
         } else if (category_list[i] == 'phonefees') {
         	category_list[i] = '통신비';
            	color.push("#1E90FF");
         } else if (category_list[i] == 'saving') {
         	category_list[i] = '저축';	
            	color.push("#DAA520");
         } else if (category_list[i] == 'utilitybills') {
         	category_list[i] = '공과금';
         	color.push("#6A5ACD");
         } else if (category_list[i] == 'culturallife') {
         	category_list[i] = '문화생활비';
            	color.push("#3CB371");
         } else if (category_list[i] == 'otheritems') {
         	category_list[i] = '기타';
            	color.push("#FA8072");
         }  
      } 
      datasetTotal = []; 
       for (var i in data) {
     	  if(data[i].percent != 0){
     		  
     		  datasetTotal.push({label : category_list[i] , value :price_list[i],
           		percent : percent_list[i]});
     	  }
         }   
      
      var svg = d3.select("#statistic_div")
      .append("svg")
      .append("g")

      svg.append("g")
         .attr("class", "slices");
      svg.append("g")
         .attr("class", "labelName");
      svg.append("g")
         .attr("class", "lines");

       var width = 250,
          height = 150,
         radius = Math.min(width, height) / 2; 

      var pie = d3.layout.pie()
         .sort(null)
         .value(function(d) {
            return d.value;
         });

      var arc = d3.svg.arc()
         .outerRadius(radius * 0.8)
         .innerRadius(radius * 0.4);

      var outerArc = d3.svg.arc()
         .innerRadius(radius * 0.9)
         .outerRadius(radius * 0.9);
      
      var div = d3.select("body").append("div").attr("class", "toolTip");

      svg.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

      var color = d3.scale.ordinal().range(color);


	     change(datasetTotal, percent_list);
	     
      function change(data, percent_list) {
    	  
    	  /* ------- 퍼센트 추가 -------*/
          
			var arcs = svg.selectAll(".arc")
			.data(pie(data))
			.enter()
			.append("g")
			.attr("class", "arc"); 
            
			//arc에 text 삽입
		 		arcs.append("text")
				.attr("transform", function(d) {
					return "translate(" + arc.centroid(d) + ")";
				})
				.attr("text-anchor", "middle")
				.attr("text-size", "5px")
				.text(function(d) {
					return d.data.percent+"%";
				});   

         /* ------- PIE SLICES -------*/
         var slice = svg.select(".slices").append("g").selectAll("path.slice")
              .data(pie(data), function(d){ return d.data.label});

          slice.enter()
              .insert("path")
              .style("fill", function(d) { return color(d.data.label); })
              .attr("class", "slice");

          slice
              .transition().duration(1000)
              .attrTween("d", function(d) {
                  this._current = this._current || d;
                  var interpolate = d3.interpolate(this._current, d);
                  this._current = interpolate(0);
                  return function(t) {
                      return arc(interpolate(t));
                  };
              })
              
           slice
	 			.on("mousemove", function(d){
 			div.style("left", d3.event.pageX+10+"px");
 			div.style("top", d3.event.pageY-25+"px");
 			div.style("display", "inline-block");
 			div.html((d.data.label)+"<br>"+addComma(d.data.value)+"원");
				});
			slice
				.on("mouseout", function(d){
 			div.style("display", "none");
				});

          slice.exit()
              .remove();
      	

          /* ------- TEXT LABELS -------*/

          var text = svg.select(".labelName").selectAll("text")
              .data(pie(data), function(d){ return d.data.label });

          text.enter()
              .append("text")
              .attr("dy", ".35em")
              .text(function(d) {
                  return (d.data.label);
              });

          function midAngle(d){
              return d.startAngle + (d.endAngle - d.startAngle)/2;
          }

    
          text.transition().duration(1000)
              .attrTween("transform", function(d) {
                  this._current = this._current || d;
                  var interpolate = d3.interpolate(this._current, d);
                  this._current = interpolate(0);
                  return function(t) {
                      var d2 = interpolate(t);
                      var pos = outerArc.centroid(d2);
                      pos[0] = radius * (midAngle(d2) < Math.PI ? 1 : -1);
                      return "translate("+ pos +")";
                  };
              })
                .styleTween("text-anchor", function(d){
                  this._current = this._current || d;
                  var interpolate = d3.interpolate(this._current, d);
                  this._current = interpolate(0);
                  return function(t) {
                      var d2 = interpolate(t);
                      return midAngle(d2) < Math.PI ? "start":"end";
                  };
              })
            .text(function(d) {
                  return (d.data.label);
              }); 


          text.exit()
              .remove(); 

          /* ------- SLICE TO TEXT POLYLINES -------*/

          var polyline = svg.select(".lines").selectAll("polyline")
              .data(pie(data), function(d){ return d.data.label});

          polyline.enter()
              .append("polyline");

          polyline.transition().duration(1000)
              .attrTween("points", function(d){
                  this._current = this._current || d;
                  var interpolate = d3.interpolate(this._current, d);
                  this._current = interpolate(0);
                  return function(t) {
                      var d2 = interpolate(t);
                      var pos = outerArc.centroid(d2);
                      pos[0] = radius * 0.95 * (midAngle(d2) < Math.PI ? 1 : -1);                     
                      return [arc.centroid(d2), outerArc.centroid(d2), pos];
                  };
              });

          polyline.exit()
              .remove();
      };
}

var boardWriteDate;
var clickDate;
var modifyMoneyBookNo;

function drawCalendar() {
   $('#detailTable thead').hide();
    var today = new Date();
    $('#calendar').fullCalendar({
       header : {
          left : 'today',
          center : 'prevYear,prev title next,nextYear',
          right : 'month'
       },
        defaultDate : today,
       navLinks : false, // can click day/week names to navigate views
       weekNumberCalculation : 'ISO',
       editable : false,
       eventLimit : true, // allow "more" link when too many events
       displayEventTime : false,
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
                         title : addComma(data.income[i].title),
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
                          title : addComma(data.expense[i].title),
                          start : data.expense[i].start+"T23:59:59",
                          textColor : "#FA8072"
                       });
                    }
                }
                callback(events);
                $('#monthIncome').text(addComma(data.monthIncome) +"원");
                $('#monthExpense').text(addComma(data.monthExpense)+"원");
             }
          });
          
          //통계 ajax
          $.ajax({
              url : 'statistics.do',
              data :'id_index=' + ${id_index} + '&date=' + nowDate.format('YYYY-MM-DD'),
              dataType : 'json',
              type : 'post',
              success : function(data) {
            	$('#statistic_div').empty();
	        	statistic(data.list);
              },
              error : function() {
                 alert('통계 에러');
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
                         var img = "<center><br><br>"
                                  +"<img src='jpg/no_data.png'"+
                                  "></center>";
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
                                  + "<td class='price'>" + addComma(data[i].price) + "</td>"
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
}

$('#detail').css('margin', $('calendar').attr('margin'));

jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
    return this;
}

function moneyBookRegist(id_index, date){
   var popUrl = "moneyBookWriteForm.do?id_index=" + id_index + "&date=" + date;   //팝업창에 출력될 페이지 URL
   var popOption = "top=200, left=300, width=600, height=500, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
   window.open(popUrl,"가계부입력",popOption);
}

function bookmarkRegist(id_index){
   var popUrl = "bookmarkRegistForm.do?id_index=" + id_index;   //팝업창에 출력될 페이지 URL
   var popOption = "top=200, left=300, width=600, height=450, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
   window.open(popUrl,"즐겨찾기등록",popOption);
}


function moneyBookStatic(id_index, date){
	   var popUrl = "statistics.do?id_index="+ id_index+"&date=" + date; ;   //팝업창에 출력될 페이지 URL
	   var popOption = "top=200, left=300, width=600, height=450, resizable=no, scrollbars=no, status=no";    //팝업창 옵션(optoin)
	   window.open(popUrl,"가계부 통계",popOption);
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
          var screenText = addComma(view.sciNotationFormat(controller.getScreenVal()));
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
          
          if (numLength >= 11) {
             var cipher = num.toString().split('.');
             if (cipher[1] == undefined) {
                return num.toExponential(4);
             } else if (cipher[1].length > 0) {
                var effectiveNum = cipher[1].substr(0, 2);
                var resultNum = cipher[0] + "." + effectiveNum;
                return resultNum;
             } else {
                return num.toExponential(4);
             }
          } else {
            return num;
          }   
        }
      }

   $(document).ready(function() {
      controller.init();
      drawCalendar();
      
      $(document).on("click",".bookmark_btn", function(){
         var id_index = $(this).attr('id').replace("bookmark_btn", "");
         
         if(clickDate == undefined){
            clickDate = boardWriteDate;
         }

         $.ajax({
            url : 'addBookMarkAtMoneybook.do',
            data : "id_index="+${id_index}+
            "&category="+$('#category_val'+id_index).val()+
            "&detail="+$('#detail_val'+id_index).val()+
            "&price="+$('#price_val'+id_index).val()+
            "&date="+clickDate,
            dataType : 'json',
            type: 'post',
            success : function(data){
          		alert(data.msg);
            	$('#calendar').fullCalendar('gotoDate', '2020-01-01');
              	$('#calendar').fullCalendar('gotoDate', clickDate);
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
               $('#edt_price').val(addComma(data.moneyBook.price));
               modifyMoneyBookNo = data.moneyBook.moneyBookNo;
               
            },
            error : function() {
               alert("모달에러");
            }

         });
      });
      
      $('#btn_delete').click(function() {
         $.ajax({
            type : 'post',
            url : 'moneyBookDelete.do',
            dataType : 'json',
            data : 'id_index=${id_index}&moneyBookNo='
                  + modifyMoneyBookNo,
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
      
      
      $(document).on("keyup","#edt_price",function(){
         var result = addComma($('#edt_price').val());
         $('#edt_price').val(result);

      });
      
      
      $('#btn_update').click(function() {
         var mod_category = $('#category').val();
         var mod_detail = $('#edt_detail').val();
         var mod_price = $('#edt_price').val();
         var date = $('#datepicker').val();
         var dateFormat = /^(19[7-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;

         mod_price = $('#edt_price').val().replace(/,/gi ,""); 
         
         if (mod_detail == "" || mod_price == "") {
            alert('사용 내용을 입력하세요.');
         } else if (!$.isNumeric(mod_price)) {
            alert('가격은 숫자만 입력 가능합니다.');
         }else if(  mod_price <0){
            alert('가격은 정수만 입력 가능합니다.');
         } else if (!dateFormat.test(date)) {
            alert('날짜 형식이 다릅니다.');
         } else {
            
            $.ajax({
               type : 'post',
               url : 'moneyBookUpdate.do',
               dataType : 'json',
               data : 'id_index=${id_index}'
                     + '&moneyBookNo=' + modifyMoneyBookNo
                     + '&category=' + mod_category
                     + '&detail=' + mod_detail
                     + '&price=' + mod_price
                     + '&date=' + date,
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
         }
      });
      
      $(document).on('click', '#boardWriteBtn', function() {
         if ($('#monthIncome').text() != "0" || $('#monthExpense').text() != "0") {
            location.href = "boardWriteForm.do?date=" + boardWriteDate;
         }
      });
      
      $(document).on('click', '#moneyBookWriteBtn', function() {
         moneyBookRegist(${id_index}, clickDate);
      });
      
      $(document).on('click', '#statisticsBtn', function() {
    	  moneyBookStatic(${id_index}, boardWriteDate);
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
			<div id="statistic_div"></div>
		</center>

	</div>

	<div id="center">
		<table align="center">
			<tr>
				<td><div id="calendar"></div></td>
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
		<button class="btn moneyBookBtn" id="moneyBookWriteBtn">등록</button>
		<button class="btn moneyBookBtn" id="boardWriteBtn"
			data-target="#boardWriteFormError" data-toggle="modal">공유</button>

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
									<option disabled="disabled">카테고리 선택</option>
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

	<div class="modal fade" id="boardWriteFormError">
		<div class="modal-dialog">
			<div class="modal-content">
				<div id="borderLine">
					<!-- body -->
					<div class="modal-body">공유할 데이터가 없습니다. 가계부를 등록해주세요!</div>
					<!-- Footer -->
					<div class="modal-footer">
						<button name="cancel" class="modal_btn btn" id="btn_cancel"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>