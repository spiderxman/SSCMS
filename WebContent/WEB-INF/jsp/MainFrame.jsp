<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>メイン画面</title>
<style>
	body{margin:0; padding:0; overflow-x:hidden; overflow-y:hidden; }
	#iframeTop{
		width:100%;
		height:10%;
	}
	#iframeLeft{
		width:13%;
		height:99%;
		float:left;
	}
	#iframeContent{
		width:86%;
		height:95%;
	}
</style>
<script language=javascript type=text/javascript>
    function changeFrameHeight(){
        var ifm= document.getElementById("iframeContent"); 
        ifm.height=document.documentElement.clientHeight;

    }

    window.onresize=function(){  
         changeFrameHeight();  

    } 

</script>
</head>
<body>
<%-- <frameset rows="80,*" frameborder="0">
  <frame id="topid" src="<%=request.getContextPath() %>/TopBar" name="top" noresize scrolling="no"/>
  <frameset cols="200,*" frameborder="0">
    <frame id="left" src="<%=request.getContextPath() %>/LeftMenu" name="left" noresize scrolling="yes" style="border:medium double #000000"/>
    <frame src="" name="main_page" noresize frameborder="1" scrolling="yes">
  </frameset>
</frameset> --%>
  <div>
    <iframe id="iframeTop" name="iframeTop" src="<%=request.getContextPath() %>/TopBar" scrolling="no"></iframe>
    <iframe id="iframeLeft" name="iframeLeft" src="<%=request.getContextPath() %>/LeftMenu" scrolling="yes" style="border:medium double #000000"></iframe>
    <iframe id="iframeContent" name="iframeContent" src="<%=request.getContextPath() %>/Main" frameborder="1" scrolling="yes" onload="changeFrameHeight()" ></iframe>
  </div>
</body>
</html>