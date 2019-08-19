<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.lang.Math,java.util.List,java.util.Date,java.sql.Time,database.CommentBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%
String quote = (String)request.getAttribute("quote");
String iname = (String)request.getAttribute("iname");
String error = (String)request.getAttribute("error");
%>

<title><%if(error == null){ %>送信完了<%}else{ %>エラー<%} %></title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<br>

<header>

<!-- ヘッダーはじまり -->
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>

</header>

<nav>
  <ul>
    <li><a href="<%=request.getContextPath() %>/">ホーム</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/market">市場</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/industry">業界</a></li>
    <li><a href="<%=request.getContextPath() %>/mypage.jsp">マイページ</a></li>
  </ul>
</nav>

<br><br>

<!-- ヘッダー終わり -->

<table class="comment_submit">
<tr>
<td class="point_top">
<%if(error == null){ %>
コメントの送信が完了しました
<%}else{ %>
<%=error %>
<%} %>
</td>
</tr>
<tr>
<td class="sub" style="background-color: #FFFFFF">
<br><br>
<%if(quote != null){ %>
<form action="<%=request.getContextPath() %>/masui_jsp/company" method="GET">
	<input type="hidden" name="quote" value="<%=quote %>">
	<div><input type="submit" value="元のページへ" align="center"></div>
</form>
<%}else if(iname != null){ %>
<form action="<%=request.getContextPath() %>/masui_jsp/industry" method="GET">
	<input type="hidden" name="iname" value="<%=iname %>">
	<div><input type="submit" value="元のページへ" align="center"></div>
</form>
<%}else{ %>
	<div><input type="button" value="元のページへ" align="center" onClick="location.href='<%=request.getContextPath() %>/masui_jsp/market'"></div>
<%} %>
</td>
</tr>
</table>