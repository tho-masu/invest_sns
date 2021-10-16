<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sugeno_js/icon_show.js"></script>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">


<title>マイページ編集</title>

<%
UserBean ubean = (UserBean)session.getAttribute("login_account");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<%--mypageedit画面 --%>
<div class="profile_edit_top">
  <div class="profile_edit_subject">
    <p>プロフィール編集</p>
  </div>
  <div class="proedit_form">
  ※変更したい項目だけ入力してください
    <form action="<%=request.getContextPath() %>/main_content/mypage_edit" enctype="multipart/form-data" method="POST">
      <div>
        <p>ユーザネーム</p>
        <input type="text" class="write_letters" name="user_name" placeholder="<%=ubean.getUsername()%>">
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
        <select name="invest_time">
          <option value=""></option>
          <option value="未経験">未経験</option>
          <option value="半年未満">半年未満</option>
          <option value="1年未満">1年未満</option>
          <option value="3年未満">3年未満</option>
          <option value="5年未満">5年未満</option>
          <option value="5年以上">5年以上</option>
        </select>
      </div>
      <div>
        <p>自己紹介</p>
        <textarea name="message" placeholder="<%=ubean.getMessage()%>"></textarea>
      </div>
      <div>
      	<input type="hidden" name="pk_id" value="<%=ubean.getPk_id() %>">
      	<input type="hidden" name="user_id" value="<%=ubean.getUser_id() %>">
        <input type="submit" value="変更" class="profile_edit_btn">
      </div>
    </form>
  </div>
</div>


</body>
</html>