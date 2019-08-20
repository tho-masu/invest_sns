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

<title>ホーム</title>
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
<%--homeでフォローしたユーザーの投稿を表示する --%>
<table border="1">
 <tr>
   <td colspan="3" valign="middle">
     <%--フォローしたユーザのアイコン --%>
     <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
     <%--フォローしたユーザの名前 --%>
     <div>name</div>
   </td>
 </tr>
 <tr>
   <td colspan="3">
   <%--フォローしたユーザの記事 --%>
     <article>長期金利と短期金利逆転で景気後退か</article>
   </td>
 </tr>
 <tr align="center">
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td width="33.333%">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a><div>12</div>
   </td>
   <td width="33.333%">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"></a><div>13</div>
   </td>
   <td width="33.333%">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good_icon.png" width="30px" height="30px"></a><div>14</div>
   </td>
 </tr>
</table>


</body>
</html>