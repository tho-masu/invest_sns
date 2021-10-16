<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>タイムアウト</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>



<table class="comment_submit">
<tr>
<td class="point_top">
接続がタイムアウトしました
</td>
</tr>
<tr>
<td class="sub" style="background-color: #FFFFFF">
<br><br>
	<div><input type="button" value="ログイン画面へ" align="center" onClick="location.href='<%=request.getContextPath() %>/'"></div>
</td>
</tr>
</table>

</body>
</html>