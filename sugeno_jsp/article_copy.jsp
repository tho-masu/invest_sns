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

<title>記事</title>
</head>

<body>
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

<br><br><br><br>

<!-- ヘッダー終わり -->
<%--homeでフォローしたユーザーの投稿を表示する --%>
<table>
 <tr>
   <td>
   <%--フォローしたユーザのアイコン --%>
     <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="30px" height="30px"></a>
   </td>
   <td>
   <%--フォローしたユーザの名前 --%>
     <p>name</p>
   </td>
 </tr>
 <tr>
   <td>
   <%--フォローしたユーザの記事 --%>
     <article>記事を表示</article>
   </td>
 </tr>
 <tr>
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png"></a>12</td>
   <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png"></a>13</td>
   <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good_icon.png"></a>14</td>
 </tr>
</table>

<%--記事に対するコメント一覧を表示する --%>
<%--コメント送信 --%>
 <table class="comment_submit">
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
  <form>
  <tr>
   <td class="sub">
     <div><textarea name="comment"></textarea></div>
     <div><input type="submit" value="送信" align="center" class="submit_div"></div>
   </td>
  </tr>
  </form>
 </table>

 <table class="comment_list">
  <tr>
   <td class="point_top">
    コメント一覧
   </td>
  </tr>
  <tr>
   <td class="sub" class="commentword">
    コメント内容
   </td>
  </tr>
 </table>



</body>
</html>