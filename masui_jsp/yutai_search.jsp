<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>業界</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<div class="button_second" id="btn_search_">
	        	<form action="<%=request.getContextPath()%>/masui_jsp/yutai_search" method="POST">
	        		<input class="search_box" type="text" placeholder="検索" name="search">
	        		<input class="search_btn" type="submit" id="search_button" value="優待検索">
	        	</form>
</div>

</body>
</html>