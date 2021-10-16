<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%
String error = (String)request.getAttribute("error");
%>

<title><%if(error == null){ %>送信完了<%}else{ %>エラー<%} %></title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<table class="comment_submit">
<tr>
<td class="point_top">
<%if(error == null){ %>
投稿の送信が完了しました
<%}else{ %>
<%=error %>
<%} %>
</td>
</tr>
<tr>
<td class="sub" style="background-color: #FFFFFF">
<br><br>
	<div><input type="button" value="ホーム画面へ" align="center" onClick="location.href='<%=request.getContextPath() %>/masui_jsp/'"></div>
</td>
</tr>
</table>

</body>
</html>