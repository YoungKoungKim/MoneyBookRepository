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
                autoOpen:false, //�ڵ����� �������ʰ�
                position:[100,200], //x,y  ���� ����
                //"center", "left", "right", "top", "bottom"
                modal:true, //��޴�ȭ����
                resizable:true, //ũ�� ���� ���ϰ�
                width: "1000",
                 buttons:{
                    "Ȯ��":function(){
                        $(this).dialog("close");
                    },"���":function(){
                        $(this).dialog("close");
                    }
                } 
            });

            //â ���� ��ư�� Ŭ���������
            $("#btn").on("click",function(){
            	  // $("#dialog").dialog("open"); //���̾�α�â ����              
            	$("#dialog").load("bookmarkRegistForm.do?id_index="+${param.id_index}).dialog("open");
         
                //$("#dialog").load("bookmarkRegistForm.do?id_index="+${param.id_index}).dialog({modal:true});

            });
            
            $("#cancle_btn").on("click",function(){
                $("#dialog").dialog("close"); //���̾�α�â �ݱ� 
            });
            
            
        });
    </script>

</head>
<body>
<input type="button" id="btn" value="â ����"/>
<div id="dialog" title="���ã�� �߰��ϱ�">
    	    
</div>
</body>
</html>
