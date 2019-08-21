<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/tei_js/modal.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/common.css">
<link href="<%=request.getContextPath()%>/sugeno_css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/tei_css/modal.css" rel="stylesheet" type="text/css">
<%--
JsonNode dnode = (JsonNode)(request.getAttribute("dnode"));
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
--%>

<title>ホーム</title>
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<%--homeでフォローしたユーザーの投稿を表示する --%>
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

<%--モーダルのボタン --%>
<div class="a_modal_btn">
<a data-target="con5" class="modal-open"><img src="<%=request.getContextPath()%>/img/function_icon/write.png" width="90px" height="90px"></a>
</div>

<div id="con5" class="modal-content" align="center">
	<%--モーダル内のコンテンツ --%>
	<form action="<%=request.getContextPath()%>/post_create" method="POST" enctype="multipart/form-data"  data-ajax="false">

    <div class="msr_text_02">
<label>内容</label>
			<textarea name="article"></textarea>
		</div>
		<div class="child" align="center">
			<p class="btn">
  			<input type="submit" value="発表">
			</p>
		</div>
	</form>
    <p><a class="modal-close">閉じる</a></p>
</div>

</body>
</html>