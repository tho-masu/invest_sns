<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%
UserBean ubean = (UserBean)request.getAttribute("ubean");
%>

<title>フォロー・フォロワー一覧</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<%--follow_list画面 --%>
<table class="follow_follower">
  <tr>
    <th class="point_top">
      <p>フォロー一覧</p>
    </th>
<%for(UserBean follow : ubean.getFollowList()){ %>
  <tr>
    <td class="follow_img">
      <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=follow.getUser_id()%>">
      	<%--ユーザのICON<a>押すとその人のユーザページへ --%>
      	<img src="<%=request.getContextPath() %>/img/user_icon/<%=follow.getIcon_name() %>" width="50px" height="50px">
      	<%--ユーザネーム <a>押すとその人のユーザページへ --%>
      	<%=follow.getUsername() %>
      </a>
    </td>
  </tr>
<%} %>
</table>


<%--follower_list画面 --%>
<table class="follow_follower">
  <tr>
    <th class="point_top">
      <p>フォロワー一覧</p>
    </th>
<%for(UserBean follower : ubean.getFollowerList()){ %>
  <tr>
    <td class="follow_img">
      <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=follower.getUser_id()%>">
      	<%--ユーザのICON<a>押すとその人のユーザページへ --%>
      	<img src="<%=request.getContextPath() %>/img/user_icon/<%=follower.getIcon_name() %>" width="50px" height="50px">
      	<%--ユーザネーム <a>押すとその人のユーザページへ --%>
      	<%=follower.getUsername() %>
      </a>
    </td>
  </tr>
<%} %>
</table>

</body>
</html>