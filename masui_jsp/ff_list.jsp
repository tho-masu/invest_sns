<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
%>

<title>フォロー・フォロワー一覧</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<table border="1">
	<tr>
		<td>
			フォロー一覧
		</td>
	</tr>
	<%for(UserBean follow : loginAccount.getFollowList()){ %>
	<tr>
		<td>
			<a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=follow.getUser_id()%>"><%=follow.getUsername() %></a>
		</td>
	</tr>
	<%} %>
</table>

<table border="1">
	<tr>
		<td>
			フォロワー一覧
		</td>
	</tr>
	<%for(UserBean follower : loginAccount.getFollowerList()){ %>
	<tr>
		<td>
			<a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=follower.getUser_id()%>"><%=follower.getUsername() %></a>
		</td>
	</tr>
	<%} %>
</table>

</body>