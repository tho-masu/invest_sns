<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.lang.Math,java.util.List,java.util.Date,java.sql.Time,database.CommentBean,database.UserBean,database.PostBean,database.YutaiBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<%
JsonNode dnode = (JsonNode)(request.getAttribute("dnode"));
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
JsonNode nnode = (JsonNode)(request.getAttribute("nnode"));
List<CommentBean> clist = (List<CommentBean>)(request.getAttribute("clist"));
boolean isRegisteredBookmark = (boolean)request.getAttribute("isRegisteredBookmark");
boolean isRegisteredLike=(boolean)request.getAttribute("isRegisteredLike");
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
List<PostBean> plist = (List<PostBean>)request.getAttribute("companyPosts");
YutaiBean yinfo = (YutaiBean)request.getAttribute("yinfo");
%>
<title>[<%=dnode.get("req_code").asText() %>] <%=dnode.get("v-name").asText() %></title>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sugeno_js/read_more.js"></script>
<script>
$(function(){
	$('.click_open').click(function(){
		$(this).next().next().slideToggle();
	});
})
</script>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/hint.css" rel="stylesheet" type="text/css">

<body>

<jsp:include page="header.jsp" flush="true" />

<div id="all_table">

 <%-- 企業の名前、株価、簡単な紹介 --%>
 <table id="top_table" class="line_add">
   <tr>
     <td colspan="4" align="center" id="top_company"><%=dnode.get("v-name").asText() %>（<%=dnode.get("price").asDouble() %>円）</td>
   </tr>
   <tr class="top_sub">
     <td rowspan="3" width="40%">
     <%if(dnode.get("price_chg").asDouble()>0){ %>
       <p>前日比：<font color="red">+<%=dnode.get("price_chg").asDouble() %>円(+<%=dnode.get("price_pchg").asDouble() %>%)</font></p>

     <%} else if(dnode.get("price_chg").asDouble()<0){ %>
       <p>前日比：<font color="blue"><%=dnode.get("price_chg").asDouble() %>円(<%=dnode.get("price_pchg").asDouble() %>%)</font></p>

     <%} else{ %>
       <p>前日比：<%=dnode.get("price_chg").asDouble() %>円(<%=dnode.get("price_pchg").asDouble() %>%)</p>

     <%} %>
     </td>
     <td align="left" width="40%">お買い<font color="blue">損</font>度（
     <%-- 用語説明を追加 --%>
     <span class="hint--top hint--rounded" data-hint="Price Earnings Ratioの略称で和訳は株価収益率">PER<jsp:include page="question.jsp" flush="true" /></span>
     )：<%=dnode.get("co_per").asDouble() %></td>
     <td rowspan="3" align="right" width="20%" style="border-right: 1px solid #a9a9a9;">

     <% if(!isRegisteredBookmark){%>
     	<form action="<%=request.getContextPath() %>/masui_jsp/bookmark" method="POST">
			<input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
			<input type="hidden" name="registerOrDelete" value="register">
			<%--div><input type="submit" value="bookmarkに登録" align="center"></div> --%>
			<div align="center"><input type="image" title="bookmarkに登録" src="<%=request.getContextPath()%>/img/function_icon/not_bookm.png" width="40px" height="40px"></div>
		</form>
	<%}else{ %>
		<form action="<%=request.getContextPath() %>/masui_jsp/bookmark" method="POST">
			<input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
			<input type="hidden" name="registerOrDelete" value="delete">
			<%--div><input type="submit" value="bookmarkから削除" align="center"></div>--%>
			<div align="center"><input type="image" title="bookmarkから削除" src="<%=request.getContextPath()%>/img/function_icon/bookm.png" width="40px" height="40px"></div>
		</form>
	<%} %>

     </td>
   </tr>
   <tr class="top_sub">
     <td align="left" width="40%">お買い<font color="red">得</font>度（1/PER)：<%=(double)Math.round( 10000/(dnode.get("co_per").asDouble()) ) / 10000 %></td>
   </tr>
   <tr class="top_sub">
     <td align="left" width="40%">企業の稼ぐ力（
      <%-- 用語説明を追加 --%>
     <span class="hint--top hint--rounded" data-hint="Return On Equityの略称で和訳は自己資本利益率">ROE<jsp:include page="question.jsp" flush="true" /></span>
     )：<%=dnode.get("co_settle_roe").asDouble() %></td>
   </tr>
 </table>

 <%-- チャート --%>
 <h1 class="heading_title">チャート</h1>

 <table class="chart">
  <%--チャート期間変更ボタン --%>
  <tr class="sub">
   <td align="center" height="50px">
   <div id="chartbtn_margin">
    <a class="cp_btn" href="company?quote=<%=dnode.get("req_code").asText()%>&days=7">7日間</a>
   	<a class="cp_btn" href="company?quote=<%=dnode.get("req_code").asText()%>&days=30">30日間</a>
   </div>

 <!-- チャートはじめ -->

 <canvas id="myLineChart"></canvas>

