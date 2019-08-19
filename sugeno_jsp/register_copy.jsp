<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/login_register.css">

<title>investagram新規登録</title>
</head>

<body>

<br>

<header>
<!-- ヘッダーはじまり -->
<%--investagramロゴマーク --%>
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>
</header>

<%--ログイン入力画面 --%>
<div>
  <form action="" method="POST">
    <input type="text" name="user_name" placeholder="ユーザーID">
    <input type="password" name="password">
    <input type="submit" value="ログイン"></form>
</div>

</body>
</html>