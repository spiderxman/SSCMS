﻿<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>メイン画面</title>
<jsp:include page="./res/meta.jsp"/>

<SCRIPT language=javascript type=text/javascript>
</SCRIPT>
</head>
<body>
<div style="background-color: #0814B1; position:fixed; top:0px;left:0px;text-align: left; width: 100%; height:50px">
  <div style="float:left"><font style="font-size:32;color:#FFFFFF">SSCMS</font></div>
  <div style="float:right">
		<font style="font-size:14;color:#FFFFFF">社員ID：${sessionScope.empInfo.empId}</font>
    </div>
</div>
</body>
</html>