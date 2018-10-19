<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ユーザ検索</title>
<SCRIPT language=javascript type=text/javascript>
    function openHelpDoc() {
        window.open('Help/List.htm', 'newwindow', 'width=800,height=700,scrollbars=yes,resizable=yes,location=yes');
        return false;
    }
    
    function openHelpDoc() {
        window.open('Help/List.htm', 'newwindow', 'width=800,height=700,scrollbars=yes,resizable=yes,location=yes');
        return false;
    }
    function userSearch(){
    	var form = document.getElementById("userSearchForm");
    	form.submit();
    }
    /*
    function userSearchByAjax() {
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            //contentType: "application/json",//post请求的信息格式（添加此句后台取不到request值）
            url: "UserSearchByAjax" ,//url
            data: $("#userSearchForm").serialize(),
            success: function (data) {
            	var str = '<TABLE style="WIDTH: 100%; BORDER-COLLAPSE: collapse" id=ctl00_mainContent_gvList border=1 rules=all cellSpacing=0 cellPadding=0 class="table table-hover">';
            	str = str + '<TBODY>';
            	str = str + headerStr();
            	for(var i=0;i<data.length;i++){
            		str = str + '<TR onclick="if(window.oldtr!=null){window.oldtr.runtimeStyle.cssText="";}this.runtimeStyle.cssText="background-color:#CCCCFF";window.oldtr=this;">';
            		str = str + '<TD style="WIDTH: 8%" align=center><A id=ctl00_mainContent_gvList_ctl02_lnkEdit href="UserUpdate.htm">編集</A></TD>';
            		str = str + '<TD style="WIDTH: 8%" align=center><A style="TEXT-DECORATION: underline" id=ctl00_mainContent_gvList_ctl02_lnkUserID href="UserDetail.htm">'+data[i].userId+'</A></TD>';
            		str = str + '<TD style="WIDTH: 8%" align=left>'+data[i].userName+'</TD>';
            		str = str + '<TD style="WIDTH: 8%" align=left>'+data[i].authorityCd+'</TD>';
            		str = str + '<TD style="WIDTH: 8%" align=center><SPAN title=削除フラグ disabled><INPUT id=delFlag name=delFlag type=checkbox></SPAN></TD>';
            		str = str + '<TD style="WIDTH: 14%" align=left>'+data[i].telNumber+'</TD>';
            		str = str + '<TD style="WIDTH: 14%" align=left>'+data[i].mailAddress+'</TD>';
            		str = str + '<TD style="WIDTH: 8%" align=left>'+data[i].createUser+'</TD>';
            		str = str + '<TD style="WIDTH: 8%" align=left>'+data[i].createDate+'</TD>';
            		str = str + '<TD style="WIDTH: 8%" align=left>'+data[i].updateUser+'</TD>';
            		str = str + '<TD align=left>'+data[i].updateDate+'</TD>';
            		str = str + '</TR>';
           		}
            	str = str + '</TBODY>';
            	str = str + '</TABLE>';
            	$("#searchResult").html("");
            	$("#searchResult").append(str);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                $("#errorMessage").html("異常:("+XMLHttpRequest.status+")");
            }
        });
    }
    function headerStr(){
    	var str = "";
    	str = str + '        <TR class=gvHeader>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col>操作</TH>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$ユーザID")">ユーザID</A></TH>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$ユーザー名")">ユーザー名</A></TH>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$権限")">権限</A></TH>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$削除状態")">削除フラグ</A></TH>';
    	str = str + '            <TH style="WIDTH: 14%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$電話番号")">電話番号</A></TH>';
    	str = str + '            <TH style="WIDTH: 14%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$メールアドレス")">メールアドレス</A></TH>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$作成者")">作成者</A></TH>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$作成日")">作成日</A></TH>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$更新者")">更新者</A></TH>';
    	str = str + '            <TH style="WIDTH: 8%" scope=col><A href="javascript:__doPostBack("ctl00$mainContent$gvList","Sort$更新日")">更新日</A></TH>';
    	str = str + '        </TR>';
    	return str;
    }
    */
    function userSearchByAjax() {
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            //contentType: "application/json",//post请求的信息格式（添加此句后台取不到request值）
            url: "UserSearchByAjax" ,//url
            data: $("#userSearchForm").serialize(),
            success: function (result) {
            	setResult(result);
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                $("#errorMessage").html("異常:("+XMLHttpRequest.status+")");
            }
        });
    }
    function setResult(resultList){
    	/*
    	for(var i=0;i<resultList.length;i++){
    		var edit = $("<td></td>").append("編集");
    		var userId = $("<td></td>").append(resultList[i].userId);
    		$("<tr></tr>").append(edit)
    		.append(userId)
    		.appendTo("#tblUserList tbody");
    		
    	}
    	*/
    	$("#tblUserList tbody").html("");
    	$("#errorMessage").html("");
    	
    	if(resultList.length == 0){
    		$("#errorMessage").html("対象データなし。");
    		return;
    	}
    	$.each(resultList, function(index, result){
    		var editLink = $("<a></a>").attr("href","UserUpdate.htm").append("編集");
    		var edit = $("<td></td>").attr("align","center").append(editLink);
    		var userIdLink = $("<a></a>").attr("href","UserDetail.htm").css("text-decoration","underline").append(result.userId);
    		var userId = $("<td></td>").attr("align","center").append(userIdLink);
    		var userName = $("<td></td>").append(result.userName);
    		var authorityCd = $("<td></td>").append(result.authorityName);
    		var delFlagSpan = $("<span></span>").attr("title","削除フラグ");
    		var delFlagInput = $("<input></input>").attr({"id":"delFlag", "name":"delFlag", "type":"checkbox"});
    		var delFlag = $("<td></td>").attr("align","center").append(delFlagSpan.append(delFlagInput));
    		var telNumber = $("<td></td>").append(result.telNumber);
    		var mailAddress = $("<td></td>").append(result.mailAddress);
    		var createUser = $("<td></td>").append(result.createUser);
    		var createDate = $("<td></td>").append(result.createDate);
    		var updateUser = $("<td></td>").append(result.updateUser);
    		var updateDate = $("<td></td>").append(result.updateDate);
    		$("<tr></tr>").append(edit)
    		.append(userId)
    		.append(userName)
    		.append(authorityCd)
    		.append(delFlag)
    		.append(telNumber)
    		.append(mailAddress)
    		.append(createUser)
    		.append(createDate)
    		.append(updateUser)
    		.append(updateDate)
    		.appendTo("#tblUserList tbody");
    	});
    	
    }
