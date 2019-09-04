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
JsonNode hcnode = (JsonNode)request.getAttribute("hcnode");
%>
<%
JsonNode hnode = (JsonNode)request.getAttribute("hnode");
%>
<%--JsonNode ynode = (JsonNode)request.getAttribute("ynode");--%>


</head>

<body>

<!-- チャートを入れるテーブルはじめ -->
<%-- --%>
<table width="800px" align="center">
  <tr>
    <td class="point_top">前日比騰落率の分布</td>
  </tr>
  <tr class="sub">
    <td>
	<!-- チャートはじめ -->

 <div id="myDiv"></div>
<script>
var x = [
		<%for(int i=0;i<hnode.size();i++){%>
		<%if(i!=0){%>,<%}%>
		<%=hnode.get(i).get("price_pchg").asDouble()%>
		<%}%>];


var trace = {
    x: x,
    type: 'histogram',
    marker:{
    	color:'rgba(42, 101, 250,1)'
    },
    xbins:{
    	size: 0.5
    }
  };
var layout = {
		xaxis: {title: "前日比騰落率（％）"},
		yaxis: {title: "日数"},
		bargap: 0.3,
		shapes:[
			{
				type:'line',
				x0: 0,
				y0: 0,
				x1: 0,
				y1: 50,
				line:{
					color:'rgb(250, 27, 139)',
					width:1
				}
			}
		]
};
var data = [trace];
Plotly.newPlot('myDiv', data, layout);

</script>
 	<!-- チャート終わり -->

    </td>
  </tr>
</table>

<!-- チャートを入れるテーブル終わり -->

<%
int win = 0;
int lose = 0;
int equal = 0;

for(int i=0;i<hnode.size();i++){
	if (hnode.get(i).get("price_pchg").asDouble()>0){
		win += 1;
	}
	else if (hnode.get(i).get("price_pchg").asDouble()<0){
		lose += 1;
	}
	else{
		equal += 1;
	}
}
%>
<%-- 勝率の円グラフ入れる --%>
<table>
  <tr>
    <td class="point_top">円グラフ</td>
  </tr>
  <tr class="sub">
    <td>
<canvas id="myPieChart"></canvas>

<script>
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["上昇日", "下落日", "変化なし"],
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
      text: '前日比騰落率のグラフ'
    }
  }
});
</script>
<%--勝率の円グラフ終了 --%>
</td>
  </tr>
</table>

<div id="mychart"></div>

<script>
var high = [
	<%for(int i=0;i<hnode.size();i++){%>
	<%if(i!=0){%>,<%}%>
	<%=hnode.get(i).get("price_high").asDouble()%>
	<%}%>];

var low = [
	<%for(int i=0;i<hnode.size();i++){%>
	<%if(i!=0){%>,<%}%>
	<%=hnode.get(i).get("price_low").asDouble()%>
	<%}%>];

var date = [
	<%for(int i=0;i<hnode.size();i++){%>
	<%if(i!=0){%>,<%}%>
	<%=hnode.get(i).get("start_date").asText()%>
	<%}%>];


var trace1 = {
		  type: "scatter",
		  mode: "lines",
		  name: 'High_price',
		  x: date,
		  y: high,
		  line: {color: '#17BECF'}
		}

		var trace2 = {
		  type: "scatter",
		  mode: "lines",
		  name: 'Low_price',
		  x: date,
		  y: low,
		  line: {color: '#7F7F7F'}
		}

		var data = [trace1,trace2];

		var layout = {
		  title: 'Basic Time Series',
		};

		Plotly.newPlot('mychart', data, layout);
		})

</script>

<canvas id="doublechart"></canvas>

<script type="text/javascript">
        var ctx = document.getElementById('doublechart').getContext('2d');
        var doublechart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [<%for(int i=0;i<hnode.size();i++){%>
            			<%if(i!=0){%>,<%}%>
            			<%=hnode.get(i).get("start_date").asText()%>
            			<%}%>],
                datasets: [{
                    label: '折れ線A',
                    type: "line",
                    fill: false,
                    data: [<%for(int i=0;i<hnode.size();i++){%>
                		<%if(i!=0){%>,<%}%>
                		<%=hnode.get(i).get("price_high").asDouble()%>
                		<%}%>],
                    borderColor: "rgb(154, 162, 235)",
                    yAxisID: "y-axis-1",
                }, {
                    label: '折れ線B',
                    type: "line",
                    fill: false,
                    data: [<%for(int i=0;i<hnode.size();i++){%>
                		<%if(i!=0){%>,<%}%>
                		<%=hnode.get(i).get("price_low").asDouble()%>
                		<%}%>],
                    borderColor: "rgb(54, 162, 235)",
                    yAxisID: "y-axis-1",
                }]
            },
            options: {
                tooltips: {
                    mode: 'nearest',
                    intersect: false,
                },
                responsive: true,
                scales: {
                    yAxes: [{
                        id: "y-axis-1",
                        type: "linear",
                        position: "left"
                    }, {
                        id: "y-axis-2",
                        type: "linear",
                        position: "right",
                        gridLines: {
                            drawOnChartArea: false,
                        },
                    }],
                },
            }
        });

</script>

</body>
</html>