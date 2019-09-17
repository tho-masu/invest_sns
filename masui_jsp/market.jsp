<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.util.List,database.IndustryBean,database.LikeBean,database.CommentBean,database.UserBean,com.fasterxml.jackson.databind.node.ArrayNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>マーケット</title>
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sugeno_js/page_bottom.js"></script>
<%
JsonNode hnode = (JsonNode)request.getAttribute("hnode");
JsonNode nnode = (JsonNode)(request.getAttribute("nnode"));
List<IndustryBean> ilist = (List<IndustryBean>)request.getAttribute("ilist");
List<CommentBean> clist = (List<CommentBean>)(request.getAttribute("clist"));
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
ArrayNode llist =( ArrayNode)request.getAttribute("llist");
List<LikeBean> likelist = (List<LikeBean>)request.getAttribute("likelist");
%>

</head>

<body>

<%--ページボトムボタン --%>
<div id="page_bottom" style="display:block;">
  <a href="#">
    <img src="<%=request.getContextPath() %>/img/function_icon/page_bottom.png">
  </a>
</div>

<jsp:include page="header.jsp" flush="true" />

<div class=maki><p><MARQUEE width="100%" scrollamount="4"><% for(int i=0;i<nnode.size();i++){%>
		<%=nnode.get(i).get("headline").asText() %>　　　<%} %></MARQUEE></p></div>

<%--証券番号検索ボタン --%>
<div class="top_market_search">
  <h1 align="center" class="heading_title" style="margin-top:0px">証券コードを入力</h1>
  <form action="<%=request.getContextPath() %>/masui_jsp/company" method="GET">
	  <input type="tel" name="quote" maxlength="4">
	  <input type="submit" value="銘柄詳細へ">
  </form>
</div>

<%--企業名検索ボタン --%>
<div class="top_market_search">
  <h1 align="center" class="heading_title" style="margin-top:0px">企業名で検索</h1>
  <form action="<%=request.getContextPath() %>/masui_jsp/company_search" method="POST">
	  <input type="tel" name="search">
	  <input type="submit" value="検索">
  </form>
</div>

<!-- チャートを入れるテーブルはじめ -->



<h1 class="heading_title">日経平均株価（<%=hnode.get(0).get("date").asText()%>の現在までの値動き）</h1>

<table class="comment_submit">
  <tr class="sub">
    <td>
	<!-- チャートはじめ -->
     <div style="width:950px;text-align:center;margin:auto;">
       <canvas id="myLineChart"></canvas>
     </div>
<script>
  var ctx = document.getElementById("myLineChart");
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
    	  <%for(int i=0;i<hnode.size();i++){%>
    	  	<%if(i!=0){%>,<%}%>
    	  	'<%=hnode.get(i).get("time").asText()%>'
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
    		  pointBorderWidth:5,
    		  pointColor : "rgba(0,180,255,0.1)",
    		  pointStrokeColor : "rgba(255, 255, 255,1)",
              lineTension:0
        }
      ],
    },
    options: {
      title: {
        display: true,
        <%--text: '日経平均株価（<%=hnode.get(0).get("date").asText()%>の現在までの値動き）'--%>
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

<!-- チャートを入れるテーブル終わり -->

<table class="industryweather line_add">
	<tr class="industryweather_head">
		<th colspan="2">
			<div class="indust">業界</div>
			<div class="future">景気動向</div>

		</th>

	</tr>
	<% for(IndustryBean element : ilist){ %>
	<tr class="reco_info">
		<td align="center" width="70%" class="hover_word">
			<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/industry?iname=<%=element.getIname()%>"> <p style="padding-top: 20px;padding-bottom: 20px"><%=element.getIname() %></p> </a>
		</td>
		<td align="center" width="30%">
			<img src="<%=request.getContextPath() %>/img/weather/<%=element.getWeather() %>.png" height="50px">
		</td>
	</tr>
	<%} %>
</table>

<%--証券番号検索ボタン --%>
<div class="top_market_search">
  <h1 align="center" class="heading_title">優待情報を検索してください</h1>
  <form action="<%=request.getContextPath() %>/masui_jsp/yutai_search" method="POST">
	  <input class="search_box" type="text" placeholder="検索" name="search">
	        		<input class="search_btn" type="submit" id="search_button" value="優待検索">
  </form>
</div>
<h1 class="heading_title">優待人気ランキング</h1>
<table class="industryweather line_add" style="margin-top:0;">
	<tr class="industryweather_head">
		<th colspan="2">
			<div class="indust">銘柄名</div>
			<div class="future">人気数</div>

		</th>

	</tr>
<% for(int i=0;i<llist.size();i++){ %>
	<tr class="reco_info">
		<td align="center" width="70%" class=" hover_word">
			<a class="widelink" href="<%=request.getContextPath()%>/masui_jsp/company?quote=<%=llist.get(i).get("req_code").asText()%>">
			<p style="padding-top: 20px;padding-bottom: 20px"><%=llist.get(i).get("v-name").asText() %></p>
			</a>
		</td>
		<td align="center" width="30%">
			<p><%=likelist.get(i).getCount() %></p>
		</td>
	</tr>
	<%} %>
</table>



 <table class="comment_submit">
  <tr>
   <td class="sub">
   <h1 class="heading_title" id="bottom_content">コメント欄</h1>
   <form action="<%=request.getContextPath() %>/masui_jsp/comment" method="POST">
     <div><textarea name="comment"></textarea></div>
     <div><input type="submit" value="送信" class="submit_div"></div>
     </form>
   </td>
  </tr>
 </table>
<%--
<table class="comment_list">
  <tr>
   <td class="point_top"> --%>
    <h1 class="heading_title">コメント一覧</h1>
   <%--</td>
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


<br><br><br>
<footer>
<center><font size="2">Copyright(C)2019 QUICK Corp.Allright Reserved.</font></center>
</footer>
<br>
</body>
</html>