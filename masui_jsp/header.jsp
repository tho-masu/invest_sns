<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="database.UserBean,java.util.List"%>

<%
UserBean ubean = (UserBean)session.getAttribute("login_account");
List<StringBuffer> pageHistory = (List<StringBuffer>)session.getAttribute("pageHistory");
%>

<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
<script>
jQuery(function() {
    var pagetop = $('#page_top');
    pagetop.hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {  //100pxスクロールしたら表示
            pagetop.fadeIn();
        } else {
            pagetop.fadeOut();
        }
    });
    pagetop.click(function () {
        $('body,html').animate({
            scrollTop: 0
        }, 500); //0.5秒かけてトップへ移動
        return false;
    });
});

</script>

<!-- ヘッダーはじまり -->
<br>
<header>
<div align="center">
<a href="<%=request.getContextPath() %>/masui_jsp/"><img src="<%=request.getContextPath() %>/img/investagram.png" width="240px"></a>
</div>

<div class="button_second" id="btn_search_">
	        	<form action="<%=request.getContextPath()%>/masui_jsp/search" method="POST">
	        		<input class="search_box" type="text" placeholder="検索" name="search">
	        		<input class="search_btn" type="submit" id="search_button" value="友達検索">
	        	</form>
</div>
<div class="follow_img_head" >
<a href="<%=request.getContextPath() %>/masui_jsp/mayfollow?pk_id=<%=ubean.getPk_id()%>"><img src="<%=request.getContextPath() %>/img/function_icon/follow.png" width="45px"></a>
</div>

<%--ログアウトボタン --%>
<div class="log_out_btn">
	<form action="<%=request.getContextPath()%>/logout" method="POST">
		<input type="submit" value="ログアウト">
	</form>
</div>

<div class="header_contents">
<nav>
  <ul>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/">ホーム</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/market">市場</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/industry">業界</a></li>
    <li><a href="<%=request.getContextPath() %>/masui_jsp/mypage?user_id=<%=ubean.getUser_id()%>">マイページ</a></li>
  </ul>
</nav>
</div>
</header>

<br><br>

<!-- ヘッダー終わり -->

<%-- ページトップへ行くボタン表示 --%>
<div id="page_top"><a href="#"><img src="/invest_sns/img/function_icon/toppage.png"></a></div>

<%-- 投稿ページへのボタン --%>
<div class="post_icon_function">
  <a href="<%=request.getContextPath()%>/masui_jsp/article_post.jsp">
    <img src="<%=request.getContextPath() %>/img/function_icon/write.png" width="100px" height="100px" title="つぶやきの投稿">
  </a>
</div>