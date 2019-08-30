<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.util.List,database.IndustryBean,database.CommentBean,database.UserBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>sample</title>

<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>


</head>

<body>

<%--証券番号検索ボタン --%>
<div class="top_market_search">
  <p align="center">証券コードを入力してください</p>
  <form action="<%=request.getContextPath() %>/sugeno_jsp/chart_sample" method="GET">
	  <input type="tel" name="quote" maxlength="4">
	  <input type="submit" value="銘柄詳細へ">
  </form>
</div>


<!-- チャートを入れるテーブル終わり -->


</body>
</html>