<script>
  var ctx = document.getElementById("myLineChart");
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
    	  <%for(int i=0;i<hnode.size();i++){%>
    	  	<%if(i!=0){%>,<%}%>
    	  	'<%=hnode.get(i).get("start_date").asText()%>'
    	  <%}%>
    	  ],
      datasets: [
        {
          label: '株価',
          data: [
        	  <%for(int i=0;i<hnode.size();i++){%>
      	  	<%if(i!=0){%>,<%}%>
      	  	<%=hnode.get(i).get("price").asDouble()%>
      	  <%}%>
        	  ],
          borderColor: "#66ccff",
          borderWidth:5,
          fillColor : "rgba(0,180,255,0.1)",
          backgroundColor:"rgba(0,180,255,0.1)",
          strokeColor:"rgba(0,180,255,0.1)",
          //pointBackgroundColor: "rgba(0,180,255,0.1)",
          //pointBorderColor : "rgba(255, 255, 255,1)"",
		  pointBorderWidth:10,
		  pointColor : "rgba(0,180,255,0.1)",
		  pointStrokeColor : "rgba(255, 255, 255,1)",
          lineTension:0
        }
      ],
    },
    options: {
      title: {
        display: true,
        text: '直近<%=hnode.size()%>営業日の株価（終値）'
      },
      scales: {
        yAxes: [{
          ticks: {
            callback: function(value, index, values){
              return  value +  '円'
            }
          }
        }]
      },
    }
  });
  </script>

  <!-- チャート終わり -->

   </td>
  </tr>

  </table>

 <%-- 注目ポイント --%>
 <h1 class="heading_title">注目ポイント</h1>
  <table class="attention_point">
  <%--
  <tr>
   <th align="center"colspan="2" class="point_top">注目ポイント</th>

  </tr> --%>
  <tr>
   <th width="30%" class="sub_point">会社の名前（和）</th>
   <td><%=dnode.get("v-name").asText() %></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">会社の名前（英）</th>
   <td><%=dnode.get("v-name_en").asText()%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">一年間の成績発表月（決算期）</th>
   <td><%=dnode.get("co_settle_fy_ended").asText()%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">企業の大きさ（時価総額）</th>
   <td><%=dnode.get("marketcap").asText()%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">株主に渡す一部の利益（配当金）</th>
   <td><%=dnode.get("co_settle_dps").asText()%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">株主への利益還元率(%)（配当性向）</th>
   <td><%=dnode.get("co_settle_dividend_payout").asText() %></td>
  </tr>
  </table>

