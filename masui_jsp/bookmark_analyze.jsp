<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,java.util.ArrayList,api.CompanyAnalyzeBean,com.fasterxml.jackson.databind.JsonNode,com.fasterxml.jackson.databind.node.ArrayNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>分析</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/hint.css" rel="stylesheet" type="text/css">

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
List<Integer> totalEvaluation = cabean.getTotalEvaluation();
%>

</head>

<body>

<jsp:include page="header.jsp" flush="true" />

 <%-- チャート --%>
 <table class="chart line_add">
  <%--見出し --%>
  <tr><td align="center" class="heading_title">チャート（ブックマークポートフォリオ）</td></tr>
	 <tr class="sub">
   <td align="center" height="50px">

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
  <table class="list line_add">
    <tr>
      <th align="center" colspan="9" class="heading_title">
        ブックマークしている企業の分析
      </th>
    </tr>
    <tr class="recommend">
    	<th class="company_name" nowrap>
    		<b>企業名</b>
    	</th>
    	<th class="code_num" nowrap>
    		<b><span class="hint--top hint--rounded" data-hint="下部の値はinvestagramがチャートを分析して算出した独自のものです">トレンド<jsp:include page="question.jsp" flush="true" /></span><br>（最近1年間）</b>
    	</th>
    	<th class="stock_price" nowrap>
    		<b><span class="hint--top hint--rounded" data-hint="EPS（1株あたり純利益）のことを指しています（単位：円）">1株あたり利益<jsp:include page="question.jsp" flush="true" /></span><br>の伸び率</b>
    	</th>
    	<th class="stock_price" colspan="5" nowrap>
    		<b>過去5年間の<span class="hint--top hint--rounded" data-hint="営業利益のことを指しています">本業利益<jsp:include page="question.jsp" flush="true" /></span>成長率</b>
    	</th>
    	<th nowrap>
    		<span class="hint--top hint--rounded" data-hint="左の3つの基準をもとにした総合評価です">オススメ度<br>（0～6）<jsp:include page="question.jsp" flush="true" /></span>
    	</th>
    </tr>
<%for(int i=0;i<dnode.size();i++){ %>
    <tr class="sub reco_info backcolor">
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
      		<%if(incomePchgList.get(i).get(j) == 0.0){ %>
      			<font color=blue>(NoData)</font>
      		<%}else{ %>
      			<font color=blue><%=incomePchgList.get(i).get(j) %>%</font>
      		<%} %>
      	<%}else{ %>
      		<font color=red><%=incomePchgList.get(i).get(j) %>%</font>
      	<%} %>
      </td>
    <%} %>
      <td align="center">
      	<%if(totalEvaluation.get(i) >= 5){ %>
      		<font color="red" size="<%=totalEvaluation.get(i) + 3 %>"><%=totalEvaluation.get(i) %></font>
      	<%}else if(totalEvaluation.get(i) == 4){ %>
      		<font color="orange" size="<%=totalEvaluation.get(i) + 3 %>"><%=totalEvaluation.get(i) %></font>
      	<%}else if(totalEvaluation.get(i) == 3){ %>
      		<font color="green" size="<%=totalEvaluation.get(i) + 3 %>"><%=totalEvaluation.get(i) %></font>
      	<%}else{ %>
      		<font color="blue" size="<%=totalEvaluation.get(i) + 3 %>"><%=totalEvaluation.get(i) %></font>
      	<%} %>
      </td>
    </tr>
<%} %>
  </table>


  <table class="industry_overview">
    <tr height="220px">
      <td class="overview">
        <h3>銘柄評価基準</h3>
        <p>
        	以上の分析は<span class="hint--top hint--rounded" data-hint="米国の著名投資家ウィリアム・オニールが提唱した、急成長する見込みのある大化け株を選定する方法">CAN-SLIM投資法<jsp:include page="question.jsp" flush="true" /></span>
        	の銘柄選定基準の一部を採用した分析です。<br><br>
        	<b>■CAN-SLIM投資法のエッセンス</b><br><br>
        	・<b><span class="hint--top hint--rounded" data-hint="Current Quarterly Earnings">C</span> … 直近の四半期のEPS（1株当たり純利益）が最低でも20%は増加し勢いよく成長している</b><br>
        	・<b><span class="hint--top hint--rounded" data-hint="Annual Earnings Increases">A</span> … 過去五年間に年間の利益が増加し、意味のある成長が認められる</b><br>
        	・<span class="hint--top hint--rounded" data-hint="Newer Companies,New Prodcts ,New Xxx New Hight Off Properly Formed Bases">N</span> … 株価がボックス圏を抜けて年初来高値、昨年来高値、上場来高値などをつけている<br>
        	・<span class="hint--top hint--rounded" data-hint="Supply and Demand">S</span> … 発行済み株式数が少なく、株式の需給の法則から値上がりしやすい小型株<br>
        	・<span class="hint--top hint--rounded" data-hint="Leader or Laggard">L</span> … 少なくとも業界の上位2,3社に入っていて相場を主導する銘柄である<br>
        	・<span class="hint--top hint--rounded" data-hint="Institutional Sponsorship">I</span> … 有力な機関投資家が保有している<br>
        	・<b><span class="hint--top hint--rounded" data-hint="Market Direction">M</span> … 相場全体のトレンドが悪くなく、下降トレンドではない</b><br>　
        </p>
      </td>
      <%--業界の関連画像表示 --%>
      <td class="oneal">
        <div class="william">
          <img src="<%=request.getContextPath() %>/img/oneil.jpg" width="200px" height="auto">
          <p>ウィリアム・オニール</p>
        </div>
      </td>
    </tr>
  </table>

</body>
</html>