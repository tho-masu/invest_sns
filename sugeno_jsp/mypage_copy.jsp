<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/common.css">
<link href="<%=request.getContextPath()%>/sugeno_css/default.css" rel="stylesheet" type="text/css">
<%--
JsonNode dnode = (JsonNode)(request.getAttribute("dnode"));
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
--%>

<title>ユーザページ</title>
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

<%--ユーザのプロフィールを表示する --%>
<table border="1">
 <tr>
   <td colspan="4" valign="middle" class="profile_top">
     <%--ユーザのアイコン --%>
     <div class="profile_img">
     <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="100px" height="100px">
     </div>
     <div class="user_introduction">
     <%--ユーザの名前 --%>
       <p>name</p>
     <%--ユーザの自己紹介、投資経験 --%>
       <p>投資経験：5年</p>
       <p>自己紹介文xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
       xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
       xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
       </p>
     </div>
     <div class="edit_profile">
       <%--プロフィール編集ボタン --%>
       <a href="<%=request.getContextPath()%>/sugeno_jsp/mypage_edit.jsp">編集</a>
     </div>

   </td>
 </tr>
 <tr align="center">
 <%--投稿数、ブックマーク数、フォロー数、フォロワー数 --%>
   <td width="25%">
     <p>投稿</p>
     <p>15</p>
   </td>
   <td width="25%">
     <p>ブックマーク</p>
     <p>15</p>
   <td width="25%">
     <p>フォロー</p>
     <p>15</p>
   </td>
   <td width="25%">
     <p>フォロワー</p>
     <p>15</p>
   </td>
 </tr>
</table>

<%--このユーザの投稿記事表示 --%>

<table border="1" class="post_article" width="400px">
  <tr>
    <th colspan="2">
      <p>あなたの投稿記事</p>
    </th>
  <tr>
  <tr>
    <td width="100px">
      <p>18 8月</p>
    </td>
    <td>
      <p>投稿記事１xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
    </td>
  </tr>
  <tr>
    <td >
      <p>16 8月</p>
    </td>
    <td>
      <p>投稿記事２xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p>
    </td>
  </tr>
</table>

<%--ブックマーク企業一覧表示 --%>
<table border="1" class="post_article" width="400px">
  <tr>
    <th>
      <p>ブックマーク企業</p>
    </th>
  <tr>
  <tr>
    <td>
      <p>AGC</p>
    </td>
  </tr>
  <tr>
    <td>
      <p>日産</p>
    </td>
  </tr>
</table>

<div class="post_n_bookmark">
  <%--このユーザの投稿記事一覧表示 --%>
  <div class="post_list">
    <div class="heading"><p>あなたの投稿記事</p></div>

    <div class="post_date"><p>2019年12月19日</p></div>
    <div class="post_content"><p>記事内容xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p></div>

    <div class="post_date"><p>3月17日</p></div>
    <div class="post_content"><p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p></div>
  </div>
  <%--ブックマーク企業一覧表示 --%>
  <div class="bookmark_list">
    <div align="center" class="heading"><p>ブックマーク企業</p></div>

    <div class="bookmark_company"><p>AGC</p></div>

    <div class="bookmark_company"><p>日産</p></div>

  </div>
</div>


</body>
</html>