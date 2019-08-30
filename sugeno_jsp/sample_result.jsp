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

</head>

<body>


<!-- チャートを入れるテーブルはじめ -->

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
    	color:'rgba(141, 252, 81,0.5)'


    }
  };
var data = [trace];
Plotly.newPlot('myDiv', data, {}, {showSendToCloud: true});

</script>
 	<!-- チャート終わり -->

    </td>
  </tr>
</table>

<!-- チャートを入れるテーブル終わり -->


</body>
</html>