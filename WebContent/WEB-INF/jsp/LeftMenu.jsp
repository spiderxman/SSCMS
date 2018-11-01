<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>メイン画面</title>
<jsp:include page="./res/meta.jsp"/>
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
       	<div class="panel-group" id="accordion">
       		<div class="panel panel-default">
        		<div class="panel-heading">
        			<h4 class="panel-title">
        				<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">勤怠入力</a>
        			</h4>
        		</div>
        		<div id="collapse1" class="panel-collapse collapse in">
        			<div class="panel-body">
        				<a href="javascript:void(0);">勤怠記入</a><br>
            			<a href="javascript:void(0);">勤怠照会</a><br>
            			<a href="javascript:void(0);">個人設定</a>
        			</div>
        		</div>
        	</div>
        	<c:if test="${sessionScope.empInfo.authority == 0}">
        		<div class="panel panel-default">
        			<div class="panel-heading">
        				<h4 class="panel-title">
        					<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">社員管理</a>
        				</h4>
        			</div>
        			<div id="collapse2" class="panel-collapse collapse in">
        				<div class="panel-body">
        					<a href="<%=request.getContextPath() %>/EmpBaseAddInit" target="iframeContent" style="color:#333;">社員登録</a><br>
                			<a href="<%=request.getContextPath() %>/EmpInfoSearchInit" target="iframeContent" style="color:#333;">社員照会</a>
        				</div>
        			</div>
        		</div>
        		<div class="panel panel-default">
        			<div class="panel-heading">
        				<h4 class="panel-title">
        					<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">各種設定</a>
        				</h4>
        			</div>
        			<div id="collapse3" class="panel-collapse collapse in">
        				<div class="panel-body">
        					<a href="javascript:void(0);" target="iframeContent">お知らせ設定</a><br>
            	    		<a href="javascript:void(0);" target="iframeContent">システム設定</a>
        				</div>
        			</div>
        		</div>
        	</c:if>
			<c:if test="${sessionScope.empInfo.authority == 0 || sessionScope.empInfo.authority == 1}">
				<div class="panel panel-default">
        			<div class="panel-heading">
        				<h4 class="panel-title">
        					<a data-toggle="collapse" data-parent="#accordion" href="#collapse4">勤怠管理</a>
        				</h4>
        			</div>
        			<div id="collapse4" class="panel-collapse collapse in">
        				<div class="panel-body">
        					<a href="javascript:void(0);" target="iframeContent">勤怠承認</a><br>
        					<a href="javascript:void(0);" target="iframeContent">勤怠決算</a>
        				</div>
        			</div>
        		</div>
        	</c:if>
        </div>
        <ul>
            <li >
            	<a href="javascript:void(0);" onclick="logout();">ログアウト</a>
            </li>
        </ul>
	</div>
</form>
</body>
</html>