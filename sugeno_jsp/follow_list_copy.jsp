<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%--共通項目 --%>
<jsp:include page="common_list_inhead.jsp" flush="true" />

<title>フォロー一覧</title>
</head>

<body>
<%-- 投稿ページへのボタン --%>
<div class="post_icon_function">
  <a href="<%=request.getContextPath()%>/sugeno_jsp/post_copy.jsp">
    <img src="<%=request.getContextPath() %>/img/function_icon/write.png" width="100px" height="100px">
  </a>
</div>
<br>
<header>

<!-- ヘッダーはじまり -->
<div align="center">
<a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>

</header>

<nav>
  <ul>
    <li><a href="<%=request.getContextPath() %>/">ホーム</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/market">市場</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/industry">業界</a></li>
    <li><a href="<%=request.getContextPath() %>/mypage.jsp">マイページ</a></li>
  </ul>
</nav>



<!-- ヘッダー終わり -->

<%--共通項目 --%>
<jsp:include page="common_list_inbody.jsp" flush="true" />

<%--follow_list画面 --%>
<table class="follow_follower">
  <tr>
    <th class="point_top">
      <p>フォロー一覧</p>
    </th>
  <tr>
    <td class="follow_img">
      <%--ユーザのICON --%>
      <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">

      <%--ユーザネーム <a>押すとその人のユーザページへ --%>
      <a href="">invester1</a>
    </td>
  </tr>
  <%--以下サンプル --%>
  <tr>
    <td class="follow_img">
      <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">

      <a href="">invester2</a>
    </td>
  </tr>
  <tr>
    <td class="follow_img">
      <div>
      <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
      </div>
      <a href="">invester3</a>
    </td>
  </tr>
  <tr>
    <td class="follow_img">
      <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">

      <a href="">invester4</a>
    </td>
  </tr>
</table>

</body>
</html>