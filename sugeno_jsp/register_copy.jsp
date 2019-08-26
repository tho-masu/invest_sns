<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/login_register.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/common.css">
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
<div class="outer">
<div class="log_range">
  <div class="inner"  align="center">
    <div class="up">
      <img src="http://lorempixel.com/output/people-q-c-100-100-1.jpg" width="100px" height="100px">
      <h1>Hi Guest</h1>
    </div>
    <div class="form_box">
    <form action="" method="POST">
      <div class="form_write"><input type="text" name="user_name" placeholder="NAME"></div>
      <div class="form_write"><input type="text" name="user_ID" placeholder="user_ID"></div>
      <div class="form_write"><input type="password" name="password" placeholder="password"></div>
      <div class="form_write"><input type="password" name="password_conf" placeholder="password(確認)"></div>
      <div><input type="submit" value="登録" class="log_btn"></div>
    </form>
    </div>
  </div>
</div>
</div>


</body>
</html>