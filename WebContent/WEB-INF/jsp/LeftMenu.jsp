<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>メイン画面</title>
<SCRIPT language=javascript type=text/javascript>
    var timeClient = new Date();

    function openHelpDoc() {
        window.open('Help/List.htm', 'newwindow', 'width=800,height=700,scrollbars=yes,resizable=yes,location=yes');
        return false;
    }
    function logout() {
    	if(!confirm("ログアウトしますか?")){
    		return false;
    	}
    	if (self.parent.frames.length != 0){
    		var form = document.getElementById("leftFrameForm");
    		form.action = "<%=request.getContextPath()%>/Login";
//    		form.logoutFlg.value='1';
    		form.target = "_top";
    		form.submit();
        }
    	return true;
    }

</SCRIPT>
</head>
<body>
<form id="leftFrameForm" action="" method="post" target="main_page">
	<div>
		<SPAN>社員ID：</SPAN>
		<SPAN>${sessionScope.empInfo.empId}</SPAN>
    </div>
	<div>
		<ul>
            <li >
            	<a href="javascript:void(0);">勤怠記入</a>
            </li>
            <li >
            	<a href="javascript:void(0);">勤怠照会</a>
            </li>
            <li >
            	<a href="javascript:void(0);">個人設定</a>
            </li>
        </ul>
        <c:if test="${sessionScope.empInfo.authority == 0}">
            <ul>
                <li >
                	<h3>社員管理</h3>
                </li>
                <li >
                	<a href="<%=request.getContextPath() %>/EmpBaseAddInit" target="iframeContent" style="color:#333;">社員登録</a>
                </li>
                <li >
                	<a href="<%=request.getContextPath() %>/EmpInfoSearchInit" target="iframeContent" style="color:#333;">社員照会</a>
                </li>
            </ul>
            <ul>
                <li >
            	    <h3>各種設定</h3>
                </li>
                <li >
            	    <a href="javascript:void(0);" target="iframeContent">お知らせ設定</a>
                </li>
                <li >
            	    <a href="javascript:void(0);" target="iframeContent">システム設定</a>
                </li>
            </ul>
        </c:if>
        <c:if test="${sessionScope.empInfo.authority == 0 || sessionScope.empInfo.authority == 1}">
            <ul>
                <li >
            	    <h3>勤怠管理</h3>
                </li>
                <li >
            	    <a href="javascript:void(0);" target="iframeContent">勤怠承認</a>
                </li>
                <li >
            	    <a href="javascript:void(0);" target="iframeContent">勤怠決算</a>
                </li>
            </ul>
        </c:if>
        <ul>
            <li >
            	<a href="javascript:void(0);" onclick="logout();">ログアウト</a>
            </li>
        </ul>
	</div>
</form>
</body>
</html>