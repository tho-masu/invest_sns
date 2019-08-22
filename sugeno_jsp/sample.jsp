<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sugeno_js/modal.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/common.css">



<title>sample</title>
</head>

<body>


<%--モーダル --%>
<div class="a_modal_btn">
  <a data-target="con5" class="modal-open">
    <img src="<%=request.getContextPath() %>/img/function_icon/write.png" width="100px" height="100px">
  </a>
</div>

<div id="con5" class="modal-content" align="center">
	<%--モーダル内のコンテンツ --%>
    <form action="<%=request.getContextPath()%>/move_create" method="POST" enctype="multipart/form-data"  data-ajax="false">
		<div class="msr_textarea_02">
			<label>内容</label>
			<textarea name="article"></textarea>
		</div>
		<div class="child" align="center">
			<p class="btn">
  			<input type="submit" value="追加">
			</p>
		</div>
	</form>
    <p><a class="modal-close">閉じる</a></p>
</div>













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
<%--余白の<div> --%>
<div class="top-margin"></div>

<%--homeでフォローしたユーザーの投稿を表示する --%>
<table class="article_table">
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前 --%>
       <p class="top_name_home">name</p>
       <div class="top_article_home"><article>長期金利と短期金利逆転で景気後退かxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
       xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</article></div>
     </div>
   </td>
 </tr>

 <tr align="center">
 <%--share,comment,goodボタン（仮　できれば） --%>
   <td width="33.333%" class="solid_right">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a><div>12</div>
   </td>
   <td width="33.333%" class="solid_right">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px"></a><div>13</div>
   </td>
   <td width="33.333%">
     <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good_icon.png" width="30px" height="30px"></a><div>14</div>
   </td>
 </tr>
</table>


</body>
</html>