<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,api.CompanyAnalyzeBean,com.fasterxml.jackson.databind.JsonNode"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="UTF-8">

<title>分析</title>
<link href="<%=request.getContextPath()%>/css/default.css" rel="stylesheet" type="text/css">
</head>

<%
CompanyAnalyzeBean cabean = (CompanyAnalyzeBean)request.getAttribute("cabean");
JsonNode dnode = cabean.getDnode();
List<Double> gradientList = cabean.getGradientList();
List<Double> epsPchgList = cabean.getEpsPchgList();
List<List<Double>> incomePchgList = cabean.getIncomePchgList();
%>

<body>

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
    		<b>トレンド（直近6ヶ月）</b>
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
      	<%if(gradientList.get(i) <= -1.0){ %>
      		<font color=blue><b>下降</b></font>
      	<%}else if(1.0 <= gradientList.get(i)){ %>
      		<font color=red><b>上昇</b></font>
      	<%}else{ %>
      		<font color=green><b>横ばい</b></font>
      	<%} %>
      	<%=gradientList.get(i) %>
      </td>
      <td>
      	<%if(Math.round(epsPchgList.get(i)) <= 0){ %>
			<font color=blue><b><%=Math.round(epsPchgList.get(i)) %>%</b></font>
		<%}else{ %>
			<font color=red><b><%=Math.round(epsPchgList.get(i)) %>%</b></font>
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