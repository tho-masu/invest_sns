<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean"%>

<%
UserBean ubean = (UserBean)session.getAttribute("login_account");
%>

<!-- ヘッダーはじまり -->
<br>
<header>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/tei_css/common.css">
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>

<div class="button_second" id="btn_search_">
	        	<form action="<%=request.getContextPath()%>/tei_java/search" method="POST">
	        		<input class="search_box" type="text" placeholder="検索" name="search">
	        		<input class="search_btn" type="submit" id="search_button" value="友達検索">
	        	</form>
</div>
<div class="follow_img" >
<a href="<%=request.getContextPath() %>/tei_java/mayfollow?pk_id=<%=ubean.getPk_id()%>"><img src="<%=request.getContextPath() %>/img/function_icon/follow.png" width="45px"></a>
</div>

<div class="header_contents">
<nav>
  <ul>
    <li><a href="<%=request.getContextPath() %>/masui_jsp">ホーム</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/market">市場</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/industry">業界</a></li>
    <li><a href="<%=request.getContextPath() %>/tei_java/mypage?user_id=<%=ubean.getUser_id()%>">マイページ</a></li>
  </ul>
</nav>
</div>
</header>

<br><br>

<!-- ヘッダー終わり -->