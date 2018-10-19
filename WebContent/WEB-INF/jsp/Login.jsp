<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="./res/meta.jsp"/>
<title>ログイン</title>
<script language="JavaScript">
function login(){
	if(!inputCheck()){
		return false;
	}
	document.login_form.submit();
}
/*
 function reset(){
	document.login_form.reset();
}
*/
function inputCheck(){
	 var empId = document.getElementById("empId").value;
	 var password = document.getElementById("password").value;
	 if(empId==null||empId==''){
		 document.getElementById("lblErrorMessage").innerHTML = "ユーザ名入力されていない";
		 return false;
	 }
	 if(password==null||password==''){
		 document.getElementById("lblErrorMessage").innerHTML = "パスワード入力されていない";
		 return false;
	 }
	 return true;
}
/*
$("#btnLogin").click(function(){
	login();
});
*/
</script>
</head>
<BODY class=IndexPage>
  <DIV style="POSITION: relative; WIDTH: 100%; BACKGROUND-REPEAT: no-repeat; HEIGHT: 750px; OVERFLOW: auto">
	<form name="login_form" action="Login" method="post" autocomplete="off">
	  <DIV style="POSITION: relative; MARGIN: 200px 0px 0px 480px; WIDTH: 380px; HEIGHT: 200px">
	    <FIELDSET><LEGEND>社員ログイン </LEGEND>
	      <DIV style="WIDTH: 100%; HEIGHT: 50px">
	        <DIV style="POSITION: absolute; MARGIN-TOP: 32px; WIDTH: 120px; FLOAT: left; left: 0px; top: 70px;">
	        	<SPAN style="DISPLAY: inline-block; HEIGHT: 17px" id=lblEmpId class=login-lbl>社員番号</SPAN> </DIV>
	        <DIV style="MARGIN-TOP: 30px; WIDTH: 250px; FLOAT: right">
	          <INPUT id=empId name=empId style="BORDER-BOTTOM: #e4e4e4 1px solid; BORDER-LEFT: #e4e4e4 1px solid; 
	          BACKGROUND-COLOR: #f7f7f7; WIDTH: 179px; BORDER-TOP: #e4e4e4 1px solid; BORDER-RIGHT: #e4e4e4 1px solid" value="system"/>
	        </DIV>
	      </DIV>
	      <DIV style="WIDTH: 100%; HEIGHT: 50px">
	   		<DIV style="POSITION: absolute; MARGIN-TOP: 20px; WIDTH: 120px; FLOAT: left; left: 0px; top: 120px;">
	   		<SPAN style="DISPLAY: inline-block; HEIGHT: 20px" id=lblPassword class=login-lbl>パスワード</SPAN> </DIV>
		        <DIV style="MARGIN-TOP: 15px; WIDTH: 250px; FLOAT: right">
		          <INPUT id=password name=password style="BORDER-BOTTOM: #e4e4e4 1px solid; BORDER-LEFT: #e4e4e4 1px solid; 
		          BACKGROUND-COLOR: #f7f7f7; WIDTH: 179px; BORDER-TOP: #e4e4e4 1px solid; 
		          BORDER-RIGHT: #e4e4e4 1px solid" type=password autocomplete="new-password"/>
		        </DIV>
	      	</DIV>
	      	<br>
	      	<div style="text-align:center">
	      	<SPAN style="COLOR: red" id=lblErrorMessage class=MsgStyle>${message}</SPAN></div>
	      	<DIV style="width:100%; height:50px;text-align:center">
<!-- 		        <DIV style="POSITION: absolute; MARGIN-TOP: 15px; WIDTH: 160px; FLOAT: left">
		        	<A href="javascript:void(0);" id="idsubmit" onclick="submit()">
		        	<img src="Image/login-dl.gif" style="BORDER-RIGHT-WIDTH: 0px; FLOAT: right; 
		        	BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px" /> </A>
		        </DIV>
		        <DIV style="MARGIN-TOP: 15px; WIDTH: 160px; FLOAT: right">
		          <A href="javascript:void(0);" id="idreset" onclick="reset()"><img style="BORDER-RIGHT-WIDTH: 0px; 
		          BORDER-TOP-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px" id=btnCancel name=btnCancel src="Image/login-qx.gif"/></A>
		        </DIV> -->
		        <button id="btnLogin" class="btn mdl-button mdl-js-button mdl-button--raised mdl-js-ripple-effect mdl-button--colored" style="width:65%;height:50px" onclick="return login()">ログイン</button>
	    	</DIV>
	      </FIELDSET>
	    </DIV>
	    <input type="hidden" id="req_gid" name="req_gid" value="loaded"/>
    </form>
  </DIV>
</BODY>
</html>