<%if(plist != null){ %>
<%if(!(plist.isEmpty())){ %>
<%--企業の投稿を表示する --%>
 <h1 class="heading_title">この企業からの投稿</h1>
<table class="article_table line_add">
 <%--見出し --%>
 <%--
 <tr>
   <th class="point_top" colspan="3">この企業からの投稿</th>
 </tr>
  --%>
<%for(int i=0;i<plist.size();i++){ %>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=plist.get(i).getUser_id()%>"><img src="<%=request.getContextPath() %>/img/user_icon/<%=plist.get(i).getIcon_name() %>" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前 クリックでそのユーザのページへ--%>
       <p class="top_name_home"><a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=plist.get(i).getUser_id()%>"><%=plist.get(i).getUsername() %></a></p>
       <div class="top_article_home">
         <div><%=plist.get(i).getCreate_date() %>　<%=plist.get(i).getCreate_time() %></div>
         <article>
         	<%=plist.get(i).getArticle() %>
         </article>
       </div>
     </div>
   </td>
 </tr>

 <tr align="center">
   <td colspan="3" width="33.333%">

	<%--投稿ここまで --%>
   <%--コメント返信欄(コメントアイコンを押すと表示される)--%>
   <div style="display:none">

     <%--コメント記入欄 --%>
     <div class="response_comment">
       <form action="<%=request.getContextPath()%>/masui_jsp/comment" method="POST">
         <div><textarea  name="comment"></textarea></div>
         <input type="hidden" name="pk_post" value="<%=plist.get(i).getPk_post() %>">
         <div><input type="submit" value="送信"></div>
       </form>
     </div>
	<%for(CommentBean comment : plist.get(i).getCommentList()){ %>
     <%--返信 --%>
     <div class="top_article">
     <%--アイコン--%>
     <a href="<%=request.getContextPath()%>/masui_jsp/mypage?user_id=<%=comment.getUser_id()%>">
       <div class="top_icon_home">
         <img src="<%=request.getContextPath() %>/img/user_icon/<%=comment.getIcon_name() %>" width="50px" height="50px">
       </div>
       <%-- name（クリックでその人のページへ） --%>
       <p class="top_name_home"><%=comment.getUsername() %></p>
      </a>
       <div class="top_article_home top_article_homeonly">
       <%--日付 --%>
         <div><%=comment.getDate() %>　<%=comment.getTime() %></div>
       <%--削除ボタン --%>
       <%if(comment.getFk_user() == loginAccount.getPk_id()){ %>
     	<form action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST" class="comment_delete">
     			<input type="hidden" name="pk_comment" value="<%=comment.getPk_comment() %>">
     			<input type="hidden" name="fk_user" value="<%=comment.getFk_user() %>">
     			<input type="hidden" name="pk_post" value="<%=plist.get(i).getPk_post()%>">
				<input type="image" title="コメントを削除" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
		</form>
		<%}%>
       <%--返信内容 --%>
         <article><%=comment.getComment() %></article>
       </div>
     </div>
     <%--返信ここまで --%>
	<%} %>
   </div>
   </td>
 </tr>
 <%} %>
</table>
<%} %>
<%} %>

<%--優待情報 --%>
<table class="comment_list">
  <tr>
   <td class="yutaihead">

      <h1>優待情報</h1>
      <%--ハートのお気に入り登録ボタン --%>
      <%if (yinfo!=null){%>
       <% if(!isRegisteredLike){%>
     	<form action="<%=request.getContextPath() %>/tei_java/like" method="POST"  class="yutai_form">
			<input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
			<input type="hidden" name="registerOrDelete" value="register">
            <input type="image" title="お気に入り登録" src="<%=request.getContextPath()%>/img/function_icon/unheart.png" width="50px" height="50px" class="yutai_good">
		</form>
	<%}else{ %>
		<form action="<%=request.getContextPath() %>/tei_java/like" method="POST" class="yutai_form">
			<input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
			<input type="hidden" name="registerOrDelete" value="delete">
			<input type="image" title="お気に入りから削除" src="<%=request.getContextPath()%>/img/function_icon/heart.png" width="50px" height="50px" class="yutai_good">
		</form>
	<%}} %>

   </td>
  </tr>
  <tr>
   <%--優待内容 --%>
   <td class="sub line_add" id="yutai_content">
   <%if (yinfo!=null){%>
     <div class="main onhidden">
       <div class="text">
         <h2>権利確定月</h2>
         <div><%=yinfo.getSubfld() %></div>
         <h2>優待内容</h2>
         <div><%=yinfo.getTitle() %></div>
       </div>
       <div class="readmore">
         <span>続きを読む</span>
       </div>
     </div>
   <%}else{%>
     <p style="padding-top:20px;">優待情報なし</p>
     <%}%>
   </td>
  </tr>
 </table>

 <%-- 今日のニュースはじめ --%>
 <h1 class="heading_title">今日の関連ニュース</h1>
