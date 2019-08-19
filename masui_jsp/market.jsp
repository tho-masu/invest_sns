<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.util.List,database.IndustryBean,database.CommentBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>マーケット</title>
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<%
JsonNode hnode = (JsonNode)request.getAttribute("hnode");
List<IndustryBean> ilist = (List<IndustryBean>)request.getAttribute("ilist");
List<CommentBean> clist = (List<CommentBean>)(request.getAttribute("clist"));
%>

</head>

<body>

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

<br><br><br><br>

<!-- ヘッダー終わり -->


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
          borderColor: "rgba(255,0,0,1)",
          backgroundColor: "rgba(0,0,0,0)"
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

<br><br>

<table align="center" border="1" class="list industryweather">
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

<%--コメント送信 --%>
 <table class="comment_submit">
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
  <form action="<%=request.getContextPath() %>/masui_jsp/market" method="POST">
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
  <tr>
   <td class="sub" class="commentword">
    <%if(clist!=null){ %>
   <%for(CommentBean cbean : clist){ %>
    ・<%=cbean.getComment() %>　(ID:<%=cbean.getFk_user() %>　DATE:<%=cbean.getDate() %> <%=cbean.getTime() %>)
     <br>
    <%} %>
    <%} %>
   </td>
  </tr>
 </table>

<br><br><br>
<footer>
<center><font size="2">Copyright(C)2019 QUICK Corp.Allright Reserved.</font></center>
</footer>
<br>
</body>
</html>