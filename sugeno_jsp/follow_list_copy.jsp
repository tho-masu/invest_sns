<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/common.css">

<title>フォロー一覧</title>
</head>

<body>

<header>

<!-- ヘッダーはじまり -->
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>

</header>

<nav>
  <ul>
    <li><a href="<%=request.getContextPath() %>/">ホーム</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/market">市場</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/industry">業界</a></li>
    <li><a href="<%=request.getContextPath() %>/mypage.jsp">マイページ</a></li>
  </ul>
</nav>



<!-- ヘッダー終わり -->

<%--follow_list画面 --%>
<table class="follow_follower">
  <tr>
    <th class="point_top">
      <p>フォロー一覧</p>
    </th>
  <tr>
    <td class="follow_img">
      <%--ユーザのICON --%>
      <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">

      <%--ユーザネーム <a>押すとその人のユーザページへ --%>
      <a href="">invester1</a>
    </td>
  </tr>
  <%--以下サンプル --%>
  <tr>
    <td class="follow_img">
      <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">

      <a href="">invester2</a>
    </td>
  </tr>
  <tr>
    <td class="follow_img">
      <div>
      <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
      </div>
      <a href="">invester3</a>
    </td>
  </tr>
  <tr>
    <td class="follow_img">
      <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">

      <a href="">invester4</a>
    </td>
  </tr>
</table>

</body>
</html>