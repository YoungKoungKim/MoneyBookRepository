<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css">
    <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
    <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

        
    <script>    
        //$(document.ready(function(){ .. });

        $(function(){
            //$("#dialog").dialog();
            $("#dialog").dialog({
                autoOpen:false, //자동으로 열리지않게
                position:[100,200], //x,y  값을 지정
                //"center", "left", "right", "top", "bottom"
                modal:true, //모달대화상자
                resizable:true, //크기 조절 못하게
                width: "1000",
                 buttons:{
                    "확인":function(){
                        $(this).dialog("close");
                    },"취소":function(){
                        $(this).dialog("close");
                    }
                } 
            });

            //창 열기 버튼을 클릭했을경우
            $("#btn").on("click",function(){
            	  // $("#dialog").dialog("open"); //다이얼로그창 오픈              
            	$("#dialog").load("bookmarkRegistForm.do?id_index="+${param.id_index}).dialog("open");
         
                //$("#dialog").load("bookmarkRegistForm.do?id_index="+${param.id_index}).dialog({modal:true});

            });
            
            $("#cancle_btn").on("click",function(){
                $("#dialog").dialog("close"); //다이얼로그창 닫기 
            });
            
            
        });
    </script>

</head>
<body>
<input type="button" id="btn" value="창 열기"/>
<div id="dialog" title="즐겨찾기 추가하기">
    	    
</div>
</body>
</html>
