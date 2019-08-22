<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%--共通項目 --%>
<jsp:include page="common_list_inhead.jsp" flush="true" />
<%--
JsonNode dnode = (JsonNode)(request.getAttribute("dnode"));
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
--%>

<title>ホーム</title>
</head>

<body>

<%--共通項目 --%>
<jsp:include page="common_list_inbody.jsp" flush="true" />

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
<%--余白の<div> --%>
<div class="top-margin"></div>

<%--homeでフォローしたユーザーの投稿を表示する --%>
<table class="article_table">
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前 --%>
       <p class="top_name_home">name</p>
       <div class="top_article_home">
         <div>2019-08-08</div>
         <article>長期金利と短期金利逆転で景気後退かxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
       </div>
     </div>
   </td>
 </tr>

 <tr align="center">
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td width="33.333%" class="solid_right">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a><div>12</div>
   </td>
   <td width="33.333%" class="solid_right">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"></a><div>13</div>
   </td>
   <td width="33.333%">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good_icon.png" width="30px" height="30px"></a><div>14</div>
   </td>
 </tr>
</table>


</body>
</html>