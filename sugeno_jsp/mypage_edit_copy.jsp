<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sugeno_js/icon_show.js"></script>
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
<div class="profile_edit_top">
  <div class="profile_edit_subject">
    <p>プロフィール編集</p>
  </div>
  <div class="proedit_form">
    <form action="" method="POST">
      <div>
        <p>ユーザネーム</p>
        <input type="text" class="write_letters" name="user_name" placeholder="NAME">
      </div>
      <div>
        <p>ICON</p>
        <div class="icon_img_location">
        <label for="file_photo">ICONを選択</label>
        </div>
          <input id="file_photo" type="file" name="icon" accept="image/png,image/jpeg">
        <div class="preview"></div>

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
        <input type="submit" value="変更" class="profile_edit_btn">
      </div>
    </form>
  </div>
</div>


</body>
</html>