</SCRIPT>
</head>
<BODY>
<DIV style="WIDTH: 1158px; HEIGHT: 150px">
<jsp:include page="../Header.jsp"/>
</DIV>
<FORM id="userSearchForm" style="TEXT-ALIGN: center" method=post action="">
<DIV style="WIDTH: 1158px; HEIGHT: 30px">
    <DIV style="BACKGROUND-IMAGE: url(./Image/006.jpg); TEXT-ALIGN: left; MARGIN-TOP: 0px; TEXT-INDENT: 20px; WIDTH: 55%; BACKGROUND-REPEAT: no-repeat; FLOAT: left; HEIGHT: 28px"><SPAN
        id=ctl00_lbltitle class=title>ユーザー検索</SPAN>
    </DIV>
</DIV>
<DIV style="TEXT-ALIGN: left; WIDTH: 1158px">
<DIV class=tbTitile><SPAN id=ctl00_mainContent_SearchText
    class=inputlbl>検索条件</SPAN>
</DIV>
<DIV class=tbContent>
    <TABLE style="WIDTH: 100%" cellSpacing=0 cellPadding=0>
        <TBODY>
            <TR>
                <TD style="WIDTH: 170px"><SPAN id=ctl00_mainContent_lblUserCode
                    class=inputlbl>ユーザーID</SPAN><BR>
                <INPUT id=userId class=inputText
                    name="userId" maxLength=10></TD>
                <TD style="WIDTH: 170px"><SPAN id=ctl00_mainContent_lblUserName
                    class=inputlbl>ユーザー名</SPAN><BR>
                <INPUT id=userName class=inputText
                    name="userName" maxLength=20></TD>
                <TD style="WIDTH: 170px"><SPAN id=ctl00_mainContent_lblAcessGrp
                    class=inputlbl>権限</SPAN><BR>
                <SELECT id="authorityCd" class=ddlBlack
                	name="authorityCd">
                	<OPTION selected value=""></OPTION>
					<c:forEach var="authInfo" items="${mstAuthorityList}">
						<OPTION value="${authInfo.authorityCd}">${authInfo.authorityName}</OPTION>
					</c:forEach>
            	</SELECT></TD>
                <TD><BR>
                <SPAN style="WIDTH: 133px; DISPLAY: inline-block" class=chkBox>
                <INPUT id=delFlag name=delFlag type=checkbox>
                    <LABEL for=ctl00_mainContent_chkVisible>削除フラグ含む</LABEL></SPAN>
                </TD>
                <td>
                	<a class="btn btn-default" href="javascript:void(0);" role="button" onclick="userSearchByAjax();">検索</a>
                </td>
            </TR>
        </TBODY>
    </TABLE>
