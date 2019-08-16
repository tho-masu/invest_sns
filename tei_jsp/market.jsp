<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>マーケットページ</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/kigyou.css" rel="stylesheet" type="text/css">
</head>

<body>


<form action="<%=request.getContextPath()%>/search" method="POST">
	        		<input class="search_box" type="text" placeholder="検索" name="search">
	        		<input id="search_btn" type="submit" id="search_button" value="銘柄検索">
</form>

</body>
</html>


