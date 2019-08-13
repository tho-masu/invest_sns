<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>インデックス</title>
<link href="css/reset.css" rel="stylesheet" type="text/css">
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<br>

<header>

<!-- ヘッダーロゴ -->
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="img/investagram.png" width="240px"></a>
</div>

</header>

<nav>
  <ul>
    <li><a href="<%=request.getContextPath() %>/">ホーム</a></li>
    <li><a href="<%=request.getContextPath() %>/themes.jsp">市場</a></li>
    <li><a href="<%=request.getContextPath() %>/test.jsp">投稿</a></li>
    <li><a href="<%=request.getContextPath() %>/mypage.jsp">マイページ</a></li>
  </ul>
</nav>

<br><br><br><br>

  <div class="date">ここに日付</div>
  <h2>ここにタイトル</h2>
  <p>
   ここにテキスト
  </p>
  <a href="#" class="btn">&gt;もっと見る</a>




<footer>
<address>Copyright(C)ここに年 個人名or会社名,Allright Reserved.</address>
</footer>

</body>
</html>