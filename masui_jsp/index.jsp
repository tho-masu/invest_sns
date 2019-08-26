<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,database.PostBean,database.CommentBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>ホーム</title>

<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
<script>
$(function(){
	$('.click_open').click(function(){
		$(this).next().next().slideToggle();
	});
})
</script>

<%
List<PostBean> plist = (List<PostBean>)request.getAttribute("plist");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />


<%--フォローしたユーザーの投稿を表示する --%>
<table class="article_table">
 <%--見出し --%>
 <tr>
   <th class="point_top" colspan="3">フォローした人の投稿</th>
 </tr>
<%for(PostBean post : plist){ %>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=post.getUser_id()%>"><img src="<%=request.getContextPath() %>/img/user_icon/<%=post.getIcon_name() %>" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前 クリックでそのユーザのページへ--%>
       <p class="top_name_home"><a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=post.getUser_id()%>"><%=post.getUsername() %></a></p>
       <div class="top_article_home">
         <div><%=post.getCreate_date() %>　<%=post.getCreate_time() %></div>
         <article>
         	<%=post.getArticle() %>
         </article>
       </div>
     </div>
   </td>
 </tr>

 <tr align="center">
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td colspan="3" width="33.333%" class="solid_right">
   <div class="table_in_icon solid_right">
     <form name="fm" action="<%=request.getContextPath() %>/masui_jsp/share" method="POST">
		<input type="hidden" name="article" value="<%=post.getArticle()%>">
		<input type="hidden" name="user_id" value="<%=post.getUser_id()%>">
		<input type="hidden" name="user_name" value="<%=post.getUsername()%>">
		<input type="image" title="シェア" src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="35px" height="35px">
	</form>
	</div>
	<div class="table_in_icon solid_right click_open">
     <img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"><div><%=post.getCommentList().size() %></div>
	</div>
	<div class="table_in_icon">
			<%if(post.getIsLoginAccountGood()){ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=post.getPk_post()%>">
          		<input type="hidden" name="registerOrDelete" value="delete">
				<input type="image" title="いいね！を解除" src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px">
				</form>
			<%}else{ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=post.getPk_post()%>">
          		<input type="hidden" name="registerOrDelete" value="register">
				<input type="image" title="いいね！" src="<%=request.getContextPath() %>/img/function_icon/no_good.png" width="30px" height="30px">
				</form>
			<%} %>
			<div><%=post.countGood() %></div>
	</div>
	<%--投稿ここまで --%>
   <%--コメント返信欄(コメントアイコンを押すと表示される)--%>
   <div style="display:none">

     <%--コメント記入欄 --%>
     <div class="response_comment">
       <form action="<%=request.getContextPath()%>/masui_jsp/comment" method="POST">
         <div><textarea  name="comment"></textarea></div>
         <input type="hidden" name="pk_post" value="<%=post.getPk_post() %>">
         <div><input type="submit" value="送信"></div>
       </form>
     </div>
	<%for(CommentBean comment : post.getCommentList()){ %>
     <%--返信 --%>
     <div class="top_article">
     <%--アイコン
       <div class="top_icon_home">
         <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
       </div>
      --%>
       <%-- name（クリックでその人のページへ） --%>
       <p class="top_name_home"><a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=comment.getUser_id()%>"><%=comment.getUsername() %></a></p>
       <div class="top_article_home top_article_homeonly">
       <%--日付 --%>
         <div><%=comment.getDate() %>　<%=comment.getTime() %></div>
       <%--返信内容 --%>
         <article><%=comment.getComment() %></article>
       </div>
     </div>
     <%--返信ここまで --%>
	<%} %>
   </div>
   </td>
 </tr>
 <%} %>
</table>

</body>
</html>