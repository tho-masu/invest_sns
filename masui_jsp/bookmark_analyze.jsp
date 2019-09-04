<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,api.CompanyAnalyzeBean,com.fasterxml.jackson.databind.JsonNode,com.fasterxml.jackson.databind.node.ArrayNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>分析</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>

<%
CompanyAnalyzeBean cabean = (CompanyAnalyzeBean)request.getAttribute("cabean");
JsonNode dnode = cabean.getDnode();
ArrayNode hnode = cabean.getHnode();
JsonNode epsNode = cabean.getEpsNode();
List<Double> gradientList = cabean.getGradientList();
List<Double> epsPchgList = cabean.getEpsPchgList();
List<List<Double>> incomePchgList = cabean.getIncomePchgList();
List<Double> bookmarkPortfolio = cabean.getBookmarkPortfolio();
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

<!-- チャートを入れるテーブルはじめ -->

<table align="center" border="1">
<tr><td>

<!-- チャートはじめ -->

 <canvas id="myLineChart" height="100px"></canvas>

<script>
  var ctx = document.getElementById("myLineChart");
  var myLineChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
    	  <%for(int i=0;i<bookmarkPortfolio.size()-2;i++){%>
    	  	<%if(i!=0){%>,<%}%>
    	  	'<%=12-i%>ヶ月前'
    	  <%}%>
    	  ,'先月末','現在'
    	  ],
      datasets: [
        {
          label: '株価',
          data: [
        	  <%for(int i=0;i<bookmarkPortfolio.size();i++){%>
      	  	<%if(i!=0){%>,<%}%>
      	  	<%=bookmarkPortfolio.get(i)%>
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
        text: 'ブックマークしている銘柄で仮に組んだポートフォリオの株価推移（各銘柄1株ずつ配分）'
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

  </td></tr>
</table>

<!-- チャートを入れるテーブル終わり -->


  <%--おすすめ企業 --%>
  <table align="center" width="80%" class="list">
    <tr>
      <th align="center" colspan="8" class="point_top">
        ブックマークしている企業の情報
      </th>
    </tr>
    <tr class="recommend">
    	<th class="company_name">
    		<b>企業名</b>
    	</th>
    	<th class="code_num">
    		<b>トレンド（最近1年間）</b>
    	</th>
    	<th class="stock_price">
    		<b>1株あたり利益の伸び率</b>
    	</th>
    	<th class="stock_price" colspan="5">
    		<b>過去5年間の本業利益成長率</b>
    	</th>
    </tr>
<%for(int i=0;i<dnode.size();i++){ %>
    <tr class="sub reco_info">
      <td>
      	<a class="widelink" href="<%=request.getContextPath() %>/masui_jsp/company?quote=<%=dnode.get(i).get("req_code").asText() %>"><%=dnode.get(i).get("v-name").asText() %></a>
      </td>
      <td>
      	<%if(gradientList.get(i) <= -0.2){ %>
      		<font color=blue><b>下降</b></font>
      	<%}else if(0.2 <= gradientList.get(i)){ %>
      		<font color=red><b>上昇</b></font>
      	<%}else{ %>
      		<font color=green><b>横ばい</b></font>
      	<%} %>
      	<br>
      	<%=Math.round( 1000 * gradientList.get(i) ) / 1000.0 %>
      </td>
      <td>
      	<%if(Math.round(epsPchgList.get(i)) <= 0){ %>
			<font color=blue><b><%=Math.round(epsPchgList.get(i)) %>%</b></font><br>
			<%=epsNode.get(i).get("value").get(0).get("co_qtr_settle_eps").asDouble() %>→<%=epsNode.get(i).get("value").get(1).get("co_qtr_settle_eps").asDouble() %>
		<%}else{ %>
			<font color=red><b><%=Math.round(epsPchgList.get(i)) %>%</b></font><br>
			<%=epsNode.get(i).get("value").get(0).get("co_qtr_settle_eps").asDouble() %>→<%=epsNode.get(i).get("value").get(1).get("co_qtr_settle_eps").asDouble() %>
		<%} %>
      </td>
    <%for(int j=0;j<incomePchgList.get(i).size();j++){ %>
      <td>
      	<%if(incomePchgList.get(i).get(j) <= 0){ %>
      		<font color=blue><%=incomePchgList.get(i).get(j) %>%</font>
      	<%}else{ %>
      		<font color=red><%=incomePchgList.get(i).get(j) %>%</font>
      	<%} %>
      </td>
    <%} %>
    </tr>
<%} %>
  </table>

</body>
</html>