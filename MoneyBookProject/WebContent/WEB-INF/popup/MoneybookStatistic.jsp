<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>통계</title>
<style type="text/css">
.arc text {
	font-family: arial;
	font-size: 2em;
	fill: #fff;
}
</style>
</head>
<body>

	<script src="//d3js.org/d3.v3.min.js"></script>

	<script>
		/* alert(${monthAmount.income}); */
		var list= [];
		
/* 		${list.category};
 		for(var i in list){
 			alert(i);
		} */ 
		
		//alert('${list[0].category}');
		
		for(var i =0;i < ${list.size()}; i++ ){
			list[i] = ${list[i].category};
			alert(list[i]);
			
		} 
		
		var data = [117500, 99000, 44960, 37570, 31840, 20000 ] ,
			r = 200;
	
		//그림을 그릴 컨버스 추가
		var canvas = d3.select("#content").append("svg")
			.attr("width", 500)
			.attr("height", 500);
	
		//그룹 태그를 만들고 캔버스에서 상단과 좌측으로부터 각 300씩 이동
		var group = canvas.append("g")
			.attr("transform", "translate(300, 300)");
	
		var color = d3.scale.ordinal()
			.range([ "#f11", "#f99", "#ddd", "#9cf", "#28f","#FFA500" ]);
	
		//호(arc)의 경로데이터 문자열을 반환하는 arc메서드 선언
		//innerRadius : 안쪽 호의 반지름, outerRadius : 바깥쪽 반지름 수치
		var arc = d3.svg.arc()
			.innerRadius(100)
			.outerRadius(r);
	
		//The pie layout is a convenience for computing the start and end angles are arcs that comprise a pie or donut chart:
		var pie = d3.layout.pie()
			.value(function(d) {
				return d;
			});
	
		//데이터 메서드는 데이터 집합의 각 데이터를 빈 셀렉션에 연결하며
			//DATA개수 만큼 생성하게 됨
			//enter메서드를 이용하여 데이터 추가 가능
	
		var arcs = group.selectAll(".arc")
			.data(pie(data))
			.enter()
			.append("g")
			.attr("class", "arc");
	
		//색상추가
		arcs.append("path")
			.attr("d", arc)
			.attr("fill", function(d) {
				return color(d.data);
			});
	
		//arc에 text 삽입
		arcs.append("text")
			.attr("transform", function(d) {
				return "translate(" + arc.centroid(d) + ")";
			})
			.attr("text-anchor", "middle")
			.attr("text-size", "10px")
			.text(function(d) {
				return (Math.round((parseInt(d.data)/384970)*100))+"%"
			});
	</script>

</body>
</html>