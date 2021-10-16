<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>分析</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<table class="comment_submit">
<tr>
<td class="point_top">
	ブックマーク企業が1件も存在しません
</td>
</tr>
<tr>
<td class="sub" style="background-color: #FFFFFF">
<br><br>
	<div><input type="button" value="前のページへ" align="center" onClick="window.history.back() ; return false;"></div>
</td>
</tr>
</table>

</body>
</html>