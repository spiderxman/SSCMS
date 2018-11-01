<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<TITLE>ユーザー登録</TITLE>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<jsp:include page="../res/meta.jsp"/>
<script language=javascript type=text/javascript>
function inputNullCheck(){
	if($("#userId").val()==""){
		$("#errorMessage").html("ユーザーID入力されていない");
		//document.getElementById("errorMessage").innerHTML = "";
		return false;
	}
	if($("#userName").val()==""){
		$("#errorMessage").html("ユーザー名入力されていない");
		return false;
	}
	if($("#password").val()==""){
		$("#errorMessage").html("パスワード入力されていない");
		return false;
	}
	if($("#rPassword").val()==""){
		$("#errorMessage").html("パスワード確認入力されていない");
		return false;
	}
	if($("#authorityCd").val()==""){
		$("#errorMessage").html("権限選択されていない");
		return false;
	}
	return true;
}

function passwordSameCheck(){
	if($("#password").val()!=$("#rPassword").val()){
		$("#errorMessage").html("パスワード不一致");
		return false;
	}
	return true;
}

function userAdd(){
//	if(!inputNullCheck()){
//		return;
//	}
//	if(!passwordSameCheck()){
//		return;
//	}
//	if(isNaN($("#telNumber").val())){
//		$("#errorMessage").html("電話番号が数字ではない");
//		return;
//	}
//	if(!mailChk($("#mailAddress").val())){
//		$("#errorMessage").html("メール形式不正");
//		return;
//	}
	var form = document.getElementById("empInfoAddForm");
	form.submit();
}

function userIdExists() {
	if($("#userId").val()==""){
		return;
	}
	var param = {"userId":$("#userId").val()};
	$("#errorMessage").html("");
    $.ajax({
        type: "POST",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        //contentType: "application/json",//post请求的信息格式（添加此句后台取不到request值）
        url: "CheckUserIdExists" ,//url
        data: param,
        success: function (resultList) {
        	if(resultList && resultList.length > 0){
        		$("#errorMessage").html("ユーザIDすでに存在している。");
        		return;
        	}
        },
        error : function(XMLHttpRequest, textStatus, errorThrown) {
            $("#errorMessage").html("異常:("+XMLHttpRequest.status+")");
        }
    });
}

$(function() {
    $("#birthday").datepicker({
    	dateFormat : 'yy/mm/dd',
    	monthNames : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
    	dayNamesMin : ['月','火','水','木','金','土','日'],
    	showButtonPanel: true,
    	changeMonth : true,
    	monthNamesShort : ['一月','二月','三月','四月','五月','六月','七月','八月','九月','十月','十一月','十二月'],
    	changeYear : true,
    	showOtherMonths : true,
    	currentText : 'Today'
    });
  });
</script>

<style>
    .footer {
      position: fixed;
      left: 0px;
      bottom: 40px;
      width: 100%;
      height: 60px;
      background-color: #eee;
      z-index: 9999;
      opacity:0.8;
    }
    #tbl_tech .btn.btn-primary{
    	width: 50px;
    }
</style>
</head>
<body>
<form id="empInfoAddForm" style="text-align: center" method=post action="EmpBaseAdd" autocomplete="off">
<div style="width: 100%; height: 30px">
<DIV
    style="BACKGROUND-IMAGE: url(./Image/006.jpg); text-align: left; MARGIN-TOP: 20px; TEXT-INDENT: 20px; width: 100%; BACKGROUND-REPEAT: no-repeat; FLOAT: left; height: 28px"><SPAN
    id=ctl00_lbltitle class=title>社員情報登録</SPAN></div>
</div>
<div style="text-align: left; width: 1158px">

<div style="text-align: right; width: 100%" class=btnContent>
<a class="btn btn-default" href="javascript:void(0);" role="button" onclick="userAdd();">登録</a>
<!-- <a class="btn btn-default" href="javascript:void(0);" role="button" onclick="pullBack();">戻る</a> -->
</div>
<div style="width: 100%" id=ctl00_mainContent_BaseInfo class=panelGrid>
<fieldset><legend>基本情報 </LEGEND>
<table style="padding-left: 10px; width: 100%" border=0 cellSpacing=0 cellPadding=0>
    <tbody>
        <tr>
            <td style="width: 170px">社員ID
            	<label>${empId}</label>
            	<input type="hidden" id="empBaseBean.empId" name="empBaseBean.empId" value="${empId}">
            </td>
        </tr>
        <tr>
            <td style="width: 220px">社員名称（姓）
            <input style="width: 120px" id="empBaseBean.empFirstName"
                class=inputText name="empBaseBean.empFirstName" maxLength=20 placeholder="例）abc"/>*</td>
            <td style="width: 220px">社員名称（名）
            <input style="width: 120px" id="empBaseBean.empLastName"
                class=inputText name="empBaseBean.empLastName" maxLength=20 placeholder="例）abc"/>*</td>
        </tr>
        <tr>
            <td style="width: 220px">社員名称カタカナ
            <input style="width: 120px" id="empBaseBean.empNameKana"
                class=inputText name="empBaseBean.empNameKana" maxLength=20/>*</td>
            <td style="width: 220px">社員名称（略）
            <input style="width: 120px" id="empBaseBean.empNickName"
                class=inputText name="empBaseBean.empNickName" maxLength=20/>*</td>
        </tr>
