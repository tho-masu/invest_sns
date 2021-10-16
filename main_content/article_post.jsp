<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sugeno_js/icon_show.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/default.css">

<title>投稿</title>

<%
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<%--mypageedit画面 --%>
<div class="profile_edit_top" style="margin-top:50px">
  <div class="profile_edit_subject">
    <p>投稿</p>
  </div>
  <div class="proedit_form">
  <%--記事投稿フォーム --%>
    <form action="<%=request.getContextPath() %>/masui_jsp/article" method="POST">
      <div>
        <%--投稿内容 --%>
        <textarea name="article"></textarea>
      </div>
      <div>
        <input type="submit" value="送信" class="profile_edit_btn">
      </div>
    </form>
  </div>
</div>


</body>
</html>