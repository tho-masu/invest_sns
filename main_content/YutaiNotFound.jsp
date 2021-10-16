<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>NotFound</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<table class="comment_submit">
<tr>
<td class="point_top">
検索ワードに一致する優待情報がありません
</td>
</tr>
<tr>
<td class="sub" style="background-color: #FFFFFF">
<br><br>
<form action="" method="GET">
	<div><input type="button" onClick="window.history.back() ; return false;" value="元のページへ" align="center"></div>
</form>
</td>
</tr>
</table>