<!--         <tr>
            <td style="width: 170px"><SPAN >パスワード</SPAN>
            <input style="width: 120px" id="empBaseBean.password"
                class=inputText name="empBaseBean.password" maxLength=20 type=password autocomplete="new-password"/>*
            </td>
            <br>
            <td style="width: 170px"><SPAN>パスワード確認</SPAN>
            <input style="width: 120px" id="empBaseBean.rPassword"
                class=inputText name="empBaseBean.rPassword" maxLength=20 type=password autocomplete="new-password"/>*
            </td>
        </tr> -->
        <tr>
            <td style="width: 170px"><SPAN>権限</SPAN>
            <select id="empBaseBean.authority" class=ddlBlack name="empBaseBean.authority">
                <option selected value=""></option>
				<c:forEach var="item" items="${authorityCodeList}">
					<option value="${item.code}">${item.codeValue}</option>
				</c:forEach>
            </select>*
            </td>
        </tr>
        <tr>
        	<td>性別*</td>
        	<td>
        		<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empBaseBean.sex" checked="checked" value="1"/>男
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empBaseBean.sex" value="0"/>女
            		</label>
            	</div>
        	</td>
        </tr>
        <tr>
        	<td>生年月日</td>
        	<td>
        	<input type="text" id="birthday" name="empBaseBean.birthday"/>*
        	</td>
        </tr>
        <tr>
        	<td>国籍／出身</td>
        	<td>
        	<input type="text" name="empBaseBean.country"/>*
        	</td>
        </tr>
        <tr>
        	<td>現住所</td>
        	<td>
        	<input type="text" name="empBaseBean.address"/>*
        	</td>
        </tr>
        <tr>
        	<td>最寄駅</td>
        	<td>
        	<input type="text" name="empBaseBean.station"/>
        	</td>
        </tr>
        <tr>
        	<td>電話番号</td>
        	<td>
        	<input type="text" name="empBaseBean.tel" maxLength=15/>
        	</td>
        </tr>
        <tr>
        	<td>メールアドレス</td>
        	<td>
        	<input type="text" name="empBaseBean.mail" maxLength=50/>
        	</td>
        </tr>
        <tr>
        	<td>最終学校</td>
        	<td>
        	<input type="text" name="empBaseBean.school" maxLength=50/>
        	</td>
        </tr>
        <tr>
        	<td>最終学歴</td>
        	<td><select id="empBaseBean.education" class=ddlBlack name="empBaseBean.education">
                <option selected value=""></option>
				<c:forEach var="item" items="${educationCodeList}">
					<option value="${item.code}">${item.codeValue}</option>
				</c:forEach>
            </select></td>
        </tr>
        <tr>
        	<td>専門</td>
        	<td>
        	<input type="text" name="empBaseBean.major" maxLength=30/>
        	</td>
        </tr>
        <tr>
        	<td>卒業年月</td>
        	<td>
        	<input type="text" name="empBaseBean.graduateDate" maxLength=8/>
        	</td>
        </tr>
        <tr>
        	<td>在留資格</td>
        	<td><select id="empBaseBean.immigrationStatus" class=ddlBlack name="empBaseBean.immigrationStatus">
                <option selected value=""></option>
				<c:forEach var="item" items="${immigrationStatusCodeList}">
					<option value="${item.code}">${item.codeValue}</option>
				</c:forEach>
            </select>*</td>
        </tr>
        <tr>
        	<td>外語１</td>
        	<td>
        	<input type="text" name="empBaseBean.language1" maxLength=20/>
        	</td>
        	<td>レベル１</td>
        	<td>
        	<input type="text" name="empBaseBean.level1" maxLength=20/>
        	</td>
        </tr>
        <tr>
        	<td>外語２</td>
        	<td>
        	<input type="text" name="empBaseBean.language2" maxLength=20/>
        	</td>
        	<td>レベル２</td>
        	<td>
        	<input type="text" name="empBaseBean.level2" maxLength=20/>
        	</td>
        </tr>
        <tr>
        	<td>技術資格証明書</td>
        	<td>
        	<input type="text" name="empBaseBean.certificate" maxLength=20/>
        	</td>
        </tr>
        <tr>
        	<td>社員種別</td>
        	<td><select id="empBaseBean.employeeType" class=ddlBlack name="empBaseBean.employeeType">
                <option selected value=""></option>
				<c:forEach var="item" items="${employeeTypeCodeList}">
					<option value="${item.code}">${item.codeValue}</option>
				</c:forEach>
            </select>*</td>
        </tr>
        <tr>
        	<td>社内役割</td>
        	<td><select id="empBaseBean.position" class=ddlBlack name="empBaseBean.position">
                <option selected value=""></option>
				<c:forEach var="item" items="${positionCodeList}">
					<option value="${item.code}">${item.codeValue}</option>
				</c:forEach>
            </select></td>
        </tr>
        <tr>
        	<td>仕事状態</td>
        	<td><select id="empBaseBean.workingStatus" class=ddlBlack name="empBaseBean.workingStatus">
                <option selected value=""></option>
				<c:forEach var="item" items="${workingStatusCodeList}">
					<option value="${item.code}">${item.codeValue}</option>
				</c:forEach>
            </select>*</td>
        </tr>
        <tr>
        	<td>会社契約期間</td>
        	<td>
        	<input type="text" name="empBaseBean.companyStartDate" maxLength=8/>～
        	</td>
        	<td>
        	<input type="text" name="empBaseBean.companyEndDate" maxLength=8/>
        	</td>
        </tr>

        <tr>
        	<td>現場請求先</td>
        	<td>
        	<input type="text" name="empBaseBean.officeName" maxLength=200/>
        	</td>
        	<td>現場アドレス</td>
        	<td>
        	<input type="text" name="empBaseBean.officeAddress" maxLength=200/>
        	</td>
        </tr>
        <tr>
        	<td>現場契約期間</td>
        	<td>
        	<input type="text" name="empBaseBean.officeStartDate" maxLength=8/>～
        	</td>
        	<td>
        	<input type="text" name="empBaseBean.officeEndDate" maxLength=8/>
        	</td>
        </tr>
    </tbody>
