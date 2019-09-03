<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.fasterxml.jackson.databind.JsonNode,java.util.List,database.IndustryBean,database.CommentBean,database.UserBean"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>sample</title>

<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<%
JsonNode tnode = (JsonNode)request.getAttribute("tnode");
%>
<%
JsonNode hnode = (JsonNode)request.getAttribute("hnode");
%>

</head>

<body>

 <table class="chart">
  <%--見出し --%>
  <tr><td align="center" class="point_top">前日比騰落率(直近90日)</td></tr>
  <%--チャート期間変更ボタン --%>
  <tr class="sub">
   <td align="center" height="50px">


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
          label: '該当企業の前日比騰落率',
          data: [
        	  <%for(int i=0;i<hnode.size();i++){%>
      	  	<%if(i!=0){%>,<%}%>
      	  	<%=hnode.get(i).get("price_pchg").asDouble()%>
      	  <%}%>
        	  ],
          borderColor: "#CC66FF",
          fillColor : "rgba(255,0,0,1)",
          fullColor:"rgba(0,180,225,0.1)"
        },
        {
            label: '日経平均の前日比騰落率',
            data: [
            	<%for(int i=0;i<tnode.size();i++){%>
          	  	<%if(i!=0){%>,<%}%>
          	  	<%=tnode.get(i).get("price_pchg").asDouble()%>
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

      },
      scales: {
        yAxes: [{
          ticks: {
            callback: function(value, index, values){
              return  value +  '%'
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


<%-- 勝率の円グラフ入れる --%>

<%
int win = 0;
int lose = 0;
int equal = 0;

for(int i=0;i<hnode.size();i++){
	if (hnode.get(i).get("price_pchg").asDouble()-tnode.get(i).get("price_pchg").asDouble()>0){
		win += 1;
	}
	else if (hnode.get(i).get("price_pchg").asDouble()-tnode.get(i).get("price_pchg").asDouble()<0){
		lose += 1;
	}
	else{
		equal += 1;
	}
}
%>

 <table class="chart">
  <%--見出し --%>
  <tr><td align="center" class="point_top">(直近90日)前日比騰落率（日経平均と比べ）</td></tr>
  <%--チャート期間変更ボタン --%>
  <tr class="sub">
   <td align="center" height="50px">

<canvas id="myPieChart" ></canvas>


<script>
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["日経平均の前日比騰落率を上回る日", "日経平均の前日比騰落率を下回る日", "同じ"],
    datasets: [{
        backgroundColor: [
            "#f7950c",
            "#0aecfc",
            "#16fc05"
        ],
        data: [<%=win%>, <%=lose%>, <%=equal%>]
    }]
  },
  options: {
    title: {
      display: true,

    }
  }
});
</script>
<%--勝率の円グラフ終了 --%>

   </td>
  </tr>

  </table>

</body>
</html>