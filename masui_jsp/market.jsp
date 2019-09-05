<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.util.List,database.IndustryBean,database.CommentBean,database.UserBean,com.fasterxml.jackson.databind.node.ArrayNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>マーケット</title>
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/sugeno_js/table_open.js"></script>
<%
JsonNode hnode = (JsonNode)request.getAttribute("hnode");
List<IndustryBean> ilist = (List<IndustryBean>)request.getAttribute("ilist");
List<CommentBean> clist = (List<CommentBean>)(request.getAttribute("clist"));
UserBean loginAccount = (UserBean)session.getAttribute("login_account");
ArrayNode llist =( ArrayNode)request.getAttribute("llist");
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<%--証券番号検索ボタン --%>
<div class="top_market_search">
  <p align="center">証券コードを入力してください</p>
  <form action="<%=request.getContextPath() %>/masui_jsp/company" method="GET">
	  <input type="tel" name="quote" maxlength="4">
	  <input type="submit" value="銘柄詳細へ">
  </form>
</div>

<!-- チャートを入れるテーブルはじめ -->

<table width="800px" align="center">
  <tr>
    <td class="point_top">日経平均株価（今日の現在までの値動き）</td>
  </tr>
  <tr class="sub">
    <td>
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
              fillColor : "rgba(0,180,255,0.1)",
              fullColor:"rgba(0,180,225,0.1)"
        }
      ],
    },
    options: {
      title: {
        display: true,
        text: '日経平均株価（<%=hnode.get(0).get("date").asText()%>の現在までの値動き）'
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

<table border="1" class="industryweather">
	<tr class="industryweather_head">
		<th width="70%">
			業界
		</th>
		<th width="30%">
			景気動向
		</th>
	</tr>
	<% for(IndustryBean element : ilist){ %>
	<tr class="reco_info">
		<td align="center">
			<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/industry?iname=<%=element.getIname()%>"> <p style="padding-top: 20px;padding-bottom: 20px"><%=element.getIname() %></p> </a>
		</td>
		<td align="center">
			<img src="<%=request.getContextPath() %>/img/weather/<%=element.getWeather() %>.png" height="50px">
		</td>
	</tr>
	<%} %>
</table>

 <%--ブックマーク企業一覧表示 --%>
  <table class="follow_follower">
  <tr>
    <td class="point_top">株主優待人気ランキング上位10</td>
  </tr>
  <% for(JsonNode jnode : llist){%>
  <tr>
   <td class="bookmark_good">
    <a href="<%=request.getContextPath()%>/masui_jsp/company?quote=<%=jnode.get("req_code").asText()%>"><%=jnode.get("v-name").asText() %></a>
   </td>
  </tr>
  <%} %>
 </table>

<%--コメント送信 --%>
 <table class="comment_submit">
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
  <form action="<%=request.getContextPath() %>/masui_jsp/comment" method="POST">
  <tr>
   <td class="sub">
     <div><textarea name="comment"></textarea></div>
     <div><input type="submit" value="送信" align="center" class="submit_div"></div>
   </td>
  </tr>
  </form>
 </table>


<table class="comment_list">
  <tr>
   <td class="point_top">
    コメント一覧
   </td>
  </tr>
 </table>
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

       <%--追加(削除ボタン) --%>
       <form class="comment_delete" action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST">
        	<input type="hidden" name="pk_comment" value="<%=cbean.getPk_comment() %>">
     		<input type="hidden" name="fk_user" value="<%=cbean.getFk_user() %>">
		 	<input type="image" src="<%=request.getContextPath()%>/img/function_icon/delete.png" width="20px" height="20px">
	   </form>
	   <%--追加ここまで --%>

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