</table>
</fieldset>

<fieldset><legend>技術経験 </legend>
<table style="padding-left: 10px; width: 100%" border=0 cellSpacing=0 cellPadding=0 id="tbl_tech">
    <tbody>
        <tr>
            <td style="width: 25%">
            	DOS<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.dos" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.dos" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.dos" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.dos" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">
            	Windows系<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.windows" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.windows" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.windows" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.windows" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">Android
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.android" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.android" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.android" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.android" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">WinCE
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.wince" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.wince" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.wince" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.wince" value="3"/>◎
            		</label>
            	</div>
            </td>
        </tr>
        <tr>
            <td style="width: 25%">Symbian
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.symbian" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.symbian" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.symbian" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.symbian" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">Brew
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.brew" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.brew" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.brew" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.brew" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">Unix
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.unix" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.unix" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.unix" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.unix" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">Linux
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.linux" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.linux" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.linux" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.linux" value="3"/>◎
            		</label>
            	</div>
            </td>
        </tr>
        <tr>
            <td style="width: 25%">Mac
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.mac" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.mac" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.mac" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.mac" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">ﾘｱﾙﾀｲﾑOS TRON
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.osTron" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.osTron" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.osTron" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.osTron" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">Cygwin
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.cygwin" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.cygwin" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.cygwin" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.cygwin" value="3"/>◎
            		</label>
            	</div>
            </td>
            <td style="width: 25%">Netware
            	<div class="btn-group" data-toggle="buttons">
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.netware" checked="checked" value="0"/>無
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.netware" value="1"/>△
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.netware" value="2"/>〇
            		</label>
            		<label class="btn btn-primary">
            			<input type="radio" name="empTechBean.netware" value="3"/>◎
            		</label>
            	</div>
            </td>
        </tr>



    </tbody>
</table>
</fieldset>
</div>
</div>
</form>
<br><br><br><br><br><br><br><br><br>
<jsp:include page="../CopyRight.jsp"/>
<div style="width:100%;height:120px"></div>
<!-- フッター -->
<div class="footer">
	<jsp:include page="../Footer.jsp"/>
</div>
</body>
</html>