<table class="comment_list  line_add">
<%--
  <tr>
   <td class="point_top">
    今日の関連ニュース
   </td>
  </tr> --%>
  <tr>
   <td class="sub" id="commentword">
<%if(nnode==null){ %>
	今日のニュースはありません
<%}else{ %>
	<% for(int i=0;i<nnode.size();i++){%>
		<%=nnode.get(i).get("headline").asText() %>
		<!-- 折り畳み展開ポインタ -->
		<div onclick="obj=document.getElementById('open<%=i %>').style; obj.display=(obj.display=='none')?'block':'none';">
		<a style="cursor:pointer;">▼ クリックで展開</a>
		</div>
		<!--// 折り畳み展開ポインタ -->

		<!-- 折り畳まれ部分 -->
		<div id="open<%=i %>" style="display:none;clear:both;">

		<!--ここの部分が折りたたまれる＆展開される部分になります。
		自由に記述してください。-->
		<%=nnode.get(i).get("article").asText() %>

		</div>
		<!--// 折り畳まれ部分 -->
		<br>
		<%} %>
<%} %>
   </td>
  </tr>
 </table>

 <%-- 今日のニュース終わり --%>


 <%--コメント送信 --%>
 <table class="comment_submit">
 <%--
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
   --%>
  <tr>
   <td class="sub">
   <h1 class="heading_title">コメント欄</h1>
     <form action="<%=request.getContextPath() %>/masui_jsp/comment" method="POST">
     <div><textarea name="comment"></textarea></div>
     <input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
     <div><input type="submit" value="送信" align="center"></div>
     </form>
   </td>
  </tr>
 </table>
<%--
<table class="comment_list">
  <tr>
   <td class="point_top"> --%>
     <h1 class="heading_title">コメント一覧</h1>
     <%--
   </td>
  </tr>
 </table> --%>
<%if(clist!=null){ %>
 <%--コメントとコメントした人の名前やアイコン --%>
<table class="article_table">
 <%--コメント --%>
  <%for(CommentBean cbean : clist){ %>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href="<%=request.getContextPath() %>/masui_jsp/mypage?user_id=<%=cbean.getUser_id()%>"><img src="<%=request.getContextPath() %>/img/user_icon/<%=cbean.getIcon_name() %>" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前クリックでそのユーザのページへ --%>
       <p class="top_name_home"><a href="<%=request.getContextPath() %>/masui_jsp/mypage?user_id=<%=cbean.getUser_id()%>"><%=cbean.getUsername() %></a></p>

	<%if(loginAccount.getPk_id() == cbean.getFk_user()){ %>
       <%--追加(削除ボタン) --%>
       <form class="comment_delete" action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST">
        	<input type="hidden" name="pk_comment" value="<%=cbean.getPk_comment() %>">
     		<input type="hidden" name="fk_user" value="<%=cbean.getFk_user() %>">
     		<input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
		 	<input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	   </form>
	   <%--追加ここまで --%>
	 <%} %>

       <div class="top_article_home">
         <div><%=cbean.getDate() %> <%=cbean.getTime() %></div>
         <article>
         	<%=cbean.getComment() %>
         </article>
        </div>
     </div>
   </td>
 </tr>
 <%--コメント終了 --%>
 <%} %>
</table>
<%} %>

</div>
</body>
</html>