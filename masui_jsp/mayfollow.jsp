<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<%@ page import="database.*"%>
<%@ page import="api.*"%>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/default.css">

<title>友だち追加しましょう</title>
</head>
<body>
<%-- 投稿ページへのボタン --%>
<div class="post_icon_function">
  <a href="<%=request.getContextPath()%>/sugeno_jsp/post_copy.jsp">
    <img src="<%=request.getContextPath() %>/img/function_icon/write.png" width="100px" height="100px">
  </a>
</div>


<jsp:include page="header.jsp" flush="true" />

<%--follow_list画面 --%>

<h1 class="heading_title">おすすめの友だち</h1>
<table class="follow_follower">
<%
List<UserBean> uList = (List<UserBean>)request.getAttribute("uList");
if(uList != null){
	for(int i=0;i<uList.size();i++){
		UserBean ubean = uList.get(i);
%>
  <tr>
    <td class="follow_img">
      <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=ubean.getUser_id()%>">
        <%--ユーザのICON<a>押すとその人のユーザページへ --%>
        <img src="<%=request.getContextPath() %>/img/user_icon/<%=ubean.getIcon_name() %>" width="50px" height="50x">
        <%--ユーザネーム　<a>でその人のユーザページへ --%>
        <span><%=ubean.getUsername() %></span>
      </a>
    </td>
  </tr>
  <%}} %>
  <%--以下サンプル --%>
</table>


</body>
</html>