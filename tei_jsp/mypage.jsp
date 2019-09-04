<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean,com.fasterxml.jackson.databind.JsonNode,com.fasterxml.jackson.databind.node.ArrayNode"%>
    <%@ page import="database.*" %>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<title>ユーザページ</title>

<%
UserBean ubean = (UserBean)request.getAttribute("ubean");
ArrayNode blist = (ArrayNode)request.getAttribute("blist");
PostBean pbean=(PostBean)request.getAttribute("pbean");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<%--ユーザのプロフィールを表示する --%>
<table class="mypage_profile">
 <tr>
   <td colspan="4" valign="middle" class="profile_top">
     <%--ユーザのアイコン --%>
     <div class="profile_img">
     <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="100px" height="100px">
     </div>
     <div class="user_introduction">
     <%--ユーザの名前 --%>
       <p class="user_name"><%=ubean.getUsername() %></p>
     <%--ユーザの自己紹介、投資経験 --%>
       <p class="invest_histry">投資経験：<%=ubean.getInvest_time() %></p>
       <p class="introduction_word"><%=ubean.getMessage() %></p>
     </div>
     <div class="edit_profile">
       <%--プロフィール編集ボタン --%>
       <a href="<%=request.getContextPath()%>/sugeno_jsp/mypage_edit.jsp">編集</a>
     </div>

   </td>
 </tr>
 <tr align="center">
 <%--投稿数、ブックマーク数、フォロー数、フォロワー数 --%>
   <td width="25%" class="line-right">
     <p>投稿</p>
     <p>15</p>
   </td>
   <td width="25%" class="line-right">
     <p>ブックマーク</p>
     <p><%=blist.size() %></p>
   <td width="25%" class="line-right">
     <p>フォロー</p>
     <p>15</p>
   </td>
   <td width="25%">
     <p>フォロワー</p>
     <p>15</p>
   </td>
 </tr>
</table>


<div class="post_n_bookmark">
  <%--このユーザの投稿記事一覧表示 --%>
  <div class="post_list">
    <div class="heading"><p>投稿記事</p></div>

    <div class="post_date"><p><%=pbean.getCreate_date() %></p></div>
    <div class="post_content"><p><%=pbean.getArticle() %></p></div>
    <%--シェア、コメント、いいね数 --%>
    <div class="post_icon">
      <table class="post_table">
        <tr>
          <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a><div>12</div></td>
          <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"></a><div>13</div></td>
          <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good_icon.png" width="30px" height="30px"></a><div>14</div></td>
        </tr>
      </table>
    </div>

    <div class="post_date"><p>3月17日</p></div>
    <div class="post_content"><p>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p></div>
    <div class="post_icon">
      <table class="post_table">
        <tr>
          <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png"></a><div>12</div></td>
          <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png"></a><div>13</div></td>
          <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good_icon.png"></a><div>14</div></td>
        </tr>
      </table>
    </div>
  </div>
  <%--ブックマーク企業一覧表示 --%>
  <div class="bookmark_list">
    <div align="center" class="heading"><p>人気銘柄</p></div>
    <%--クリックでその企業ページに画面遷移 --%>
    <% for(JsonNode jnode : blist){%>
    	<div class="bookmark_company"><p><a href="<%=request.getContextPath()%>/masui_jsp/company?quote=<%=jnode.get("req_code").asText()%>"><%=jnode.get("v-name").asText() %></a></p></div>
    <%} %>
  </div>
</div>


</body>
</html>