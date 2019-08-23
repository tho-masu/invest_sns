<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean,database.PostBean,java.util.List,com.fasterxml.jackson.databind.JsonNode,com.fasterxml.jackson.databind.node.ArrayNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<title>ユーザページ</title>

<%
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
UserBean ubean = (UserBean)request.getAttribute("ubean");
ArrayNode blist = ubean.getBlist();
boolean isRegisteredFollow = (boolean)request.getAttribute("isRegisteredFollow");
List<PostBean> plist = (List<PostBean>)request.getAttribute("plist");
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
     <%if(ubean.getPk_id() == loginAccount.getPk_id()){ %>
     <div class="edit_profile">
       <%--プロフィール編集ボタン --%>
       <a href="<%=request.getContextPath()%>/masui_jsp/mypage_edit.jsp">編集</a>
     </div>
	 <%}else{ %>

	 <% if(!isRegisteredFollow){%>
     	<form action="<%=request.getContextPath() %>/masui_jsp/follow" method="POST">
			<input type="hidden" name="followed_user_pk_id" value="<%=ubean.getPk_id()%>">
			<input type="hidden" name="followed_user_user_id" value="<%=ubean.getUser_id()%>">
			<input type="hidden" name="registerOrDelete" value="register">
			<div><input type="submit" value="フォロー" align="center"></div>
		</form>
	<%}else{ %>
		<form action="<%=request.getContextPath() %>/masui_jsp/follow" method="POST">
			<input type="hidden" name="followed_user_pk_id" value="<%=ubean.getPk_id()%>">
			<input type="hidden" name="followed_user_user_id" value="<%=ubean.getUser_id()%>">
			<input type="hidden" name="registerOrDelete" value="delete">
			<div><input type="submit" value="フォロー解除" align="center"></div>
		</form>
	<%} %>
	<%} %>
   </td>
 </tr>
 <tr align="center">
 <%--投稿数、ブックマーク数、フォロー数、フォロワー数 --%>
   <td width="25%" class="line-right">
     <p>投稿</p>
     <p><%=plist.size() %></p>
   </td>
   <td width="25%" class="line-right">
     <p>ブックマーク</p>
     <p><%=blist.size() %></p>
   <td width="25%" class="line-right">
     <p>フォロー</p>
     <p><a href="<%=request.getContextPath()%>/masui_jsp/ff_list?user_id=<%=ubean.getUser_id()%>"><%=ubean.getFollowList().size() %></a></p>
   </td>
   <td width="25%">
     <p>フォロワー</p>
     <p><a href="<%=request.getContextPath()%>/masui_jsp/ff_list?user_id=<%=ubean.getUser_id()%>"><%=ubean.getFollowerList().size() %></a></p>
   </td>
 </tr>
</table>


<div class="post_n_bookmark">
  <%--このユーザの投稿記事一覧表示 --%>
  <div class="post_list">
    <div class="heading"><p>投稿</p></div>
<%for(PostBean post : plist){ %>
    <div class="post_date"><p>
    	<%=post.getCreate_date() %>　<%=post.getCreate_time() %>
    	<%--投稿削除ボタン --%>
    	<form action="<%=request.getContextPath() %>/masui_jsp/delete_article" method="POST">
     			<input type="hidden" name="pk_post" value="<%=post.getPk_post() %>">
				<input type="submit" name="btn" value="削除">
		</form>
    </p></div>

    <div class="post_content"><p><%=post.getArticle() %></p></div>
    <%--シェア、コメント、いいね数 --%>
    <div class="post_icon">
      <table class="post_table">
        <tr>
          <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a><div>12</div></td>
          <td><a href=""><img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"></a><div>13</div></td>
          <td>
			<%if(post.getIsLoginAccountGood()){ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=post.getPk_post()%>">
          		<input type="hidden" name="registerOrDelete" value="delete">
          		<input type="hidden" name="user_id" value="<%=ubean.getUser_id()%>">
				<input type="image" src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px">
				</form>
			<%}else{ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=post.getPk_post()%>">
          		<input type="hidden" name="registerOrDelete" value="register">
          		<input type="hidden" name="user_id" value="<%=ubean.getUser_id()%>">
				<input type="image" src="<%=request.getContextPath() %>/img/function_icon/no_good.png" width="30px" height="30px">
				</form>
			<%} %>
			<div><%=post.countGood() %></div>
          </td>
        </tr>
      </table>
    </div>
<%} %>
  </div>


  <%--ブックマーク企業一覧表示 --%>
  <div class="bookmark_list">
    <div align="center" class="heading"><p>ブックマーク企業</p></div>
    <%--クリックでその企業ページに画面遷移 --%>
    <% for(JsonNode jnode : blist){%>
    	<div class="bookmark_company"><p><a href="<%=request.getContextPath()%>/masui_jsp/company?quote=<%=jnode.get("req_code").asText()%>"><%=jnode.get("v-name").asText() %></a></p></div>
    <%} %>
  </div>
</div>


</body>
</html>