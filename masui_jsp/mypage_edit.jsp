<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/common.css">
<link href="<%=request.getContextPath()%>/sugeno_css/default.css" rel="stylesheet" type="text/css">


<title>マイページ編集</title>
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

<%--mypageedit画面 --%>
<div>
  <p>プロフィール編集</p>
  <form action="" method="POST">
    <div>
      <p>ユーザネーム</p>
      <input type="text">
    </div>
    <div>
      <p>ICON</p>
      <input type="file">
    </div>
    <div>
      <p>投資経験</p>
      <select>
        <option value="0">未経験</option>
        <option value="0.5">半年未満</option>
        <option value="1">１年未満</option>
        <option value="3">３年未満</option>
        <option value="5">５年未満</option>
        <option value="6">５年以上</option>
      </select>
    </div>
    <div>
      <p>自己紹介</p>
      <textarea></textarea>
    </div>
    <div>
      <p>パスワード変更</p>
      <input type="password">
    </div>
    <div>
      <p>パスワード変更(確認)</p>
      <input type="password">
    </div>
  </form>
</div>


</body>
</html>