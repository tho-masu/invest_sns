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
 <%--見出し --%>
 <tr>
   <th class="point_top" colspan="3">フォローした人の投稿</th>
 </tr>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前 クリックでそのユーザのページへ--%>
       <p class="top_name_home"><a href="">name</a></p>
       <div class="top_article_home top_article_homeonly">
         <%--クリックでarticle.jspへ --%>
         <a href="">
         <div>2019-08-08</div>
         <article>長期金利と短期金利逆転で景気後退かxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
         </a>
       </div>
     </div>
   </td>
 </tr>

 <tr align="center">
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td class="solid_right" colspan="3">
   <div class="table_in_icon solid_right">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a><div>12</div>
   </div>

   <div class="table_in_icon solid_right click_open">

     <img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"><div>13</div>
   </div>
   <div class="table_in_icon">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px"></a><div>14</div>
   </div>
   <%--投稿ここまで --%>

   <%--コメント返信欄(コメントアイコンを押すと表示される)--%>
   <div style="display:none">

     <%--コメント記入欄 --%>
     <div class="response_comment">
       <form action="<%=request.getContextPath()%>/" method="POST">
         <div><textarea></textarea></div>
         <div><input type="submit" value="送信"></div>
       </form>
     </div>

     <%--1人目の返信 --%>
     <div class="top_article">
     <%--アイコン --%>
       <div class="top_icon_home">
         <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
       </div>
       <%-- name（クリックでその人のページへ） --%>
       <p class="top_name_home"><a href="">namename</a></p>
       <div class="top_article_home top_article_homeonly">
       <%--日付 --%>
         <div>2020-02-02</div>
       <%--返信内容 --%>
         <article>postpostpostpostpostpostpostpostpostpostpostpost</article>
       </div>
     </div>
     <%--1人目の返信ここまで --%>

     <%--2人目の返信 サンプル--%>
     <div class="top_article">
     <%--アイコン --%>
       <div class="top_icon_home">
         <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
       </div>
       <%-- name（クリックでその人のページへ） --%>
       <p class="top_name_home"><a href="">namename</a></p>
       <div class="top_article_home top_article_homeonly">
       <%--日付 --%>
         <div>2020-02-03</div>
       <%--返信内容 --%>
         <article>xxxxaaaaxxxxxxxxxxxaaaaaaaaaaa</article>
       </div>
     </div>
     <%--2人目の返信ここまで --%>

   </div>
 </tr>
 <%--一人分の投稿、コメントここまで --%>

 <%--2つめサンプル --%>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前 クリックでそのユーザのページへ--%>
       <p class="top_name_home"><a href="">name</a></p>
       <div class="top_article_home top_article_homeonly">
         <%--クリックでarticle.jspへ --%>
         <a href="">
         <div>2019-08-08</div>
         <article>長期金利と短期金利逆転で景気後退かxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
         </a>
       </div>
     </div>
   </td>
 </tr>

 <tr align="center">
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td class="solid_right" colspan="3">
   <div class="table_in_icon solid_right">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a><div>12</div>
   </div>

   <div class="table_in_icon solid_right click_open">

     <img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"><div>13</div>
   </div>
   <div class="table_in_icon">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px"></a><div>14</div>
   </div>
   <%--投稿ここまで --%>

   <%--コメント返信欄(コメントアイコンを押すと表示される)--%>
   <div style="display:none">
     <%--コメント記入欄 --%>
     <div class="response_comment">
       <form action="<%=request.getContextPath()%>/" method="POST">
         <div><textarea></textarea></div>
         <div><input type="submit" value="送信"></div>
       </form>
     </div>
     <%--1人目の返信 --%>
     <div class="top_article">
     <%--アイコン --%>
       <div class="top_icon_home">
         <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
       </div>
       <%-- name（クリックでその人のページへ） --%>
       <p class="top_name_home"><a href="">namename</a></p>
       <div class="top_article_home top_article_homeonly">
       <%--日付 --%>
         <div>2020-02-02</div>
       <%--返信内容 --%>
         <article>postpostpostpostpostpostpostpostpostpostpostpost</article>
       </div>
     </div>
     <%--1人目の返信ここまで --%>

     <%--2人目の返信 サンプル--%>
     <div class="top_article">
     <%--アイコン --%>
       <div class="top_icon_home">
         <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
       </div>
       <%-- name（クリックでその人のページへ） --%>
       <p class="top_name_home"><a href="">namename</a></p>
       <div class="top_article_home top_article_homeonly">
       <%--日付 --%>
         <div>2020-02-03</div>
       <%--返信内容 --%>
         <article>xxxxaaaaxxxxxxxxxxxaaaaaaaaaaa</article>
       </div>
     </div>
     <%--2人目の返信ここまで --%>

   </div>
 </tr>
 <%--サンプルここまで --%>

</table>


</body>
</html>