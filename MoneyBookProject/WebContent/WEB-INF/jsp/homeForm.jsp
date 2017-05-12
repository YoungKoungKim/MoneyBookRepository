<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>홈홈홈홈홈</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<style type="text/css">
.container{
	width: 1500px;
}
#container{
	min-height: 67%;
}
.center {
  font-family: 'Open Sans', sans-serif;
  font-size: 15px;
  line-height: 1.428571429;
  color: #666;
  background-color: #fff;
}
 .center { 
   padding: 60px 0 40px;
 } 
 .center { 
   margin-top: 50px; 
   margin-bottom: 55px;
 } 
 .center a { 
     text-decoration: none; 
     display: inline-block;
 } 
 .center img {
     width: 100%;
 } 
 .center .gig-thumb { 
   width: 350px;  
   height: auto;  
   border: 1px solid #e4e4e4; 
   background: #fff; 
   border-radius: 2px; 
   margin: 0 auto; 
   transition: .3s; 
   -webkit-transition: .3s; 
   -moz-transition: .3s; 
   -o-transition: .3s;
 } 
  .center .gig-thumb .tag {  
     padding: 5px 10px;  
     text-align: center;  
  }  
  .center .gig-thumb .tag h2 {  
    margin: 20px 0 10px; 
    color : #5B6C7F;
    font-size: 15px;
  }
 .center .gig-thumb:hover { 
   border: 1px solid #5B5F61; 
   box-shadow: 0px 0px 15px 5px #847F7F; 
   -webkit-box-shadow:0px 0px 15px 5px #847F7F; 
   -moz-box-shadow:0px 0px 15px 5px #847F7F; 
 }
 
#div1{
	float: left; 
/* 	width: 25%;    */
 	margin-right:10px; 
}
</style>
<script type="text/javascript">
	function today(){
		var date = new Date();
		var dd = date.getDate();
		var mm = date.getMonth()+1; //January is 0!
		var yyyy = date.getFullYear();
		var id_index = parseInt('${id_index}');
		if(dd<10) {
		    dd='0'+dd
		} 
		if(mm<10) {
		    mm='0'+mm
		}
		today = yyyy+'-'+mm+'-'+dd;
		return location.href="viewMyPage.do?id_index="+id_index+"&date="+today;
	}//today()
</script>
</head>
<body>
<div class="container">
	<div class="center">
		<div class="gig-thumb" id="div1">
			<a href="boardList.do"> <img class="" src="homeCss/assets/images/demo/demo1.png" alt="image"></a>
            <a href="boardList.do" class="tag"><h2>Board</h2></a>
        </div>
		<div class="gig-thumb" id="div1">
			<c:if test="${id_index ne null}">
				<a href="JavaScript:today()"><img class="" src="homeCss/assets/images/demo/demo1.png" alt="image"></a>
            	<a href="#" onclick="today();return false;" class="tag"><h2>MoneyBook</h2></a>
			</c:if>
			<c:if test="${id_index eq null}">
				<a data-toggle="modal" data-target="#loginModal" data-backdrop="static" href="#loginForm">
									<img class="" src="homeCss/assets/images/demo/demo1.png" alt="image"></a>
            	<a data-toggle="modal" data-target="#loginModal" data-backdrop="static" href="#loginForm">
            		<h2 style="margin: 20px 0 10px; color : #5B6C7F; font-size: 15px; padding: 5px 10px; text-align: center;">
            		MoneyBook</h2></a>
			</c:if>
        </div>
		<div class="gig-thumb" id="div1">
			<a href="homerecommend.do"> <img class="" src="homeCss/assets/images/demo/demo1.png" alt="image"></a>
            <a href="homerecommend.do" class="tag"><h2>Best</h2></a></div>
		<div class="gig-thumb" id="div1">
			<a href="boardList.do"> <img class="" src="homeCss/assets/images/demo/demo1.png" alt="image"></a>
            <a href="boardList.do" class="tag"><h2>Information 작업해야됨</h2></a></div>
	</div>
</div>
</body>
</html>
