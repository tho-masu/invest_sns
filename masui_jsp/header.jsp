<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean"%>

<%
UserBean ubean = (UserBean)session.getAttribute("login_account");
%>

<!-- ヘッダーはじまり -->
<br>
<header>
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>

<nav>
  <ul>
    <li><a href="<%=request.getContextPath() %>/masui_jsp">ホーム</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/market">市場</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/industry">業界</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/mypage?user_id=<%=ubean.getUser_id()%>">マイページ</a></li>
  </ul>
</nav>
</header>

<br><br>

<!-- ヘッダー終わり -->