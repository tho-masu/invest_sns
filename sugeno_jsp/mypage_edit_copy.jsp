<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%--共通項目 --%>
<jsp:include page="common_list_inhead.jsp" flush="true" />

<title>マイページ編集</title>
</head>

<body>
<%-- 投稿ページへのボタン --%>
<div class="post_icon_function">
  <a href="<%=request.getContextPath()%>/sugeno_jsp/post_copy.jsp">
    <img src="<%=request.getContextPath() %>/img/function_icon/write.png" width="100px" height="100px">
  </a>
</div>
<br>
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

<%--共通項目 --%>
<jsp:include page="common_list_inbody.jsp" flush="true" />

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