<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%
String user_id = (String)request.getAttribute("user_id");
%>

<title>削除完了</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<table class="comment_submit">
<tr>
<td class="point_top">
投稿の削除が完了しました
</td>
</tr>
<tr>
<td class="sub" style="background-color: #FFFFFF">
<br><br>
<form action="<%=request.getContextPath() %>/masui_jsp/mypage" method="GET">
	<input type="hidden" name="user_id" value="<%=user_id %>">
	<div><input type="submit" value="元のページへ" align="center"></div>
</form>
</td>
</tr>
</table>