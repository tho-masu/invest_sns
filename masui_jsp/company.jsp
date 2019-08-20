<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.lang.Math,java.util.List,java.util.Date,java.sql.Time,database.CommentBean"%>
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
%>

<title>[<%=dnode.get("req_code").asText() %>] <%=dnode.get("v-name").asText() %></title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<div id="all_table">

 <%-- 企業の名前、株価、簡単な紹介 --%>
 <table id="top_table" border="0">
   <tr>
     <td colspan="4" align="center" id="top_company"><%=dnode.get("v-name").asText() %>（<%=dnode.get("price").asDouble() %>円）</td>
   </tr>
   <tr class="top_sub">
     <td rowspan="3" width="40%">簡単紹介</td>
     <td align="left">お買い<font color="red">損</font>度（PER)：<%=dnode.get("co_per").asDouble() %></td>
     <td rowspan="3" align="right" width="15%">

     <% if(!isRegisteredBookmark){%>
     	<form action="<%=request.getContextPath() %>/masui_jsp/bookmark" method="POST">
			<input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
			<input type="hidden" name="registerOrDelete" value="register">
			<div><input type="submit" value="bookmarkに登録" align="center"></div>
		</form>
	<%}else{ %>
		<form action="<%=request.getContextPath() %>/masui_jsp/bookmark" method="POST">
			<input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
			<input type="hidden" name="registerOrDelete" value="delete">
			<div><input type="submit" value="bookmarkから削除" align="center"></div>
		</form>
	<%} %>

     </td>
   </tr>
   <tr class="top_sub">
     <td align="left">お買い<font color="blue">得</font>度（1/PER)：<%=(double)Math.round( 10000/(dnode.get("co_per").asDouble()) ) / 10000 %></td>
   </tr>
   <tr class="top_sub">
     <td align="left">企業の稼ぐ力（ROE)：<%=dnode.get("co_settle_roe").asDouble() %></td>
   </tr>
 </table>

 <%-- チャート --%>
 <table class="chart">
  <%--見出し --%>
  <tr><td align="center" class="point_top">チャート</td></tr>
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
          borderColor: "rgba(255,0,0,1)",
          backgroundColor: "rgba(0,0,0,0)"
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
  <table class="attention_point">
  <tr>
   <th align="center"colspan="2" class="point_top">注目ポイント</th>

  </tr>
  <tr>
   <th width="30%" class="sub_point">会社のお名前（和）</th>
   <td><%=dnode.get("v-name").asText() %></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">会社のお名前（英）</th>
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


 <%-- 今日のニュースはじめ --%>
<table class="comment_list">
  <tr>
   <td class="point_top">
    今日の関連ニュース
   </td>
  </tr>
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
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
  <form action="<%=request.getContextPath() %>/masui_jsp/comment" method="POST">
  <tr>
   <td class="sub">
     <div><textarea name="comment"></textarea></div>
     <input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
     <div><input type="submit" value="送信" align="center"></div>
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
  <tr>
   <td class="sub" id="commentword">
   <%if(clist!=null){ %>
   <%for(CommentBean cbean : clist){ %>
    ・<%=cbean.getComment() %>　(名前:<%=cbean.getUsername() %>　日付:<%=cbean.getDate() %> <%=cbean.getTime() %>)
     <form action="<%=request.getContextPath() %>/masui_jsp/delete_comment" method="POST">
     			<input type="hidden" name="pk_comment" value="<%=cbean.getPk_comment() %>">
     			<input type="hidden" name="fk_user" value="<%=cbean.getFk_user() %>">
     			<input type="hidden" name="quote" value="<%=dnode.get("req_code").asText() %>">
				<input type="submit" name="btn" value="削除">
	</form>
	<br>
    <%} %>
    <%} %>
   </td>
  </tr>
 </table>

</div>
</body>
</html>