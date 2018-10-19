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
    function show(id){
        document.getElementById(id).style.display='block';
    }
    function hide(id){
        document.getElementById(id).style.display='none';
    }
    
    function menuSwitch(menu){
    	var form = document.getElementById("headForm");
    	if(menu == 'userSearch'){
    		form.action = "UserSearchInit";
    	}
    	if(menu == 'userAdd'){
    		form.action = "UserAddInit";
    	}
    	form.submit();
    }

</SCRIPT>
</head>
<body onload="getNow('ctl00_lblTime');">
<form id="headForm" name="headForm" method="post" action="">
<DIV style="TEXT-ALIGN: center">
    <DIV style="BACKGROUND-IMAGE: url(Image/bj.jpg); WIDTH: 1250px; BACKGROUND-REPEAT: repeat-x">
        <DIV style="BACKGROUND-IMAGE: url(Image/top.jpg); TEXT-ALIGN: left; MARGIN: auto; WIDTH: 92%; BACKGROUND-REPEAT: no-repeat; HEIGHT: 82px">
            <DIV class=UserNotice>
                <DIV style="WIDTH: 50%; FLOAT: left">
                    <SPAN id=ctl00_lblUserID>ユーザー名：</SPAN><SPAN id=ctl00_lblUserName>
                   ${sessionScope.userInfo.userName}
                   </SPAN> &nbsp; <SPAN id=ctl00_lblTime></SPAN>
                </DIV>
                <DIV style="WIDTH: 50%; FLOAT: left">
                    <A id=ctl00_lnkHelp class=LogHelp onClick="return openHelpDoc();" href="javascript:__doPostBack('ctl00$lnkHelp','')">ヘルプ</A>
                    <A id=ctl00_lnkReturn class=LogReturn href="MainMenu.htm">メイン画面</A> 
                    <A id=ctl00_lnkExit class=LogExsit href="javascript:void(0);" onClick="logout();">ログアウト</A> 
                </DIV>
            </DIV>
        </DIV>
    </DIV>
    <div id="ddst" class="ddst">
        <ul id="nav" style="BACKGROUND-IMAGE: url(Image/001.jpg); PADDING-LEFT: 3%; WIDTH: 1250px; BACKGROUND-REPEAT: repeat-x">
            <li onMouseOver="show('nav_1');" onMouseOut="hide('nav_1')" ><a href="#">販売契約</a>
                <ul id="nav_1">
                    <li><a href="Sale/SaleContractSearch.htm">販売契約検索</a></li>
                </ul>
            </li>
            <li onMouseOver="show('nav_2');" onMouseOut="hide('nav_2')" ><a href="#">基本情報</a>
                <ul id="nav_2">
                    <li><a href="javascript:void(0);" onClick="menuSwitch('userSearch');">ユーザー検索</a></li>
                    <li><a href="javascript:void(0);" onClick="menuSwitch('userAdd');">ユーザー追加</a></li>
                </ul>
            </li>
            <li onMouseOver="show('nav_3');" onMouseOut="hide('nav_3')" ><a href="#">マスタ情報</a>
                <ul id="nav_3">
                    <li><a href="Master/BankAdd.htm">銀行</a></li>
                    <li><a href="Master/StatusAdd.htm">ステータス</a></li>
                    <li><a href="Master/PaymentAdd.htm">支払方法</a></li>
                    <li><a href="Master/UnitAdd.htm">単位</a></li>
                    <li><a href="Master/PortAdd.htm">地点</a></li>
                    <li><a href="Master/CurrencyAdd.htm">通貨種別</a></li>
                    <li><a href="Master/TradeLanAdd.htm">貿易用語</a></li>
                    <li><a href="Master/RootAdd.htm">権限</a></li>
                </ul>
            </li>
            <li class="yy"></li>
        </ul>
    </div>
    <DIV style="TEXT-ALIGN: left; MARGIN-TOP: 0px; WIDTH: 30%; FLOAT: right; HEIGHT: 20px">
        <DIV style="WIDTH: 354px; HEIGHT: 40px" id=ctl00_panelMsg class=panelGrid>
           <FIELDSET>
               <LEGEND>システム情報 </LEGEND>&nbsp; 
               <SPAN
                  style="COLOR: red" id=errorMessage class=MsgStyle>${errorMessage}
               </SPAN>
           </FIELDSET>
        </DIV>
    </DIV>
</DIV>
</form>
</body>
</html>