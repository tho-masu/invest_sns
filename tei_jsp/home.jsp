<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/common.css">
<link href="<%=request.getContextPath()%>/sugeno_css/default.css" rel="stylesheet" type="text/css">
<%
JsonNode nnode = (JsonNode)(request.getAttribute("nnode"));
%>

<title>ホーム</title>
</head>

<body>

<jsp:include page="header.jsp" flush="true" />


<!-- ヘッダー終わり -->
<%--homeでフォローしたユーザーの投稿を表示する --%>


<div class=maki><p><MARQUEE width="100%" scrollamount="4"><FONT color="#000099"><% for(int i=0;i<nnode.size();i++){%>
		<%=nnode.get(i).get("headline").asText() %><%} %></FONT></MARQUEE></p></div>

<table border="1">
 <tr>
   <td colspan="3" valign="middle">
     <%--フォローしたユーザのアイコン --%>
     <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
     <%--フォローしたユーザの名前 --%>
     <span>name</span>
   </td>
 </tr>
 <tr>
   <td colspan="3">
   <%--フォローしたユーザの記事 --%>
     <article>長期金利と短期金利逆転で景気後退か</article>
   </td>
 </tr>
 <tr align="center">
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td width="33.333%">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png"></a><span>12</span>
   </td>
   <td width="33.333%">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png"></a><span>13</span>
   </td>
   <td width="33.333%">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good_icon.png"></a><span>14</span>
   </td>
 </tr>
</table>


</body>
</html>