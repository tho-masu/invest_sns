<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/tei_css/login_register.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/tei_css/common.css">
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
    <form action="<%=request.getContextPath()%>/tei_java/login" method="POST">
      <div class="form_write"><input type="text" name="user_id" placeholder="user_id"></div>
      <div class="form_write"><input type="password" name="password" placeholder="password"></div>
      <div><input type="submit" value="ログイン" class="log_btn"></div>
      <div style="margin-top:20px;">
        <input type="button" value="新規登録"onClick="location.href='<%=request.getContextPath()%>/tei_jsp/register.jsp'" class="log_btn">
      </div>
    </form>
    </div>
  </div>
</div>
</div>
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
</body>
</html>