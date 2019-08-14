<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<%
JsonNode dnode = (JsonNode)(request.getAttribute("dnode"));
JsonNode hnode = (JsonNode)(request.getAttribute("hnode"));
%>

<title>[<%=dnode.get("req_code").asText() %>] <%=dnode.get("v-name").asText() %></title>
</head>

<body>

 <%-- 企業の名前、株価、簡単な紹介 --%>
 <table border="1" width="1400">
   <tr>
     <td rowspan="2" align="center" width="300">晴れ</td>
     <td>企業名（株価）</td>
     <td>お買い得度（PER)</td>
     <td rowspan="2" align="center" width="300">ブックマーク</td>
   </tr>
   <tr>
     <td>簡単紹介</td>
     <td>企業の稼ぐ力（ROE)</td>
   </tr>
   <tr>
 </table>

 <%-- チャート --%>
 <table border="1" width="700" >
  <tr>
   <td>
   		チャート<br>

   		<a href="company?quote=<%=dnode.get("req_code").asText()%>&days=7">7日間</a> <a href="company?quote=<%=dnode.get("req_code").asText()%>&days=30">30日間</a> <br>

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
        text: '直近<%=hnode.size()%>日間の株価'
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
  <table border="1" width="700" >
  <tr>
   <td align="center">注目ポイント</td>
  </tr>
  <tr>
   <td>会社のお名前（和）：<%=dnode.get("v-name").asText() %></td>
  </tr>
  <tr>
   <td>会社のお名前（英）：<%=dnode.get("v-name_en").asText()%></td>
  </tr>
  <tr>
   <td>一年間の成績発表月（決算期）：<%=dnode.get("co_settle_fy_ended").asText()%></td>
  </tr>
  <tr>
   <td>企業の大きさ（時価総額）：<%=dnode.get("marketcap").asText()%></td>
  </tr>
  <tr>
   <td>株主に渡す一部の利益（配当金）：<%=dnode.get("co_settle_dps").asText()%></td>
  </tr>
  <tr>
   <td>（配当利回り）：</td>
  </tr>
  </table>

 <%--コメント送信 --%>
 <table border="1">
  <tr>
   <td>コメント欄</td>
  </tr>
  <form>
  <tr>
   <td>
     <textarea name="comment" rows="4" cols="40"></textarea>
   </td>
  </tr>
  <tr>
   <td>
     <input type="submit" value="送信">
   </td>
  </tr>
  </form>
 </table>

 <%-- コメント --%>
 <table border="1" width="500">
  <tr>
   <td>コメント</td>
  </tr>
  </table>

</body>
</html>