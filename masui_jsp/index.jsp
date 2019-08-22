<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,database.PostBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>ホーム</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<%
List<PostBean> plist = (List<PostBean>)request.getAttribute("plist");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<div class="post_n_bookmark">
  <%--このユーザの投稿記事一覧表示 --%>
  <div class="post_list">
    <div class="heading"><p>フォローしている人の投稿</p></div>
<%for(PostBean post : plist){ %>
    <div class="post_date"><p>
    	<%=post.getCreate_date() %>　<%=post.getCreate_time() %>　
    	<a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=post.getUser_id()%>"><%=post.getUsername() %></a>
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
				<input type="image" src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px">
			<%}else{ %>
          		<form name="fm" action="<%=request.getContextPath() %>/masui_jsp/good" method="POST">
          		<input type="hidden" name="pk_post" value="<%=post.getPk_post()%>">
          		<input type="hidden" name="registerOrDelete" value="register">
				<input type="image" src="<%=request.getContextPath() %>/img/function_icon/no_good.png" width="30px" height="30px">
				</form>
			<%} %>
			<div>14</div>
		</td>
        </tr>
      </table>
    </div>
<%} %>
  </div>
 </div>

</body>
</html>