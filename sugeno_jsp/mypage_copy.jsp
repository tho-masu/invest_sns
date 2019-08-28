<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<%--共通項目 --%>
<jsp:include page="common_list_inhead.jsp" flush="true" />
<%--
JsonNode dnode = (JsonNode)(request.getAttribute("dnode"));
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
--%>

<title>ユーザページ</title>
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

<%--ユーザのプロフィールを表示する --%>
<table class="mypage_profile">
 <tr>
   <td colspan="4" valign="middle" class="profile_top">
     <%--ユーザのアイコン --%>
     <div class="profile_img">
     <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="100px" height="100px">
     </div>
     <div class="user_introduction">
     <%--ユーザの名前 --%>
       <p class="user_name">name</p>
     <%--ユーザの自己紹介、投資経験 --%>
       <p class="invest_histry">投資経験：5年</p>
       <p class="introduction_word">自己紹介文xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
       xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
       xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
       </p>
     </div>
     <div class="edit_profile">
       <%--プロフィール編集ボタン --%>
       <a href="<%=request.getContextPath()%>/sugeno_jsp/mypage_edit.jsp">編集</a>
     </div>

   </td>
 </tr>
 <tr align="center">
 <%--投稿数、ブックマーク数、フォロー数、フォロワー数 --%>
   <td width="25%" class="line-right">
     <p>投稿</p>
     <p>15</p>
   </td>
   <td width="25%" class="line-right">
     <p>ブックマーク</p>
     <p>15</p>
   <td width="25%" class="line-right">
     <p>フォロー</p>
     <p>15</p>
   </td>
   <td width="25%">
     <p>フォロワー</p>
     <p>15</p>
   </td>
 </tr>
</table>