</DIV>
<DIV style="TEXT-ALIGN: center; WIDTH: 100%;">
	 ページ情報 
</DIV>

<!-- ユーザ検索結果一覧 通常やりかた-->
<%-- <DIV style="HEIGHT: 400px" class=gvContent>
<c:if test="${userInfoList.size() > 0}">
<DIV>
<TABLE style="WIDTH: 100%; BORDER-COLLAPSE: collapse"
    id=ctl00_mainContent_gvList border=1 rules=all cellSpacing=0
    cellPadding=0 class="table table-hover">
    <TBODY>
        <TR class=gvHeader>
            <TH style="WIDTH: 8%" scope=col>操作</TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$ユーザID')">ユーザID</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$ユーザー名')">ユーザー名</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$権限')">権限</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$削除状態')">削除フラグ</A></TH>
            <TH style="WIDTH: 14%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$電話番号')">電話番号</A></TH>
            <TH style="WIDTH: 14%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$メールアドレス')">メールアドレス</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$作成者')">作成者</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$作成日')">作成日</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$更新者')">更新者</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$更新日')">更新日</A></TH>
        </TR>
        <c:forEach var="userInfo" items="${userInfoList }">
        	<TR
            	onclick="if(window.oldtr!=null){window.oldtr.runtimeStyle.cssText='';}this.runtimeStyle.cssText='background-color:#CCCCFF';window.oldtr=this;">
            	<TD style="WIDTH: 8%" align=center><A
                	id=ctl00_mainContent_gvList_ctl02_lnkEdit href="UserUpdate.htm">編集</A>
            	</TD>
            	<TD style="WIDTH: 8%" align=center><A
                	style="TEXT-DECORATION: underline"
                	id=ctl00_mainContent_gvList_ctl02_lnkUserID 
                	href="UserDetail.htm">${userInfo.userId}</A>
            	</TD>
            	<TD style="WIDTH: 8%" align=left>${userInfo.userName}</TD>
            	<TD style="WIDTH: 8%" align=left>${userInfo.authorityCd}</TD>
            	<TD style="WIDTH: 8%" align=center><SPAN title=削除フラグ disabled><INPUT
                	id=delFlag 
                	name=delFlag type=checkbox></SPAN></TD>
            	<TD style="WIDTH: 14%" align=left>${userInfo.telNumber}</TD>
            	<TD style="WIDTH: 14%" align=left>${userInfo.mailAddress}</TD>
            	<TD style="WIDTH: 8%" align=left>${userInfo.createUser}</TD>
            	<TD style="WIDTH: 8%" align=left>${userInfo.createDate}</TD>
            	<TD style="WIDTH: 8%" align=left>${userInfo.updateUser}</TD>
            	<TD align=left>${userInfo.updateDate}</TD>
        	</TR>
        </c:forEach>

    </TBODY>
</TABLE>
</DIV>
</c:if>
</DIV> --%>

<!-- ユーザ検索結果一覧AJAXで実現 -->
<DIV style="HEIGHT: 400px" class=gvContent>
<DIV id="searchResult">
	<TABLE style="WIDTH: 100%; BORDER-COLLAPSE: collapse"
    id=tblUserList border=1 rules=all cellSpacing=0
    cellPadding=0 class="table table-hover">
    <thead>
    	<TR class=gvHeader>
            <TH style="WIDTH: 8%" scope=col align="center">操作</TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$ユーザID')">ユーザID</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$ユーザー名')">ユーザー名</A></TH>
            <TH style="WIDTH: 12%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$権限')">権限</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$削除状態')">削除フラグ</A></TH>
            <TH style="WIDTH: 10%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$電話番号')">電話番号</A></TH>
            <TH style="WIDTH: 14%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$メールアドレス')">メールアドレス</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$作成者')">作成者</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$作成日')">作成日</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$更新者')">更新者</A></TH>
            <TH style="WIDTH: 8%" scope=col><A
                href="javascript:__doPostBack('ctl00$mainContent$gvList','Sort$更新日')">更新日</A></TH>
        </TR>
    </thead>
    <TBODY>
    </TBODY>
    </TABLE>
</DIV>
</DIV>

<INPUT id=ctl00_hidTime name=ctl00$hidTime value=2014/02/17 15:08:36 type=hidden />
</DIV>
</FORM>
<!-- フッター -->
<jsp:include page="../Footer.jsp"/>
</BODY>
</HTML>