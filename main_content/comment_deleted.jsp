<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.lang.Math,java.util.List,java.util.Date,java.sql.Time,database.CommentBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%
String quote = (String)request.getAttribute("quote");
String iname = (String)request.getAttribute("iname");
String pk_post = (String)request.getAttribute("pk_post");
%>

<title>削除完了</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<table class="comment_submit">
<tr>
<td class="point_top">
コメントの削除が完了しました
</td>
</tr>
<tr>
<td class="sub" style="background-color: #FFFFFF">
<br><br>
<%if(quote != null){ %>
<form action="<%=request.getContextPath() %>/main_content/company" method="GET">
	<input type="hidden" name="quote" value="<%=quote %>">
	<div><input type="submit" value="元のページへ" align="center"></div>
</form>
<%}else if(iname != null){ %>
<form action="<%=request.getContextPath() %>/main_content/industry" method="GET">
	<input type="hidden" name="iname" value="<%=iname %>">
	<div><input type="submit" value="元のページへ" align="center"></div>
</form>
<%}else if(pk_post != null){ %>
	<div><input type="button" value="ホーム画面へ" align="center" onClick="location.href='<%=request.getContextPath() %>/main_content/'"></div>
<%}else{ %>
	<div><input type="button" value="元のページへ" align="center" onClick="location.href='<%=request.getContextPath() %>/main_content/market'"></div>
<%} %>
</td>
</tr>
</table>