<div class="post_n_bookmark">
  <%--このユーザの投稿記事一覧表示 --%>
  <div class="post_list">
    <div class="heading"><p>投稿記事</p></div>
    <%--投稿の日付、内容、コメントボタンなど --%>
    <div class="post_article_all">
      <div class="post_date"><p>2019年12月19日</p></div>
      <%--投稿削除ボタン --%>
      <%--追加 --%>
        <form action="" method="POST" class="post_delete">
          <input type="hidden" name="pk_post" value="">
		  <%--<input type="submit" name="btn" value="削除"> --%>
		  <input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	    </form><%--追加 --%>


      <div class="post_content"><p>記事内容xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p></div>
      <%--シェア、コメント、いいね数 --%>
      <div class="post_icon">
      <%--変更 --%>
        <table class="post_table">
          <tr>
            <td>

                <%--シェア、コメント、いいねアイコン --%>
                <div class="table_in_icon">
                   <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a>
                   <p>12</p>
                </div>
                <div class="table_in_icon solid_right click_open">
                  <img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px">
                  <p>13</p>
                </div>
                <div class="table_in_icon">
                  <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px"></a>
                  <p>14</p>
                </div>
                <%--コメントアイコンを押したときに表示されるもの --%>
                <div class="mypage_comment_list" style="display:none">
                  <%--コメント記入欄 --%>
                  <div class="">
                    <form action="<%=request.getContextPath()%>/" method="POST">
                      <div><textarea class="mypage_textarea"></textarea></div>
                      <div><input type="submit" value="送信"></div>
                    </form>
                  </div>
                  <%--1人目の返信 --%>
                  <div class="top_article">
                    <%--アイコン --%>
                    <div class="top_icon_home">
                      <a href="">
                        <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
                      </a>
                    </div>
                    <%-- name（クリックでその人のページへ） --%>
                    <p class="top_name_home"><a href="">namename</a></p>
                    <div class="top_article_home top_article_homeonly">
                      <%--日付 --%>
                      <div>2020-02-02</div>
                      <%--返信内容 --%>
                      <article>postpostpostpostpostpostpostpostpostpostpostpost</article>
                    </div>
                  </div>
                  <%--1人目の返信ここまで --%>

                  <%--2人目の返信 サンプル--%>
                  <div class="top_article">
                    <%--アイコン --%>
                    <div class="top_icon_home">
                      <a href="">
                        <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
                      </a>
                    </div>
                    <%-- name（クリックでその人のページへ） --%>
                    <p class="top_name_home"><a href="">namename</a></p>
                    <div class="top_article_home top_article_homeonly">
                      <%--日付 --%>
                      <div>2020-02-03</div>
                      <%--返信内容 --%>
                      <article>xxxxaaaaxxxxxxxxxxxaaaaaaaaaaa</article>
                    </div>
                  </div>
                  <%--2人目の返信ここまで --%>
                </div>
            </td>
          </tr>
        <%--変更終了 --%>


        </table>
      </div>
    </div>
    <%--投稿一つ目終了 --%>
    <%--投稿二つ目始まり --%>
    <div class="post_article_all">
      <div class="post_date"><p>2019年12月19日</p></div>
      <%--投稿削除ボタン --%>
      <%--追加 --%>
        <form action="" method="POST" class="post_delete">
          <input type="hidden" name="pk_post" value="">
		  <%--<input type="submit" name="btn" value="削除"> --%>
		  <input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	    </form><%--追加 --%>


      <div class="post_content"><p>記事内容xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx</p></div>
      <%--シェア、コメント、いいね数 --%>
      <div class="post_icon">
      <%--変更 --%>
        <table class="post_table">
          <tr>
            <td>

                <%--シェア、コメント、いいねアイコン --%>
                <div class="table_in_icon">
                   <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/share_icon.png" width="30px" height="30px"></a>
                   <p>12</p>
                </div>
                <div class="table_in_icon solid_right click_open">
                  <img src="<%=request.getContextPath() %>/img/function_icon/comment_icon.png" width="30px" height="30px">
                  <p>13</p>
                </div>
                <div class="table_in_icon">
                  <a href=""><img src="<%=request.getContextPath() %>/img/function_icon/good.png" width="30px" height="30px"></a>
                  <p>14</p>
                </div>
                <%--コメントアイコンを押したときに表示されるもの --%>
                <div class="mypage_comment_list" style="display:none">
                  <%--コメント記入欄 --%>
                  <div class="">
                    <form action="<%=request.getContextPath()%>/" method="POST">
                      <div><textarea class="mypage_textarea"></textarea></div>
                      <div><input type="submit" value="送信"></div>
                    </form>
                  </div>
                  <%--1人目の返信 --%>
                  <div class="top_article">
                    <%--アイコン --%>
                    <div class="top_icon_home">
                      <a href="">
                        <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
                      </a>
                    </div>
                    <%-- name（クリックでその人のページへ） --%>
                    <p class="top_name_home"><a href="">namename</a></p>
                    <div class="top_article_home top_article_homeonly">
                      <%--日付 --%>
                      <div>2020-02-02</div>
                      <%--返信内容 --%>
                      <article>postpostpostpostpostpostpostpostpostpostpostpost</article>
                    </div>
                  </div>
                  <%--1人目の返信ここまで --%>

                  <%--2人目の返信 サンプル--%>
                  <div class="top_article">
                    <%--アイコン --%>
                    <div class="top_icon_home">
                      <a href="">
                        <img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px">
                      </a>
                    </div>
                    <%-- name（クリックでその人のページへ） --%>
                    <p class="top_name_home"><a href="">namename</a></p>
                    <div class="top_article_home top_article_homeonly">
                      <%--日付 --%>
                      <div>2020-02-03</div>
                      <%--返信内容 --%>
                      <article>xxxxaaaaxxxxxxxxxxxaaaaaaaaaaa</article>
                    </div>
                  </div>
                  <%--2人目の返信ここまで --%>
                </div>
            </td>
          </tr>
        <%--変更終了 --%>


        </table>
      </div>
    </div>
    <%--投稿二つ目終了 --%>

  </div>

  <%--ブックマーク企業一覧表示 --%>
  <div class="bookmark_list">
    <div align="center" class="heading"><p>ブックマーク企業</p></div>
    <%--クリックでその企業ページに画面遷移 --%>
    <div class="bookmark_company"><p><a href="">AGC</a></p></div>

    <div class="bookmark_company"><p><a href="">日産</a></p></div>

  </div>
</div>


</body>
</html>