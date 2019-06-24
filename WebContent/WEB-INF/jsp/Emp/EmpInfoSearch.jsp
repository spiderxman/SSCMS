<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../res/meta.jsp"/>
<title>ユーザ検索</title>
<script language=javascript type=text/javascript>
    function openHelpDoc() {
        window.open('Help/List.htm', 'newwindow', 'width=800,height=700,scrollbars=yes,resizable=yes,location=yes');
        return false;
    }
    
    function openHelpDoc() {
        window.open('Help/List.htm', 'newwindow', 'width=800,height=700,scrollbars=yes,resizable=yes,location=yes');
        return false;
    }
    function empInfoSearchByAjax() {
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            //contentType: "application/json",//post请求的信息格式（添加此句后台取不到request值）
            url: "EmpInfoSearchByAjax" ,//url
            data: $("#empInfoSearchForm").serialize(),
            success: function (result) {
            	setResult(result);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                $("#errorMessage").html("異常:("+XMLHttpRequest.status+")");
            }
        });
    }
    function setResult(resultList){
    	$("#tblEmpInfoList tbody").html("");
    	$("#errorMessage").html("");
    	
    	if(resultList.length == 0){
    		$("#errorMessage").html("対象データなし。");
    		return;
    	}
    	$.each(resultList, function(index, result){
    		var editLink = $("<a></a>").attr("href","EmpInfoDetailInit?empId="+result.empId).append("編集");
    		var edit = $("<td></td>").attr("align","center").append(editLink);
    		var userIdLink = $("<a></a>").attr("href","UserDetail.htm").css("text-decoration","underline").append(result.empId);
    		var empId = $("<td></td>").attr("align","center").append(userIdLink);
    		var empName = $("<td></td>").append(result.empFirstName).append(result.empLastName);
    		var workingStatus = $("<td></td>").append(result.workingStatus);
//    		var delFlagSpan = $("<span></span>").attr("title","削除フラグ");
//    		var delFlagInput = $("<input></input>").attr({"id":"delFlag", "name":"delFlag", "type":"checkbox"});
//    		var delFlag = $("<td></td>").attr("align","center").append(delFlagSpan.append(delFlagInput));
//    		var telNumber = $("<td></td>").append(result.telNumber);
//    		var mailAddress = $("<td></td>").append(result.mailAddress);
//    		var createUser = $("<td></td>").append(result.createUser);
//    		var createDate = $("<td></td>").append(result.createDate);
//    		var updateUser = $("<td></td>").append(result.updateUser);
//    		var updateDate = $("<td></td>").append(result.updateDate);
    		$("<tr></tr>").append(edit)
    		.append(empId)
    		.append(empName)
    		.append(workingStatus)
//    		.append(delFlag)
//    		.append(telNumber)
//    		.append(mailAddress)
//    		.append(createUser)
//   		.append(createDate)
//    		.append(updateUser)
//    		.append(updateDate)
    		.appendTo("#tblEmpInfoList tbody");
    	});
    	
    }
</script>
</head>
<body>
<form id="empInfoSearchForm" style="TEXT-ALIGN: center" method=post action="">
<div style="width: 1158px; HEIGHT: 30px">
    <div style="BACKGROUND-IMAGE: url(./Image/006.jpg); TEXT-ALIGN: left; MARGIN-TOP: 0px; TEXT-INDENT: 20px; WIDTH: 55%; BACKGROUND-REPEAT: no-repeat; FLOAT: left; HEIGHT: 28px"><SPAN
        id=ctl00_lbltitle class=title>ユーザー検索</SPAN>
    </div>
</div>
<div style="TEXT-ALIGN: left; width: 1158px">
<div class=tbTitile><SPAN class=inputlbl>検索条件</SPAN>
</div>
<div class=tbContent>
    <table style="width: 100%" cellSpacing=0 cellPadding=0>
        <tbody>
            <tr>
                <td style="width: 170px"><SPAN class=inputlbl>社員ID</SPAN><BR>
                <input id="empId" class="inputText"
                    name="empId" maxLength=10></td>
                <td style="width: 170px"><SPAN class=inputlbl>社員名称</SPAN><BR>
                <input id="empName" class="inputText"
                    name="empName" maxLength=20></td>
                <td style="width: 170px"><SPAN class="inputlbl">仕事状態</SPAN><BR>
                <SELECT id="workingStatus" class="ddlBlack"
                	name="workingStatus">
                	<OPTION selected value=""></OPTION>
					<c:forEach var="workingStatusCode" items="${workingStatusCodeList}">
						<OPTION value="${workingStatusCode.code}">${workingStatusCode.codeValue}</OPTION>
					</c:forEach>
            	</SELECT></td>
                <td><BR>
                <SPAN style="WIDTH: 133px; DISPLAY: inline-block" class=chkBox>
                <input id=delFlag name=delFlag type=checkbox>
                    <LABEL for=ctl00_mainContent_chkVisible>削除フラグ含む</LABEL></SPAN>
                </td>
                <td>
                	<a class="btn btn-default" href="javascript:void(0);" role="button" onclick="empInfoSearchByAjax();">検索</a>
                </td>
            </TR>
        </tbody>
    </TABLE>
</div>
<div style="TEXT-ALIGN: center; WIDTH: 100%;">
	 ページ情報 
</div>

<!-- ユーザ検索結果一覧AJAXで実現 -->
<div style="HEIGHT: 400px" class=gvContent>
<div id="searchResult">
	<table style="WIDTH: 100%; BORDER-COLLAPSE: collapse"
    id="tblEmpInfoList" border=1 rules=all cellSpacing=0
    cellPadding=0 class="table table-hover">
    <thead>
    	<tr class=gvHeader>
            <th style="WIDTH: 8%" scope=col align="center">操作</th>
            <th style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$ユーザID')">ユーザID</A></th>
            <th style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$ユーザー名')">ユーザー名</A></th>
            <th style="WIDTH: 12%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$権限')">権限</A></th>
            <th style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$削除状態')">削除フラグ</A></th>
            <th style="WIDTH: 10%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$電話番号')">電話番号</A></th>
            <th style="WIDTH: 14%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$メールアドレス')">メールアドレス</A></th>
            <th style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$作成者')">作成者</A></th>
            <th style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$作成日')">作成日</A></th>
            <th style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$更新者')">更新者</A></th>
            <th style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$更新日')">更新日</A></th>
        </TR>
    </thead>
    <tbody>
    </tbody>
    </table>
</div>
</div>
</div>
</form>
<!-- フッター 
<jsp:include page="../Footer.jsp"/>
-->
</BODY>
</HTML>