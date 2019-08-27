<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/login_register.css">
<title>investagramログイン</title>
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
    <form action="<%=request.getContextPath() %>/register" method="POST">
      <div class="form_write"><input type="text" name="username" placeholder="username"></div>
      <div class="form_write"><input type="text" name="user_id" placeholder="user_id"></div>
      <div class="form_write"><input type="password" name="password" placeholder="password（6文字以上半角英数字）"></div>
      <div class="form_write"><input type="password" name="password_confirm" placeholder="password(確認用)"></div>
      <div><input type="submit" value="登録" class="log_btn"></div>
    </form>
    <div style="margin-top:20px;">
        <input type="button" value="ログイン画面へ"onClick="location.href='<%=request.getContextPath()%>/'" class="log_btn">
     </div>
    </div><font color="red"></font>
    <div align="center" >
	<%String word;
	if (!(request.getAttribute("errorMessage")==null)){
		word = (String)request.getAttribute("errorMessage");}
	else{
		word = "";
		}
	%>
	<font color="red"><%=word%></font>

</div>
  </div>
</div>
</div>


</body>
</html>