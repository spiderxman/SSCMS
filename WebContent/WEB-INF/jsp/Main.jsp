<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>メイン画面</title>
<script language=javascript type=text/javascript>
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

</script>
</head>
<body>
HELLO
<jsp:include page="Footer.jsp"/>
</body>
</html>