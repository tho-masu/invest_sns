<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean,database.CommentBean,database.PostBean,java.util.List,com.fasterxml.jackson.databind.JsonNode,com.fasterxml.jackson.databind.node.ArrayNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<title>ユーザページ</title>

<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
<script>
$(function(){
	$('.click_open').click(function(){
		$(this).next().next().slideToggle();
	});
})
</script>

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
     <img src="<%=request.getContextPath() %>/img/user_icon/<%=ubean.getIcon_name() %>" width="100px" height="100px">
     </div>
     <div class="user_introduction">
     <%--ユーザの名前 --%>
       <p class="user_name">
       	<%=ubean.getUsername() %>
       </p>
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
	<div class="post_article_all">
    <div class="post_date"><p><%=post.getCreate_date() %>　<%=post.getCreate_time() %></p></div>
    	<%--投稿削除ボタン --%>
    	<%if(post.getPk_id() == loginAccount.getPk_id()){ %>
    	<form action="<%=request.getContextPath() %>/masui_jsp/delete_article" method="POST" class="post_delete">
     			<input type="hidden" name="pk_post" value="<%=post.getPk_post() %>">
				<input type="image" title="投稿を削除" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
		</form>
		<%} %>

    <div class="post_content"><p><%=post.getArticle() %></p></div>

    <%--シェア、コメント、いいね --%>
    <div class="post_icon">
    <table class="post_table">
    	<tr>
    		<td>
    <div class="table_in_icon">
     <form name="fm" action="<%=request.getContextPath() %>/masui_jsp/share" method="POST">
		<input type="hidden" name="article" value="<%=post.getArticle()%>">
		<input type="hidden" name="user_id" value="<%=post.getUser_id()%>">
		<input type="hidden" name="user_name" value="<%=post.getUsername()%>">
		<input type="image" title="シェア" src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="35px" height="35px">
		<p></p>
	</form>
	</div>
	<div class="table_in_icon solid_right click_open">
     <img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px">
     <p><%=post.getCommentList().size() %></p>
	</div>
	<div class="table_in_icon">
			<%if(post.getIsLoginAccountGood()){ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=post.getPk_post()%>">
          		<input type="hidden" name="user_id" value="<%=ubean.getUser_id()%>">
          		<input type="hidden" name="registerOrDelete" value="delete">
				<input type="image" title="いいね！を解除" src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px">
				</form>
			<%}else{ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=post.getPk_post()%>">
          		<input type="hidden" name="user_id" value="<%=ubean.getUser_id()%>">
          		<input type="hidden" name="registerOrDelete" value="register">
				<input type="image" title="いいね！" src="<%=request.getContextPath() %>/img/function_icon/no_good.png" width="30px" height="30px">
				</form>
			<%} %>
			<p><%=post.countGood() %></p>
	</div>
	<%--投稿ここまで --%>
   <%--コメント返信欄(コメントアイコンを押すと表示される)--%>
   <div class="mypage_comment_list" style="display:none">

     <%--コメント記入欄 --%>
     <div>
       <form action="<%=request.getContextPath()%>/masui_jsp/comment" method="POST">
         <div><textarea  name="comment"></textarea></div>
         <input type="hidden" name="pk_post" value="<%=post.getPk_post() %>">
         <div><input type="submit" value="送信"></div>
       </form>
     </div>
	<%for(CommentBean comment : post.getCommentList()){ %>
     <%--返信 --%>
     <div class="top_article">
     <%--アイコン--%>
     <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=comment.getUser_id()%>">
       <div class="top_icon_home">
         <img src="<%=request.getContextPath() %>/img/user_icon/<%=comment.getIcon_name() %>" width="50px" height="50px">
       </div>
       <%-- name（クリックでその人のページへ） --%>
       <p class="top_name_home"><%=comment.getUsername() %></p>
      </a>
       <div class="top_article_home top_article_homeonly">
       <%--日付 --%>
         <div><%=comment.getDate() %>　<%=comment.getTime() %></div>
       <%--削除ボタン --%>
       <%if(comment.getFk_user() == loginAccount.getPk_id()){ %>
     	<form action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST" class="comment_delete">
     			<input type="hidden" name="pk_comment" value="<%=comment.getPk_comment() %>">
     			<input type="hidden" name="fk_user" value="<%=comment.getFk_user() %>">
     			<input type="hidden" name="pk_post" value="<%=post.getPk_post()%>">
				<input type="image" title="コメントを削除" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
		</form>
		<%}%>
       <%--返信内容 --%>
         <article><%=comment.getComment() %></article>
       </div>
     </div>
     <%--返信ここまで --%>
	<%} %>
  </div>
</td>
</tr>
</table>
</div>
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