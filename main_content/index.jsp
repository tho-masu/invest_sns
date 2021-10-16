<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,database.PostBean,database.CommentBean,database.UserBean"%>
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
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
List<PostBean> plist = (List<PostBean>)request.getAttribute("plist");
String pageNumberString = request.getParameter("page");
int pageNumber = 1;
if(pageNumberString != null){
	pageNumber = Integer.parseInt(pageNumberString);
}
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />



<%--フォローしたユーザーの投稿を表示する --%>

 <%--見出し --%>
<h1 class="heading_title">フォローした人の投稿</h1>
<table class="article_table">
<%for(int i=(pageNumber-1)*10;i<pageNumber*10;i++){ %>
<% if(pageNumber >= (plist.size() - 1)/10 + 1){ if(i >= plist.size()){break;}  } %>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">

    	<%--投稿削除ボタン --%>
    	<%if(plist.get(i).getPk_id() == loginAccount.getPk_id()){ %>
    	<form action="<%=request.getContextPath() %>/masui_jsp/delete_article" method="POST" class="post_delete">
     			<input type="hidden" name="pk_post" value="<%=plist.get(i).getPk_post() %>">
				<input class=" hover_word" type="image" title="投稿を削除" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
		</form>
		<%} %>

       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=plist.get(i).getUser_id()%>"><img src="<%=request.getContextPath() %>/img/user_icon/<%=plist.get(i).getIcon_name() %>" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前 クリックでそのユーザのページへ--%>
       <p class="top_name_home"><a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=plist.get(i).getUser_id()%>"><%=plist.get(i).getUsername() %></a></p>
       <div class="top_article_home">
         <div><%=plist.get(i).getCreate_date() %>　<%=plist.get(i).getCreate_time() %></div>

         <article>
         	<%=plist.get(i).getArticle() %>
         </article>
       </div>
     </div>
   </td>
 </tr>

 <tr align="center">
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td colspan="3" width="33.333%">
   <div class="table_in_icon">
     <form name="fm" action="<%=request.getContextPath() %>/masui_jsp/share" method="POST">
		<input type="hidden" name="article" value="<%=plist.get(i).getArticle()%>">
		<input type="hidden" name="user_id" value="<%=plist.get(i).getUser_id()%>">
		<input type="hidden" name="user_name" value="<%=plist.get(i).getUsername()%>">
		<input type="image" title="シェア" class=" hover_word" src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="35px" height="35px">
	</form>
	</div>
	<div class="table_in_icon solid_right click_open">
     <img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"><div><%=plist.get(i).getCommentList().size() %></div>
	</div>
	<div class="table_in_icon">
			<%if(plist.get(i).getIsLoginAccountGood()){ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=plist.get(i).getPk_post()%>">
          		<input type="hidden" name="registerOrDelete" value="delete">
				<input type="image" class=" hover_word" title="いいね！を解除" src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px">
				</form>
			<%}else{ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=plist.get(i).getPk_post()%>">
          		<input type="hidden" name="registerOrDelete" value="register">
				<input type="image" class=" hover_word" title="いいね！" src="<%=request.getContextPath() %>/img/function_icon/no_good.png" width="30px" height="30px">
				</form>
			<%} %>
			<div><%=plist.get(i).countGood() %></div>
	</div>
	<%--投稿ここまで --%>
   <%--コメント返信欄(コメントアイコンを押すと表示される)--%>
   <div style="display:none;clear:both;">

     <%--コメント記入欄 --%>
     <div class="response_comment">
       <form action="<%=request.getContextPath()%>/masui_jsp/comment" method="POST">
         <div><textarea  name="comment"></textarea></div>
         <input type="hidden" name="pk_post" value="<%=plist.get(i).getPk_post() %>">
         <div><input type="submit" value="送信"></div>
       </form>
     </div>
	<%for(CommentBean comment : plist.get(i).getCommentList()){ %>
     <%--返信 --%>
     <div class="top_article">
     <%--アイコン--%>
     <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=comment.getUser_id()%>">
       <div class="top_icon_home">
         <img src="<%=request.getContextPath() %>/img/user_icon/<%=comment.getIcon_name() %>" width="50px" height="50px">
       </div>
       <%-- name（クリックでその人のページへ） --%>
       <p class="top_name_home hover_word"><%=comment.getUsername() %></p>
      </a>
      <%--削除ボタン --%>
       <%if(comment.getFk_user() == loginAccount.getPk_id()){ %>
     	<form action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST" class="comment_delete">
     			<input type="hidden" name="pk_comment" value="<%=comment.getPk_comment() %>">
     			<input type="hidden" name="fk_user" value="<%=comment.getFk_user() %>">
     			<input type="hidden" name="pk_post" value="<%=plist.get(i).getPk_post()%>">
				<input type="image" title="コメントを削除" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
		</form>
		<%}%>
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

<%if(plist.size() >= 11){ %>
<br>
<center>

<% for(int i=0;i<(plist.size() - 1)/10 + 1;i++){%>
	<%if(i+1 != pageNumber){ %>
		<a href="<%=request.getContextPath()%>/masui_jsp/?page=<%=i+1%>"><%=i+1 %></a>
	<%}else{ %>
		<span><%=i+1 %></span>
	<%} %>
<%} %>
</center>
<%} %>

<br><br><br>
<footer>
<center><font size="2">Copyright(C)2019 QUICK Corp.Allright Reserved.</font></center>
</footer>
<br>

</body>
</html>