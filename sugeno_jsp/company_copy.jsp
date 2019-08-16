<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/sugeno_css/common.css">
<link href="<%=request.getContextPath()%>/sugeno_css/default.css" rel="stylesheet" type="text/css">
<%--
JsonNode dnode = (JsonNode)(request.getAttribute("dnode"));
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
--%>

<title>[<%--=dnode.get("req_code").asText() --%>] <%--=dnode.get("v-name").asText() --%></title>
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
<div id="all_table">
 <%-- 企業の名前、株価、簡単な紹介 --%>
 <table id="top_table" border="0">
   <tr>
     <td colspan="4" align="center" id="top_company">企業名（株価）</td>
   </tr>
   <tr class="top_sub">
     <td rowspan="2" align="left" width="15%">weather</td>
     <td rowspan="2" width="40%">簡単紹介</td>
     <td align="left">お買い得度（PER)：</td>
     <td rowspan="2" align="right" width="15%">book</td>
   </tr>
   <tr class="top_sub">
     <td align="left">企業の稼ぐ力（ROE)：</td>

   </tr>
 </table>

 <%-------- チャート --------%>
 <table class="chart">
  <%--見出し --%>
  <tr><td align="center" class="point_top">チャート</td></tr>
  <%--チャート期間変更ボタン --%>
  <tr class="sub">
   <td align="center" height="50px">
   <div id="chartbtn_margin">
    <a class="cp_btn" href="company?quote=<%--=dnode.get("req_code").asText()--%>&days=7">7日間</a>
   	<a class="cp_btn" href="company?quote=<%--=dnode.get("req_code").asText()--%>&days=30">30日間</a>
   </div>
   <%--</td>
  </tr>
  <tr class="sub">
   <td> --%>

 <!-- チャートはじめ -->

 <canvas id="myLineChart"></canvas>

<script>
  var ctx = document.getElementById("myLineChart");
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
    	  <%--for(int i=0;i<hnode.size();i++){--%>
    	  	<%--if(i!=0){--%>,<%--}--%>
    	  	'<%--=hnode.get(i).get("start_date").asText()--%>'
    	  <%--}--%>
    	  ],
      datasets: [
        {
          label: '株価',
          data: [
        	  <%--for(int i=0;i<hnode.size();i++){--%>
      	  	<%--if(i!=0){--%>,<%--}--%>
      	  	<%--=hnode.get(i).get("price").asDouble()--%>
      	  <%--}--%>
        	  ],
          borderColor: "rgba(255,0,0,1)",
          backgroundColor: "rgba(0,0,0,0)"
        }
      ],
    },
    options: {
      title: {
        display: true,
        text: '直近<%--=hnode.size()--%>日間の株価'
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
   <td><%--=dnode.get("v-name").asText() --%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">会社のお名前（英）</th>
   <td><%--=dnode.get("v-name_en").asText()--%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">一年間の成績発表月（決算期）</th>
   <td><%--=dnode.get("co_settle_fy_ended").asText()--%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">企業の大きさ（時価総額）</th>
   <td><%--=dnode.get("marketcap").asText()--%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">株主に渡す一部の利益（配当金）</th>
   <td><%--=dnode.get("co_settle_dps").asText()--%></td>
  </tr>
  <tr>
   <th width="30%" class="sub_point">配当利回り</th>
   <td><%--servletからデータ取得 --%></td>
  </tr>
  </table>

 <%--コメント送信 --%>
 <table class="comment_submit">
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
  <form>
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
    コメント内容
   </td>
  </tr>
 </table>

</div>
</body>
</html>