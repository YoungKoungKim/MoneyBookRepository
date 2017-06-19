<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<title>Insert title here</title>
<style type="text/css">

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
	font-size: 2em;
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
</style>
</head>
<script src="//d3js.org/d3.v3.min.js"></script>
<script type="text/javascript">
   $(document).ready(
         function() {
            $.ajax({
               url : 'statistics.do',
               data : "id_index=${param.id_index}" + "&date=${param.date}",
               dataType : 'json',
               type : 'post',
               success : function(data) {
                  var category_list = [];
                  var price_list = [];
                  var percent_list = [];
                  
                  for ( var i in data.list) {
                     if(data.list[i].category != 'income'){
                        price_list.push(data.list[i].price);
                        category_list.push(data.list[i].category);
                        percent_list.push(data.list[i].percent);
                     }
                  }
                  
             datasetTotal = []; 
     
              for (var i in data.list) {
            	  if(data.list[i].percent != 0){
            		  datasetTotal.push({label : category_list[i] , value :price_list[i],
                  		percent : percent_list[i]});
            	  }
                }   

              var color = [];
                  for ( var i in category_list) {
                     if (category_list[i] == 'food') {
                        color.push("#ADD8E6");
                     } else if (category_list[i] == 'medical') {
                        color.push("#708090");
                     } else if (category_list[i] == 'traffic') {
                        color.push("#FF6347");
                     } else if (category_list[i] == 'commodity') {
                        color.push("#FFA500");
                     } else if (category_list[i] == 'beauty') {
                        color.push("#F08080");
                     } else if (category_list[i] == 'education') {
                        color.push("#DDA0DD");
                     } else if (category_list[i] == 'phonefees') {
                        color.push("#1E90FF");
                     } else if (category_list[i] == 'saving') {
                        color.push("#DAA520");
                     } else if (category_list[i] == 'utilitybills') {
                        color.push("#6A5ACD");
                     } else if (category_list[i] == 'culturallife') {
                        color.push("#3CB371");
                     } else if (category_list[i] == 'otheritems') {
                        color.push("#FA8072");
                     }  else if (category_list[i] == 'income') {
                        color.push("#9ACD32");
                     } 
                  } 
                  
                  var svg = d3.select("#content")
                  .append("svg")
                  .append("g")

                  svg.append("g")
                     .attr("class", "slices");
                  svg.append("g")
                     .attr("class", "labelName");
                  svg.append("g")
                     .attr("class", "lines");

                   var width = 960,
                      height = 450,
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
            div.html((d.data.label)+"<br>"+(d.data.percent)+"%");
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
                              return (d.data.label+": "+d.value+"원");
                          });

                      function midAngle(d){
                          return d.startAngle + (d.endAngle - d.startAngle)/2;
                      }

                  text
                          .transition().duration(1000)
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
                              return (d.data.label+": "+d.value+"원");
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

               },
               error : function() {
                  alert('error 남');
               }
            });

         });
</script>
<body>

</body>
</html>